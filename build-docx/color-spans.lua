-- color-spans.lua -- pandoc lua filter to style inline code and code blocks
local stringify = pandoc.utils.stringify

-- Helper: check if table contains value
local function contains(t, v)
  for _, x in ipairs(t) do if x == v then return true end end
  return false
end

-- CodeBlock -> LaTeX tcolorbox or HTML wrapper
function CodeBlock(cb)
  local content = cb.text or ""
  if FORMAT:match("latex") then
    return {
      pandoc.RawBlock('latex', '\\CodeBoxBegin'),
      pandoc.RawBlock('latex', '\\begin{verbatim}'),
      pandoc.RawBlock('latex', content),
      pandoc.RawBlock('latex', '\\end{verbatim}'),
      pandoc.RawBlock('latex', '\\CodeBoxEnd')
    }
  elseif FORMAT:match("html") then
    local lang = cb.classes[1] or ""
    local safe = pandoc.utils.stringify(cb)
    local html = '<div class="codebox"><pre><code class="language-' .. pandoc.utils.stringify(lang) .. '">' ..
                  pandoc.utils.stringify(content) .. '</code></pre></div>'
    return pandoc.RawBlock('html', html)
  else
    return nil
  end
end

-- Inline code -> \InlineCode{...} (LaTeX) or <code class="inline-code">...</code> (HTML)
function Code(el)
  local txt = stringify(el)
  if FORMAT:match("latex") then
    return pandoc.RawInline('latex', '\\InlineCode{' .. pandoc.utils.stringify(el) .. '}')
  elseif FORMAT:match("html") then
    return pandoc.RawInline('html', '<code class="inline-code">' .. pandoc.utils.stringify(el) .. '</code>')
  else
    return el
  end
end
