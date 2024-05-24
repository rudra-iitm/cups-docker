# TODOs for Dockerizing CUPS

## Objectives

- Optimize the Docker image for CUPS by reducing its size and improving security.
- Enhance user customization options for setting up the CUPS service.

## TODO List

### 1. Use Alpine as Base and Final Image

- **Objective**: Replace Ubuntu with Alpine Linux to create a smaller, more secure Docker image.
- **Steps**:
  1. Modify the `FROM` line in the Dockerfile to use an Alpine base image:
     ```dockerfile
     FROM alpine:latest
     ```
  2. Ensure all necessary dependencies are installed in Alpine:

### 2. Copy Only Necessary Files and Folders

- **Objective**: Reduce the final image size by copying only essential files and folders from the build stage.
- **Steps**:
  1. Identify the necessary files and directories needed for CUPS to run.
  2. Modify the Dockerfile to only copy these files:

### 3. Take Custom Username and Password Input from User

- **Objective**: Allow users to provide a custom username and password for the CUPS service during container runtime.
- **Steps**:
  1. Modify the Dockerfile or entrypoint script to accept environment variables for the username and password:
     ```dockerfile
     ENV CUPS_USER=cupsadmin
     ENV CUPS_PASSWORD=password
     ```
  2. Update the entrypoint script to create the user and set the password: