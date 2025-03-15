#!/bin/sh

set -e
set -x

echo "http://$(hostname -I | awk '{print $1}'):8080"
