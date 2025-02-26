#
# Publishes a Docker image.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   REGISTRY_UN - User name for your container registry.
#   REGISTRY_PW - Password for your container registry.
#   VERSION - The version number to tag the images with.
#
# Usage:
#
#       ./scripts/cd/push-image.sh
#

set -u # or set -o nounset
: "flixtubemidtermpakorn.azurecr.io"
: "$VERSION"
: "$REGISTRY_UN"
: "$REGISTRY_PW"
: "$NAME"

echo $REGISTRY_PW | docker login flixtubemidtermpakorn.azurecr.io --username $REGISTRY_UN --password-stdin
docker push flixtubemidtermpakorn.azurecr.io/$NAME:$VERSION
