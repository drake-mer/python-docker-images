# Python Docker Images

Demonstrate migration from `requirements.txt` to pipenv or poetry + docker packaging for Python applications.

Supported dependency managers:

- [vanilla pip](https://pip.pypa.io/en/stable/)
  - [docker file for vanilla pip](./Dockerfile.vanilla-pip)
- [poetry](https://python-poetry.org/)
  - [migration script from vanilla pip](./migrate_poetry.sh)
  - [docker file](./Dockerfile.poetry)
- [pipenv](https://pipenv.pypa.io/en/latest/)
  - [migration script from vanilla pip](./migrate_pipenv.sh)
  - [docker file](./Dockerfile.pipenv)

## Why This Project?

Aim to solve two problems:

1. Migrate from [`requirements.txt`](https://learnpython.com/blog/python-requirements-file/)
to a well-known package manager
2. packaging a project using one of these package managers with docker

## What's the problem with `requirements.txt`

While very efficient, the file `requirements.txt`
does not allow expressing dependency constraints and solving them
automatically, everything is done manually. 

Pipenv and poetry start to be de-facto standards in the Python world for
[dependency management](https://packaging.python.org/en/latest/tutorials/managing-dependencies/)

## What's the problem with docker files

Additionally to the migration examples, we include examples on Python software packaging
in a docker image using the abovementioned package managers as installers.

The migration process can be verified automatically by running respectively:

- [bash test.sh pipenv](./test.sh)
- [bash test.sh poetry](./test.sh)

This will generate the dependency lock file once, and build the corresponding image.

## Next Steps

The build of the docker image could be greatly improved. A list of items that are interesting to do:

- Remove the installer tools (aka use a builder image and copy the virtual env in the running image)
- Make the container run with a non-root user and limited access rights
- Add new python package managers in the mix ([conda](https://docs.conda.io/en/latest/), [micropipenv](https://github.com/thoth-station/micropipenv), etc)
