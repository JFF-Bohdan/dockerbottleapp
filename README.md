# dockerbottleapp

## Brief
This repository contains:

1. Docker image generation scripts for Python3-Bottle application hosted using nginx+uwsgi+supervisor on clean Debian;
2. Python3 Bottle application which support single GET request ```/api/beacon``` which returns UID (```5914e2c1e1724ca597695a177fdaf8ea```);
3. Docker files for generation image able to check that web app running and returns needful UID;
4. .bat files for images generation.

## General description

### Web app

Python3 web application based on Bottle framework. Able to process GET request and return constant string - UUID4 ```5914e2c1e1724ca597695a177fdaf8ea```

### Docker image for web app support

Image based on clean Debian. Contains nginx + uwsgi + supervisor and able to host web app

### Docker image with web app acceptor

Image based on clean Debian. Contains shell script able to check that web app runs on other Docker container and returning needful UUID.

## Building

### Images generation

Generation sequence:

1. execute ```make_base.bat``` to build base image (Debian + server software + utilities);
2. execute ```make_app_image.bat``` to build image with Python3 Bottle application and all software configured to run;
3. execute ```make_curl_image.bat``` to build image with shell script which will check web app;


### Testing

Testing sequence:

1. execute ```make_run.bat``` - to run new container;
2. test your container using [http://localhost:8080/api/beacon](http://localhost:8080/api/beacon) request. If succeeded you will receive ```5914e2c1e1724ca597695a177fdaf8ea``` string
3. execute ```docker run -it kittyhawk/curl_image``` to run container with shell script for checking;
4. stop your container with web app;
5. remove exited container by executing ```remove_docker_exited_images.bat```

### Docker-compose

Using ```docker-compose``` and configuration in ```docker-compose.yml``` you able to run Docker images just by:

```docker-compose up```

**Warn:** you must be in directory contains ```docker-compose.yml``` file.

## Batch files

```make_base.bat``` - generates base OS for further images. This image will be based on clean Debian and will contain needful server software and utilities.

```make_app_image.bat``` - generates image with Python3 bottle application. Uploads application specific files, configuration files for ```nginx```, ```uwsgi``` and ```supervisor```.

```make_run.bat``` - starts docker container with Python3 Bottle application. You can test your docker container using: [http://localhost:8080/api/beacon](http://localhost:8080/api/beacon) when succeded you will receive ```5914e2c1e1724ca597695a177fdaf8ea``` string.

```rmi.bat``` - removes images with Python3 bottle app and curl acceptor

```make_curl_image.bat``` - generates image with curl acceptor

## Folders

* **bottle_app** - Python3 web application based on Bottle framework;
* **config** - configuration files for web app running docker container;
* **curl_machine** - shell script for web app checking docker image.

Enjoy!