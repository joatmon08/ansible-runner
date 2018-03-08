.PHONY: unit bootstrap

integration: bootstrap
	sh -c '. venv/bin/activate; APP_PORT=8080 APP_PLAYBOOK_PATH=test_playbook APP_PLAYBOOK_NAME=site.yml python app.py'

bootstrap: virtualenv
ifneq ($(wildcard requirements.txt),)
	venv/bin/pip install -r requirements.txt
endif

virtualenv:
	virtualenv -p python3 venv
	venv/bin/pip install --upgrade pip
	venv/bin/pip install --upgrade setuptools
