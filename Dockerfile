# Typesets every book and serves the static site. Build: docker build -t lutheranlibrary .
FROM debian:trixie-20261020-slim AS fonts
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates unzip && rm -rf /var/lib/apt/lists/*
# Libertinus is only packaged inside Debian's 1.7 GB texlive-fonts-extra.
RUN curl -fsSL https://github.com/alerque/libertinus/releases/download/v7.051/Libertinus-7.051.zip -o /tmp/l.zip && \
    echo "4d9be29b5cb380c35af8ba967abcc752ad1e07be1f738a9789c33e0dd7478c92  /tmp/l.zip" | sha256sum -c - && \
    unzip -q /tmp/l.zip -d /tmp && mkdir -p /fonts && cp /tmp/Libertinus-7.051/static/OTF/*.otf /tmp/Libertinus-7.051/OFL.txt /fonts/

FROM debian:trixie-20261020-slim AS build
ENV DEBIAN_FRONTEND=noninteractive PYTHONDONTWRITEBYTECODE=1 PIP_NO_CACHE_DIR=1
RUN apt-get update && apt-get install -y --no-install-recommends \
      python3 python3-venv zip \
      texlive-luatex texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended \
      texlive-lang-german texlive-lang-english texlive-lang-greek texlive-plain-generic \
      texlive-extra-utils tex4ht fonts-texgyre fonts-lmodern \
    && rm -rf /var/lib/apt/lists/* /usr/share/doc/*
COPY --from=fonts /fonts /usr/local/share/fonts/libertinus
COPY site/requirements.txt /tmp/
RUN python3 -m venv /venv && /venv/bin/pip install -r /tmp/requirements.txt fonttools==4.68.0 brotli==1.2.1
ENV PATH=/venv/bin:$PATH
WORKDIR /src
COPY site/build_webfonts.sh site/
RUN site/build_webfonts.sh /usr/local/share/fonts/libertinus /usr/share site/static/fonts
COPY . .
RUN python3 -m unittest discover -s site
# The typesetting cache survives between builds on the same builder, so only changed books are typeset.
RUN --mount=type=cache,target=/src/.cache python3 site/build.py --out /public --jobs 2

FROM nginx:1.31.6-alpine
COPY site/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /public /usr/share/nginx/html
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://127.0.0.1:8080/health/ >/dev/null || exit 1
