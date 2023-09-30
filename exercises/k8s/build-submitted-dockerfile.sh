
LOCAL_IMAGE_TAG=$1
REGISTRY_IMAGE_TAG=$2

# Build a Docker image from the submitted Dockerfile
docker build -t $LOCAL_IMAGE_TAG .

# Tag and push it to the local registry
docker tag $LOCAL_IMAGE_TAG registry:5000/$REGISTRY_IMAGE_TAG
docker push registry:5000/$REGISTRY_IMAGE_TAG

# Remove local version, so that the registry will be used for sure
docker image remove $LOCAL_IMAGE_TAG
docker image remove registry:5000/$REGISTRY_IMAGE_TAG