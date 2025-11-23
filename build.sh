#!/usr/bin/env bash
# Build script: generates HTML, PDF, DOCX with code highlighting
# Usage: ./build.sh [output_basename]
OUTBASE="${1:-python_guide_full}"
MD_FILES=(chuong1.md chuong2.md chuong3.md chuong4.md chuong5.md chuong6.md chuong7.md)

# Check pandoc
if ! command -v pandoc >/dev/null 2>&1; then
  echo "pandoc not found. Install pandoc and try again."
  exit 1
fi

# Build HTML (with CSS)
echo "Building HTML..."
pandoc "${MD_FILES[@]}" -s -o "${OUTBASE}.html" --toc \
  --css=code-style.css --highlight-style=tango \
  --metadata title="Tài liệu Python chuyên sâu (Phần 1+2)"

# Build PDF using xelatex (uses header.tex and lua filter)
echo "Building PDF (xelatex)..."
pandoc "${MD_FILES[@]}" -o "${OUTBASE}.pdf" --pdf-engine=xelatex \
  --include-in-header=header.tex --lua-filter=color-spans.lua \
  -V geometry:margin=2cm -V papersize:a4 -V fontsize=11pt --toc --highlight-style=tango \
  --metadata title="Tài liệu Python chuyên sâu (Phần 1+2)"

# Build DOCX (if you have a reference.docx to control styles)
if [ -f reference.docx ]; then
  echo "Building DOCX using reference.docx..."
  pandoc "${MD_FILES[@]}" -o "${OUTBASE}.docx" --reference-doc=reference.docx --toc --highlight-style=tango \
    --metadata title="Tài liệu Python chuyên sâu (Phần 1+2)"
else
  echo "Building DOCX (no reference.docx present)..."
  pandoc "${MD_FILES[@]}" -o "${OUTBASE}.docx" --toc --highlight-style=tango \
    --metadata title="Tài liệu Python chuyên sâu (Phần 1+2)"
fi

echo "Done. Outputs: ${OUTBASE}.html, ${OUTBASE}.pdf, ${OUTBASE}.docx"