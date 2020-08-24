# Docker Image for HaplotypR
<h4 align = "right">Colby T. Ford, Ph.D.</h4>
This repository contains the Dockerfile for generating an Ubuntu image with HaplotypR pre-installed.
```

-------------------------------

## Build Instructions
1. Clone this repository to your local machine

2. Open terminal and navigate to the directory of this repository.

3. Run the following command. This will generate the Docker image.
```
docker build -t haplotypr .
```
_Note:_ You may have to increase the resource limits in Docker's settings as this container size (and the resources HaplotypR needs to run) will be quite large.
<p align="center"><img src="DockerSettings.PNG" width="500px"></p>


4. Once the image has been created successfully, run the container using the following command.
```
docker run haplotypr
```

5. Once the container is ready, remote into the bash terminal.
```
docker run --name haplotypr -d haplotypr -p 8787:8787 -e PASSWORD=admin
docker exec -it haplotypr /bin/bash
```

----------------------

## To Publish on DockerHub

```
docker image tag haplotypr <USERNAME>/haplotypr
docker push <USERNAME>/haplotypr
```

----------------------
## About HaplotypR

HaplotypR, developed by the Anita Lerch, Ph.D. at the University of Notre Dame, is a program for analysis of Amplicon-Seq genotyping experiments. Check out her website for more details: [https://lerch-a.github.io/HaplotypR/)
