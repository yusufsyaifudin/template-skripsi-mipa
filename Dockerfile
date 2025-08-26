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
# Use ubuntu because Alpine image for this version not support ARM architecture
FROM pandoc/latex:3.7.0.2-alpine

# https://github.com/latex3/babel/blob/v.3.92/locale/id/babel-indonesian.tex
# https://www.ctan.org/pkg/nomencl
# https://www.ctan.org/pkg/tocbasic (tocbasic)
# https://www.ctan.org/pkg/pbox
# https://www.ctan.org/pkg/enumitem
# https://www.ctan.org/pkg/bera (beramono)
# https://www.ctan.org/pkg/tocloft
# https://tex.stackexchange.com/questions/155309/mktextfm-ptmr8t-errors
# https://www.ctan.org/pkg/natbib For bibliography
# For longtable support https://tex.stackexchange.com/questions/639452/create-long-table-in-latex
# https://github.com/lvjr/tabularray
# need ninecolors
# footnote: https://ctan.org/pkg/footnote
# equation
# pgfgantt https://tex.stackexchange.com/a/63915
# For rotation: adjustbox collectbox ucs
# To arrange three pictures in a single row with three columns in LaTeX, you can use the subfigure package from the subcaption bundle. This approach is highly recommended as it provides excellent control over captions and spacing.
# https://ctan.org/pkg/subcaption The package is distributed with caption.
RUN tlmgr update --self && \
    tlmgr install sectsty lastpage helvetic \
    babel-english babel-indonesian \
    nomencl \
    koma-script \
    pbox \
    enumitem \
    bera \
    tocloft \
    collection-fontsrecommended \
    natbib \
    tabularray varwidth ninecolors tablefootnote xifthen \
    mdwtools \
    amsmath \
    pgfgantt \
    pdfpages \
    xcolor \
    adjustbox collectbox ucs \
    caption ulem pdflscape

ENTRYPOINT ["pdflatex"]
