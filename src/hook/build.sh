#!/bin/bash
# shellcheck disable=SC1091
set -a; source ../VERSIONS ; set +a;

IMAGE="${IMAGE:-${IMAGE_REPOSITORY}/${IMAGE_NAME}:${IMAGE_TAG}}"
DOCKERFILE="${DOCKERFILE:-Dockerfile}"

docker buildx build \
       --build-arg BASE_IMAGE_REPOSITORY="${BASE_IMAGE_REPOSITORY}" \
       --build-arg BASE_IMAGE_NAME="${BASE_IMAGE_NAME}" \
       --build-arg BASE_IMAGE_TAG="${BASE_IMAGE_TAG}" \
       --build-arg BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
       --build-arg FOSSIL_VERSION="${FOSSIL_VERSION:-2.18}" \
       -t "${IMAGE}" \
       -f ../"${DOCKERFILE}" \
        ../.
