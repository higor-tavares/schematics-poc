setup:
	python -m venv .venv
	chmod +x .venv/bin/activate
	. .venv/bin/activate
	pip install -r requirements.txt
test: setup
	export PYTHONPATH=src
	coverage run --source=src -m pytest && coverage report