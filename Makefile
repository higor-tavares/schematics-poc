setup:
	python -m venv .venv
	chmod +x .venv/bin/activate
	. .venv/bin/activate
	pip install -r requirements.txt
test: 
	export PYTHONPATH=src
	pytest 