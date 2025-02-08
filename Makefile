DOCKERFILE_PATH := app/Dockerfile

export-requirements:
	uv export --no-hashes > requirements.txt

build-docker:
	docker build -f ${DOCKERFILE_PATH} -t fastapi-hello-world .

test-in-docker: export-requirements build-docker
	docker run -it -p 8000:8000 fastapi-hello-world

