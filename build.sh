#!/usr/bin/env bash
# build.sh -- build per-chapter and combined outputs
# Usage: ./build.sh [output_basename]
set -e

OUTBASE="${1:-python_guide_full}"
MD_FILES=(chuong1.md chuong2.md chuong3.md chuong4.md chuong5.md chuong6.md chuong7.md)

# Create outputs dir
mkdir -p outputs

# Build per-chapter DOCX and PDF
for md in "${MD_FILES[@]}"; do
  if [ ! -f "$md" ]; then
    echo "No $md found, skipping."
    continue
  fi
  base=$(basename "$md" .md)
  out_docx="outputs/${base}.docx"
  out_pdf="outputs/${base}.pdf"
  echo "Building $out_docx and $out_pdf from $md ..."
  # DOCX
  pandoc "$md" -o "$out_docx" --standalone --toc --metadata title="$base" --highlight-style=tango
  # PDF: use header.tex + lua-filter if present
  if [ -f header.tex ] && [ -f color-spans.lua ]; then
    pandoc "$md" -o "$out_pdf" --pdf-engine=xelatex \
      -V geometry:margin=2cm -V papersize:a4 -V fontsize=11pt \
      --toc --highlight-style=tango \
      --include-in-header=header.tex --lua-filter=color-spans.lua || true
  else
    pandoc "$md" -o "$out_pdf" --pdf-engine=xelatex \
      -V geometry:margin=2cm -V papersize:a4 -V fontsize=11pt \
      --toc --highlight-style=tango || true
  fi
  ls -lh "$out_docx" "$out_pdf" || true
done

# Build combined document if exists
if [ -f "python_guide_full.md" ]; then
  echo "Building combined outputs for python_guide_full.md ..."
  pandoc python_guide_full.md -o outputs/${OUTBASE}.docx --standalone --toc --metadata title="Tài liệu Python chuyên sâu (Phần 1+2)" --highlight-style=tango
  if [ -f header.tex ] && [ -f color-spans.lua ]; then
    pandoc python_guide_full.md -o outputs/${OUTBASE}.pdf --pdf-engine=xelatex \
      -V geometry:margin=2cm -V papersize:a4 -V fontsize=11pt \
      --toc --highlight-style=tango \
      --include-in-header=header.tex --lua-filter=color-spans.lua || true
  else
    pandoc python_guide_full.md -o outputs/${OUTBASE}.pdf --pdf-engine=xelatex \
      -V geometry:margin=2cm -V papersize:a4 -V fontsize=11pt \
      --toc --highlight-style=tango || true
  fi
  ls -lh outputs/${OUTBASE}.* || true
fi

echo "All done. Outputs are in the 'outputs' directory."
