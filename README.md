# ctf_docker
ctf_docker


## Docker Build & Run
```
$ IMAGE_NAME=ubuntu2204 CONTAINER_NAME=ctf_docker
$ docker build . -t $IMAGE_NAME
$ docker run -d -t --privileged --name=$CONTAINER_NAME $IMAGE_NAME
$ docker exec -it -u root $CONTAINER_NAME bash
```


## Docker Stop & Remove
```
$ docker stop ctf_docker && docker rm ctf_docker
```
