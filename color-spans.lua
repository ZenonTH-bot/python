-- color-spans.lua -- pandoc lua filter
-- Purpose: style inline code and code blocks differently for LaTeX and HTML outputs.
-- Usage: pandoc --lua-filter=color-spans.lua --include-in-header=header.tex

local stringify = pandoc.utils.stringify

local function contains(t, v)
  for _, x in ipairs(t) do if x == v then return true end end
  return false
end

-- For CodeBlock: wrap into LaTeX tcolorbox or HTML <pre><code class="..."> with wrapper
function CodeBlock(cb)
  local attrs = {}
  if #cb.classes > 0 then attrs.class = cb.classes[1] end
  local content = cb.text

  if FORMAT:match("latex") then
    -- Wrap with macros defined in header.tex
    return {
      pandoc.RawBlock('latex', '\\CodeBoxBegin'),
      pandoc.RawBlock('latex', '\\begin{verbatim}'),
      pandoc.RawBlock('latex', content),
      pandoc.RawBlock('latex', '\\end{verbatim}'),
      pandoc.RawBlock('latex', '\\CodeBoxEnd')
    }
  elseif FORMAT:match("html") then
    -- HTML: preserve language class if present
    local lang = cb.classes[1] or ""
    local html = '<div class="codebox"><pre><code class="language-' .. pandoc.utils.stringify(lang) .. '">' ..
                  pandoc.utils.stringify(content) .. '</code></pre></div>'
    return pandoc.RawBlock('html', html)
  else
    return nil
  end
end

-- Inline code -> \InlineCode{...} in LaTeX, <code class="inline-code">...</code> in HTML
function Code(el)
  local txt = stringify(el)
  if FORMAT:match("latex") then
    -- Escape LaTeX special characters inside InlineCode? Use \texttt via macro for simplicity
    return pandoc.RawInline('latex', '\\InlineCode{' .. pandoc.utils.stringify(el) .. '}')
  elseif FORMAT:match("html") then
    return pandoc.RawInline('html', '<code class="inline-code">' .. pandoc.utils.stringify(el) .. '</code>')
  else
    return el
  end
end