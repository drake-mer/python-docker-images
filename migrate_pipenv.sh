rm Pipfile Pipfile.lock || true

pipenv install -r requirements.txt
pipenv install --dev -r requirements-dev.txt
