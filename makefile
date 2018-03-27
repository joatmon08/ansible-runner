.PHONY: build

build:
	docker build -t joatmon08/ansible-runner:latest .

integration:
	docker run -d --name ansible-runner -e APP_PLAYBOOK_PATH=test_playbook joatmon08/ansible-runner:latest
	docker exec ansible-runner pytest .

clean:
	docker rm -f ansible-runner
