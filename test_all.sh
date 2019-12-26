#!/bin/bash

function dockertl () {
  docker run --rm --mount type=bind,src=$(pwd),dst=/workdir doratex/texlive2019ja-haranoaji $@
}

(cd "$(dirname $0)"

  (cd toml
    dockertl
  )
  
  (cd platex+dvipdfmx
    dockertl llmk platex
    dockertl llmk platex-otf
  )
  
  (cd platex+dvips
    dockertl llmk platex
    dockertl llmk platex-otf
  )
  
  (cd uplatex+dvipdfmx
    dockertl llmk uplatex
    dockertl llmk uplatex-otf
  )
  
  (cd uplatex+dvips
    dockertl llmk uplatex
    dockertl llmk uplatex-otf
  )
  
  (cd xelatex
    dockertl llmk xelatex
  )
  
  find . \( -name "*.ps" -or  -name "*.dvi" -or -name "*.synctex" -or -name "*.synctex.gz" -or -name "*.synctex.gz(busy)" -or -name "*.log" -or -name "*.aux" -or -name "*.fls" \) -print -exec rm -f {} \;
)