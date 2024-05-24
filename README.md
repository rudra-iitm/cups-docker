# Setting Up and Running CUPS in Docker

## Prerequisites

1. **Docker Installed**: Ensure Docker is installed on your system. You can download it from the [official Docker website](https://www.docker.com/get-started).

## Step-by-Step Guide

### 1. Build Docker Image

The first step is to build the Docker image from the Dockerfile. This image will contain all the configurations and dependencies required to run CUPS.

Open your terminal and navigate to the directory containing your Dockerfile, then run the following command:

```bash
    docker build -t cups .
```

### 2. Run Docker Container

Once the image is built, you can run a container from this image. This container will host the CUPS service.

```bash
    docker run -it -p <port>:631 cups
```
