## Install Required Dependencies for HaplotypR and Phylogenetic Analyses

install.packages("latticeExtra")

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("Biostrings")

install.packages("dplyr")
install.packages("git2r")
install.packages("remotes")
install.packages("ape")
install.packages("phangorn")

remotes::install_github("Bioconductor/Biobase")
remotes::install_github("Bioconductor/ShortRead")

BiocManager::install("SummarizedExperiment")
BiocManager::install("ShortRead")
BiocManager::install("msa")

###################################
## Install HaplotypR
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

remotes::install_github("lerch-a/HaplotypR")