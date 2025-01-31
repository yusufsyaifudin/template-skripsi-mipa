# References:
# 
# https://stackoverflow.com/questions/55312675/docker-alpine-texlive-error-tlmgr-not-found

# FROM alpine:3.9

# ENV PATH=/usr/local/texlive/bin/x86_64-linuxmusl:$PATH

# RUN apk add --update
# RUN apk add --no-cache bash perl wget

# RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
# RUN tar -xzf install-tl-unx.tar.gz && cd install-tl-20* && ./install-tl

# RUN apk add --no-cache \
#         texlive \
#         texlive-xetex \
#         texmf-dist \
#         texmf-dist-formatsextra \
#         texmf-dist-latexextra \
#         texmf-dist-pictures \
#         texmf-dist-science


# RUN which tlmgr
# # RUN tlmgr install fontawesome

# RUN ["/bin/sh"]

# syntax=docker/dockerfile:1
# Reference: 
# * http://johnbokma.com/blog/2021/06/18/running-pdflatex-using-alpine-pandoc-latex-image.html
# * https://stackoverflow.com/questions/55312675/docker-alpine-texlive-error-tlmgr-not-found
FROM pandoc/latex:3.1.1.0-alpine

RUN tlmgr update --self && tlmgr install sectsty lastpage helvetic

# https://github.com/latex3/babel/blob/v.3.92/locale/id/babel-indonesian.tex
RUN tlmgr install babel-english babel-indonesian

# https://www.ctan.org/pkg/nomencl
RUN tlmgr install nomencl

# https://www.ctan.org/pkg/tocbasic (tocbasic)
RUN tlmgr install koma-script

# https://www.ctan.org/pkg/pbox
RUN tlmgr install pbox

# https://www.ctan.org/pkg/enumitem
RUN tlmgr install enumitem

# https://www.ctan.org/pkg/bera (beramono)
RUN tlmgr install bera

# https://www.ctan.org/pkg/tocloft
RUN tlmgr install tocloft

# https://tex.stackexchange.com/questions/155309/mktextfm-ptmr8t-errors
# Fix this error:
# ! I can't find file `ptmr8t'.
RUN tlmgr install collection-fontsrecommended

# https://www.ctan.org/pkg/natbib
# For bibliography
RUN tlmgr install natbib

# For longtable support https://tex.stackexchange.com/questions/639452/create-long-table-in-latex
# https://github.com/lvjr/tabularray
# need ninecolors
RUN tlmgr install tabularray
RUN tlmgr install varwidth
RUN tlmgr install ninecolors
RUN tlmgr install tablefootnote
RUN tlmgr install xifthen

# footnote: https://ctan.org/pkg/footnote
RUN tlmgr install mdwtools

# equation
RUN tlmgr install amsmath

# pgfgantt
# https://tex.stackexchange.com/a/63915
RUN tlmgr install pgfgantt

RUN tlmgr install pdfpages

RUN tlmgr install xcolor

# For rotation
RUN tlmgr install adjustbox
RUN tlmgr install collectbox
RUN tlmgr install ucs

# For package CJKutf8 (Chinese character)
RUN tlmgr install cjk

ENTRYPOINT ["pdflatex"]
