include Makefile.env

export

build:
	@sed "s|<<DAGSTER_VERSION>>|${DAGSTER_VERSION}|g" pyproject.toml.tmpl > pyproject.toml && \
		pack build ${IMAGE_REGISTRY_NAME} \
			--tag ${IMAGE_REGISTRY_NAME}-${APP_VERSION} \
			-d bpproject.toml \
			--platform linux/amd64 \
			--creation-time now \
			--publish

shell:
	@${CONTAINER_CLI} run -it --rm \
		--name ${IMAGE_REGISTRY_NAME} \
		 ${IMAGE_REGISTRY_NAME} \
		/bin/bash || true

image:
	@${CONTAINER_CLI} images | grep ${IMAGE_REPO_ROOT}/${IMAGE_NAME} | grep ${IMAGE_TAG} || \
		echo "Error! Base image for ${IMAGE_REGISTRY_NAME}, is NOT found."

# Misc operations

prune:
	@${CONTAINER_CLI} image prune -f
clean: prune
