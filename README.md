# Stage 2 bootstrap packages for Wolfi

These are the stage 2 (isolated glibc environment) packages for Wolfi.
They are meant to be used standalone (without Alpine) to bootstrap stage
3.

The [package repository][repo] is automatically built using GitHub Actions.

   [repo]: https://packages.wolfi.dev/bootstrap/stage1

## Building the stage2 package set yourself

It is possible to build the bootstrap packages locally.  Assuming that
you have `melange` already built and its prerequisites installed, then
you can just do:

```shell
$ doas make MELANGE_DIR=../path/to/melange/sources
...
```

After a while, you will have a built stage1 toolchain package set, signed
with a local signing key (`local-melange.rsa.pub`).

This can then be used to build the stage3 packages.
