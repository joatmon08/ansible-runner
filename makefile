.PHONY: build

build:
	docker build -t joatmon08/ansible-runner:latest .

integration: build
	docker run -d --name ansible-runner joatmon08/ansible-runner:latest
	docker exec ansible-runner pytest .
	docker rm -f ansible-runner
