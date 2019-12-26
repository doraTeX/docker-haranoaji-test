#!/bin/bash

(cd "$(dirname $0)"
  find . \( -name "*.pdf" -or -name "*.ps" -or  -name "*.dvi" -or -name "*.synctex" -or -name "*.synctex.gz" -or -name "*.synctex.gz(busy)" -or -name "*.log" -or -name "*.aux" -or -name "*.fls" \) -print -exec rm -f {} \;
)