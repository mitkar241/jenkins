#!/bin/sh

set -e
set -x

helm uninstall jenkins-cli || true
