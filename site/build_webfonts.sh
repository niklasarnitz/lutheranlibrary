#!/bin/sh
# Subset the reader's typefaces to WOFF2: Libertinus (OFL) and TeX Gyre Pagella /
# Latin Modern (GUST Font License), the fonts the LaTeX sources are set in.
# Usage: build_webfonts.sh <libertinus OTF dir> <dir to search for TeX fonts> <output dir>
set -eu
lib=$1; tex=$2; out=$3
mkdir -p "$out"
ranges="U+0000-024F,U+0259,U+02B0-02FF,U+0300-036F,U+0370-03FF,U+1E00-1FFF,U+2000-206F,U+2070-209F,U+20A0-20CF,U+2100-218F,U+2190-21FF,U+2200-22FF,U+25CA,U+FB00-FB06"
find_font() { find "$tex" -name "$1" -print -quit; }
subset() {
  test -s "$1" || { echo "missing font $1" >&2; exit 1; }
  pyftsubset "$1" --output-file="$out/$2.woff2" --flavor=woff2 --unicodes="$ranges" --layout-features='*' --name-IDs='*'
}
subset "$lib/LibertinusSerif-Regular.otf" libertinus-regular
subset "$lib/LibertinusSerif-Italic.otf" libertinus-italic
subset "$lib/LibertinusSerif-Semibold.otf" libertinus-semibold
subset "$lib/LibertinusSerif-Bold.otf" libertinus-bold
subset "$lib/LibertinusSerif-BoldItalic.otf" libertinus-bolditalic
subset "$(find_font texgyrepagella-regular.otf)" pagella-regular
subset "$(find_font texgyrepagella-italic.otf)" pagella-italic
subset "$(find_font texgyrepagella-bold.otf)" pagella-bold
subset "$(find_font texgyrepagella-bolditalic.otf)" pagella-bolditalic
subset "$(find_font lmroman10-regular.otf)" lmodern-regular
subset "$(find_font lmroman10-italic.otf)" lmodern-italic
subset "$(find_font lmroman10-bold.otf)" lmodern-bold
subset "$(find_font lmroman10-bolditalic.otf)" lmodern-bolditalic
