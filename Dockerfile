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
FROM pandoc/latex:3.10.0.0-alpine

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

# 1. Lock Node.js binaries to version 24.19.0 (LTS) from official Node Alpine image
COPY --from=node:24.19.0-alpine /usr/local/bin/node /usr/local/bin/node
COPY --from=node:24.19.0-alpine /usr/local/lib/node_modules /usr/local/lib/node_modules
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
    ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx

# 2. Install Chromium and rendering fonts for Alpine
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont

# 3. Configure Puppeteer path for native Alpine Chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# 4. Pin @mermaid-js/mermaid-cli to version 11.16.0
RUN npm install -g @mermaid-js/mermaid-cli@11.16.0

# 5. Create Puppeteer config and wrap mmdc to automatically include -p /puppeteer-config.json
RUN echo '{"args": ["--no-sandbox", "--disable-setuid-sandbox"]}' > /puppeteer-config.json && \
    mv /usr/local/bin/mmdc /usr/local/bin/mmdc-original && \
    echo '#!/bin/sh' > /usr/local/bin/mmdc && \
    echo 'exec /usr/local/bin/mmdc-original -p /puppeteer-config.json "$@"' >> /usr/local/bin/mmdc && \
    chmod +x /usr/local/bin/mmdc

# 6. Install TeX packages including ltmermaid
RUN tlmgr option repository https://mirror.ctan.org/systems/texlive/tlnet && \
    tlmgr update --self && \
    tlmgr install \
    sectsty lastpage helvetic \
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
    caption ulem pdflscape \
    tcolorbox \
    tikzfill \
    fontawesome

ENTRYPOINT ["pdflatex"]