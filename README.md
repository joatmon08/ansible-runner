# Ansible Runner App

This is a simple application that runs a specific Ansible playbook.
It has one simple endpoint (/runner/play) which takes extra variables and
passes them to a playbook located at APP_PLAYBOOK_PATH and APP_PLAYBOOK_NAME.

## Install
1.  Install dependencies
    ```
    pip install -r requirements.txt
    ```
1.  Set environment variables. Below are defaults.
    ```
    APP_PORT=8080
    APP_PLAYBOOK_PATH=playbook
    APP_PLAYBOOK_NAME=site.yml
    ```

## Run
1.  Add the playbook to ansible-runner/ folder, which is default.
1.  Run the Flask application.
    ```
    python app.py
    ```

## Run in Docker
1.  Build the Docker image.
1.  If necessary, mount the SSH configuration so you can SSH to the
hosts. You may need to mount the private keys. The example
below assumes you are using Vagrant hosts.
    ```
     docker run -d -p 8080:8080 -v vagrant/ssh-config:/root/.ssh/config -v \    vagrant/.vagrant/machines:/root/vagrant/.vagrant/machines ansible-runner:latest
    ```
1. You can also use the docker-compose.yaml as
a sample to create and mount the playbooks.

## Tests
There are integration tests that run a test_playbook and checks it
for specific outputs. To run, use:
```
make integration
```
This will build a Docker image, spin up a container named ansible-runner, and
run pytest in it.