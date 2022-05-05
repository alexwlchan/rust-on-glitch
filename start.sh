#!/usr/bin/env bash

echo "Running with the default target"
tar -xzf hello-world.default.tar.gz
./hello-world

echo ""

echo "Running with the MUSL-based target"
tar -xzf hello-world.musl.tar.gz
./hello-world
