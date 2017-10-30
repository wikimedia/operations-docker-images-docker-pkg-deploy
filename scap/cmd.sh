#!/bin/bash
set -eu
export VENV="/srv/deployment/docker-pkg/venv"
(cd /srv/deployment/docker-pkg/deploy && make -f Makefile.deploy deploy)
