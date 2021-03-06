#!/usr/bin/env bash


# Before running this script, remember to git commit and push!

VERSION=$(grep ^VERSION qutils/__init__.py | sed "s/^VERSION = '//" | sed "s/'$//")
COMMENT=$(git log -1 --pretty=%B | cat)

source activate py3

git tag ${VERSION} -m "${COMMENT}"
git push origin --tags && \
python setup.py sdist bdist_wheel && \
twine upload --skip-existing dist/*
