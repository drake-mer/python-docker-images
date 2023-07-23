# Python Docker Images

Demonstrate migration from `requirements.txt` to pipenv or poetry + docker packaging for Python applications.

Supported dependency managers:

- [poetry](https://python-poetry.org/)
- [pipenv](https://pipenv.pypa.io/en/latest/)

## Why This Project?

Aim to solve two problems:

1. Migrate from [`requirements.txt`](https://learnpython.com/blog/python-requirements-file/)
to a well known package manager
2. packaging a project using one of this package manager with docker

## What's the problem with `requirements.txt`

While very efficient, the file `requirements.txt`
does not allow to express dependency constraint and to solve them
automatically, everything is done manually. 

Pipenv and poetry start to be de-facto standards in the Python world for
[dependency management](https://packaging.python.org/en/latest/tutorials/managing-dependencies/)

## What's the problem with docker files

Additionally to a quick migrating guide, we include also a migration to install a software
in a docker image using the abovementionned package managers as installer.

The migration process can be verified automatically by running respectively:

- batch test.sh pipenv
- batch test.sh poetry

This will generate the dependency lock file once, and build the corresponding image.

## Next Steps

The build of the docker image could be greatly improved. A list of items that are interesting to do:

- Remove the installer tools (aka use a builder image and copy the virtual env in the running image)
- Make the container run with a non-root user and limited access rights
- Add new python package managers in the mix ([conda](https://docs.conda.io/en/latest/), [micropipenv](https://github.com/thoth-station/micropipenv), etc)
