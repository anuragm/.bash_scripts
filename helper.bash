## Helper functions ##
function gl() { # Better Git log
    git log --graph --abbrev-commit --decorate ${1:--10}\
        --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)%>(12,trunc)%ar%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'
}

compresspdf() { #Script to compress PDFs
    echo 'Usage: compresspdf [input file] [output file] [screen|ebook|printer|prepress]'
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}
