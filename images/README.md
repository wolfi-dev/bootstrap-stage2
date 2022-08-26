# Validation image for Wolfi stage2

If you build this spec file with [apko][apko], you will get a
validation image that you can test with Docker.

Please note that this image is very large, several hundred MB.
This is because it contains a full system toolchain, and all
relevant SDKs for glibc building.

The real images will come later, after bootstrapping is
finished.

   [apko]: https://github.com/chainguard-dev/apko
