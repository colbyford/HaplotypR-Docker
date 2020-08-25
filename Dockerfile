FROM rocker/verse
# FROM rocker/rstudio:3.5.3

MAINTAINER Colby T. Ford <colby.ford@uncc.edu>

ENV DISABLE_AUTH=true

## Install zlib library
RUN \
  apt-get update && \
  apt-get install -y zlib1g-dev

## Install R packages from CRAN
#RUN R -e "install.packages('git2r', dependencies = TRUE, repos = 'http://cran.rstudio.com/')"
# RUN R -e "install.packages('‘roxygen2’', dependencies = TRUE, repos = 'http://cran.rstudio.com/')"
# RUN R -e "install.packages('‘rversions’', dependencies = TRUE, repos = 'http://cran.rstudio.com/')"
# RUN R -e "install.packages('git2r', type='source', configure.vars='autobrew=yes', repos = 'http://cran.rstudio.com/')"
#RUN R -e "install.packages('remotes', dependencies = FALSE, repos = 'http://cran.rstudio.com/')"

# RUN install2.r --error \
#     devtools \
#     git2r

## Install packages from GitHub
RUN mkdir -p /tmp
COPY install_haplotypr.R /tmp/install_haplotypr.R
RUN Rscript /tmp/install_haplotypr.R

EXPOSE 8787