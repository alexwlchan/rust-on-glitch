# rust-on-glitch

This repo contains some experiments I ran for running Rust binaries in [Glitch apps][glitch].

I thought it would be possible to compile a Rust binary outside Glitch, then download it as part of my startup script -- to avoid waiting for the Rust compiler every time my Glitch app started.
If I compiled the binary on Linux, it'd work, right?
Linux is Linux, isn't it?

Nope.

---

Glitch environments are often created from scratch and need to start quickly, so you can't

Because Glitch environments are often created from scratch and need to start quickly, I wanted to compile the app externally to Glitch, then download the binary inside

Running with the default target
./hello-world: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.28' not found (required by ./hello-world)

Running with the MUSL-based target
Hello, world!

[glitch]: https://glitch.com