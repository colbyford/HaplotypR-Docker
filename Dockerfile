FROM rocker/rstudio:3.6.3

MAINTAINER Colby T. Ford <colby.ford@uncc.edu>

## Install R packages from CRAN
RUN install2.r --error \
    devtools \
    git2r

## Install packages from GitHub
RUN R -e "library(devtools) \
	library(git2r) \
	\
	path <- file.path(tempfile(pattern='Rswarm-'), 'Rswarm') \
	dir.create(path, recursive=TRUE) \
	repo <- clone('https://github.com/lerch-a/Rswarm.git', path) \
	clone('https://github.com/torognes/swarm.git', file.path(path, 'src', 'swarm')) \
	install(path) \
	\
	path <- file.path(tempfile(pattern='Rvsearch-'), 'Rvsearch') \
	dir.create(path, recursive=TRUE) \
	repo <- clone('https://github.com/lerch-a/Rvsearch.git', path) \
	clone('https://github.com/torognes/vsearch.git', file.path(path, 'src', 'vsearch'), branch=) #v2.15.0 \
	install(path) \
	\
	path <- file.path(tempfile(pattern='NGmergeR-'), 'NGmergeR') \
	dir.create(path, recursive=TRUE) \
	repo <- clone('https://github.com/lerch-a/NGmergeR.git', path) \
	clone('https://github.com/harvardinformatics/NGmerge.git', file.path(path, 'src', 'NGmerge')) \
	install(path) \
	\
	devtools::install_github('lerch-a/HaplotypR')"