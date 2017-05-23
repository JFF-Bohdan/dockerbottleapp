# dockerbottleapp
Docker images for Python-Bottle application hosted using nginx+uwsgi+supervisor on clean Debian

## General description


This repo contains Dockerfiles for **Docker images** generation. Generated docker images will contain **Python3 Bottle application** which will be hosted on **Debian using nginx + uwsgi + supervisor**.

Generation sequence:

1. execute ```make_base.bat``` to build base image (Debian + server software + utilities);
2. execute ```make_app_image.bat``` to build image with Python3 Bottle application and all software configured to run;
3. execute ```make_run.bat``` - to run new container;
4. test your container using [http://localhost:8080/api/beacon](http://localhost:8080/api/beacon) request. If succeeded you will receive ```5914e2c1e1724ca597695a177fdaf8ea``` string
5. stop your container;
6. remove exited container by executing ```remove_docker_exited_images.bat```


## Batch files

```make_base.bat``` - generates base OS for further images. This image will be based on clean Debian and will contain needful server software and utilities.

```make_app_image.bat``` - generates image with Python3 bottle application. Uploads application specific files, configuration files for ```nginx```, ```uwsgi``` and ```supervisor```.

```make_run.bat``` - starts docker container with Python3 Bottle application. You can test your docker container using: [http://localhost:8080/api/beacon](http://localhost:8080/api/beacon) when succeded you will receive ```5914e2c1e1724ca597695a177fdaf8ea``` string.

Enjoy!