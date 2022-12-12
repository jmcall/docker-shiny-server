FROM rocker/shiny:latest

RUN apt-get update && apt-get install -y \
    git-core \
    libssl-dev \
    libcurl4-gnutls-dev \
    curl \
    libsodium-dev \
    libxml2-dev \
    libicu-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV _R_SHLIB_STRIP_=true

COPY Rprofile.site /etc/R

# basic shiny functionality
RUN R -e "install.packages(c('shiny','shinydashboard','flexdashboard','shinyWidgets','shinyalert', 'rmarkdown','xml2'), repos='https://cloud.r-project.org/')"

COPY ./apps/ /srv/shiny-server/
COPY ./config/ /etc/shiny-server/

USER shiny

EXPOSE 3838

CMD ["/usr/bin/shiny-server"]