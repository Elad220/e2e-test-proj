DOCKERFILE_PATH := app/Dockerfile
DOCKER_HUB_REPO := elad2050/e2e-test-proj
COMMIT_HASH := $(shell git rev-parse --short HEAD)

export-requirements:
	uv export --no-hashes > requirements.txt

build-docker:
	docker build -f ${DOCKERFILE_PATH} -t ${DOCKER_HUB_REPO}:${COMMIT_HASH} -t ${DOCKER_HUB_REPO}:latest .

push-docker: build-docker
	docker push ${DOCKER_HUB_REPO}:${COMMIT_HASH}

test-in-docker: export-requirements build-docker
	docker run -it -p 8000:8000 ${COMMIT_HASH}

