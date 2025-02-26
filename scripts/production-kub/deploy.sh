#
# Builds, publishes and deploys all microservices to a production Kubernetes instance.
#
# Usage:
#
#   ./scripts/production-kub/deploy.sh
#

# set -u # or set -o nounset
# : "flixtubemidtermpakorn.azurecr.io"

# #
# # Build Docker images.
# #
# docker build -t flixtubemidtermpakorn.azurecr.io/metadata:1 --file ../../metadata/Dockerfile-prod ../../metadata
# docker push flixtubemidtermpakorn.azurecr.io/metadata:1

# docker build -t flixtubemidtermpakorn.azurecr.io/history:1 --file ../../history/Dockerfile-prod ../../history
# docker push flixtubemidtermpakorn.azurecr.io/history:1

# docker build -t flixtubemidtermpakorn.azurecr.io/mock-storage:1 --file ../../mock-storage/Dockerfile-prod ../../mock-storage
# docker push flixtubemidtermpakorn.azurecr.io/mock-storage:1

# docker build -t flixtubemidtermpakorn.azurecr.io/history:1 --file ../../history/Dockerfile-prod ../../history
# docker push flixtubemidtermpakorn.azurecr.io/history:1

# docker build -t flixtubemidtermpakorn.azurecr.io/video-streaming:1 --file ../../video-streaming/Dockerfile-prod ../../video-streaming
# docker push flixtubemidtermpakorn.azurecr.io/video-streaming:1

# docker build -t flixtubemidtermpakorn.azurecr.io/video-upload:1 --file ../../video-upload/Dockerfile-prod ../../video-upload
# docker push flixtubemidtermpakorn.azurecr.io/video-upload:1

# docker build -t flixtubemidtermpakorn.azurecr.io/gateway:1 --file ../../gateway/Dockerfile-prod ../../gateway
# docker push flixtubemidtermpakorn.azurecr.io/gateway:1

# 
# Deploy containers to Kubernetes.
#
# Don't forget to change kubectl to your production Kubernetes instance
#
kubectl apply -f rabbit.yaml
kubectl apply -f mongodb.yaml 
envsubst < metadata.yaml | kubectl apply -f -
envsubst < history.yaml | kubectl apply -f -
envsubst < mock-storage.yaml | kubectl apply -f -
envsubst < video-streaming.yaml | kubectl apply -f -
envsubst < video-upload.yaml | kubectl apply -f -
envsubst < gateway.yaml | kubectl apply -f -