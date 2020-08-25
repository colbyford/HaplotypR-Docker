install.packages("latticeExtra")

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("Biostrings")

install.packages("dplyr")
install.packages("remotes")
remotes::install_github("Bioconductor/Biobase")
remotes::install_github("Bioconductor/ShortRead")

BiocManager::install("SummarizedExperiment")
BiocManager::install("ShortRead")

###################################

library(devtools)
library(git2r)

path <- file.path(tempfile(pattern="Rswarm-"), "Rswarm")
dir.create(path, recursive=TRUE)
repo <- clone("https://github.com/lerch-a/Rswarm.git", path)
clone("https://github.com/torognes/swarm.git", file.path(path, "src", "swarm"))
install(path)
# remotes::install_local(path = path)

path <- file.path(tempfile(pattern="Rvsearch-"), "Rvsearch")
dir.create(path, recursive=TRUE)
repo <- clone("https://github.com/lerch-a/Rvsearch.git", path)
clone("https://github.com/torognes/vsearch.git", file.path(path, "src", "vsearch"), branch=) #v2.15.0
install(path)

path <- file.path(tempfile(pattern="NGmergeR-"), "NGmergeR")
dir.create(path, recursive=TRUE)
repo <- clone("https://github.com/lerch-a/NGmergeR.git", path)
clone("https://github.com/harvardinformatics/NGmerge.git", file.path(path, "src", "NGmerge"))
install(path)

devtools::install_github("lerch-a/HaplotypR")