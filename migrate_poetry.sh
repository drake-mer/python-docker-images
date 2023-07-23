rm pyproject.toml || true

export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
deps=""
devdeps=""

for dep in $(cat requirements.txt);do
  deps="${deps} --dependency=${dep}"
done

for dep in $(cat requirements-dev.txt);do
  devdeps="${devdeps} --dev-dependency=${dep}"
done

echo ${deps}

poetry init -n \
  ${deps} \
  ${devdeps}
