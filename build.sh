#!/bin/sh
unset IFS
set -euf

docker build -t mcandre/apple-clang .
