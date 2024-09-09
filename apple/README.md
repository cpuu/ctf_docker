```
IMAGE_NAME=ubuntu1804 CONTAINER_NAME=my_container;
podman build --platform linux/amd64 . -t $IMAGE_NAME
podman run -d -t --privileged --name=$CONTAINER_NAME -v /Users/cpuu/Documents/GitHub/dreamhack:/root/dreamhack $IMAGE_NAME
podman exec -it -u root $CONTAINER_NAME bash
```
