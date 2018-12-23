Spring boot test docker
=======================

# Define
+ Path to builded jar: **JAR_FILE_PATH=build/libs/app.jar**
+ Container name: **CONTAINER_NAME=spring-boot-test-docker**
+ Path to config dir (must be absolute): **CONFIG_DIR=${PWD}/config**
+ Path to Dockerfile: **DOCKERFILE_PATH=.**


# Prepare
Create directory with spring data source configuration file
```bash
mkdir config && touch config/application.yml
```
Modify the settings file as you like.  



# How to use
+ Build docker image
```bash
JAR_FILE_PATH=${PWD}/build/libs/app.jar \ 
CONTAINER_NAME=spring-boot-test-docker \
DOCKERFILE_PATH=${PWD} \
bash -c \
'docker build --build-arg JAR_FILE=$JAR_FILE_PATH -t $CONTAINER_NAME $DOCKERFILE_PATH'
```
or with docker-compose
```bash
JAR_FILE=build/libs/app.jar docker-compose build
```


+ Run docker
```bash
CONTAINER_NAME=spring-boot-test-docker \
CONFIG_DIR=${PWD}/config \
bash -c \
'docker run -p 8080:8080 --mount type=bind,src=$CONFIG_DIR,dst=/config $CONTAINER_NAME'
```
or with docker-compose
```bash
CONFIG_DIR=${PWD}/config docker-compose up    # -d for demonize 
```

