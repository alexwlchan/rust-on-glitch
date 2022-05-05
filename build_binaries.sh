#!/usr/bin/env bash

set -o errexit
set -o nounset

ROOT="$(git rev-parse --show-toplevel)"

docker run -it --volume "$ROOT:$ROOT" --workdir "$ROOT" \
  rust:slim-bullseye \
  bash -c "
    cargo build --release &&
    cd target/release &&
    tar -cvzf hello-world.default.tar.gz hello-world &&
    cp hello-world.default.tar.gz \"$ROOT\"
  "

docker run -it --volume "$ROOT:$ROOT" --workdir "$ROOT" \
  rust:slim-bullseye \
  bash -c "
    rustup target add x86_64-unknown-linux-musl &&
    cargo build --target x86_64-unknown-linux-musl --release &&
    cd target/x86_64-unknown-linux-musl/release &&
    tar -cvzf hello-world.musl.tar.gz hello-world &&
    cp hello-world.musl.tar.gz \"$ROOT\"
  "
