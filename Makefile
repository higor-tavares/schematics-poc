PY = python3
VENV = .venv
BIN = $(VENV)/bin

# Adjust for Windows
ifeq ($(OS), Windows_NT)
    BIN = $(VENV)/Scripts
    PY = python
endif

$(VENV): requirements.txt
	$(PY) -m venv $(VENV)
	$(BIN)/pip install --upgrade pip
	$(BIN)/pip install -r requirements.txt
	touch $(VENV)

.PHONY: test
test: $(VENV)
	PYTHONPATH=src $(BIN)/coverage run --source=src $(BIN)/pytest && $(BIN)/coverage report

clean:
	rm -rf $(VENV)
	find . -type f -name *.pyc -delete
	find . -type d -name __pycache__ -delete