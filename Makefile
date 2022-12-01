ARCH := $(shell uname -m)
MELANGE_DIR ?= ../melange
MELANGE ?= ${MELANGE_DIR}/melange
KEY ?= local-melange.rsa
REPO ?= $(shell pwd)/packages

M4_VERSION ?= 1.4.19-r0
NCURSES_VERSION ?= 6.3-r0
BUSYBOX_VERSION ?= 1.35.0-r1
FILE_VERSION ?= 5.42-r0
GAWK_VERSION ?= 5.1.1-r0
GREP_VERSION ?= 3.7-r0
GZIP_VERSION ?= 1.12-r0
GMAKE_VERSION ?= 4.3-r0
PATCH_VERSION ?= 2.7.6-r0
SED_VERSION ?= 4.8-r0
XZ_VERSION ?= 5.2.6-r0
OPENSSL_VERSION ?= 3.0.5-r1
CROSS_PKGCONF_VERSION ?= 1-r0
CA_CERTIFICATES_VERSION ?= 20220614-r0
WGET_VERSION ?= 1.21.3-r0
ZLIB_VERSION ?= 1.2.12-r0
APK_TOOLS_VERSION ?= 2.12.9-r1
BINUTILS_VERSION ?= 2.39-r0
PKGCONF_VERSION ?= 1.9.3-r0
BISON_VERSION ?= 3.8.2-r0
GMP_VERSION ?= 6.2.1-r1
MPFR_VERSION ?= 4.1.0-r1
MPC_VERSION ?= 1.2.1-r0
ISL_VERSION ?= 0.24-r0
GCC_VERSION ?= 12.2.0-r1
PAX_UTILS_VERSION ?= 1.3.4-r0
LINUX_HEADERS_VERSION ?= 5.16.9-r0
GLIBC_VERSION ?= 2.35-r1
WOLFI_BASELAYOUT_VERSION ?= 1-r0
LIBSTDCXX_VERSION ?= 12.2.0-r0
BUILD_BASE_VERSION ?= 1-r1

MELANGE_OPTS ?= \
	--repository-append ${REPO} \
	--keyring-append ${KEY}.pub \
	--signing-key ${KEY} \
	--pipeline-dir ${MELANGE_DIR}/pipelines \
	--arch ${ARCH}

MELANGE_DEFOPTS ?= --empty-workspace

PACKAGES = \
	packages/${ARCH}/m4-${M4_VERSION}.apk \
	packages/${ARCH}/ncurses-${NCURSES_VERSION}.apk \
	packages/${ARCH}/busybox-${BUSYBOX_VERSION}.apk \
	packages/${ARCH}/file-${FILE_VERSION}.apk \
	packages/${ARCH}/gawk-${GAWK_VERSION}.apk \
	packages/${ARCH}/grep-${GREP_VERSION}.apk \
	packages/${ARCH}/gzip-${GZIP_VERSION}.apk \
	packages/${ARCH}/make-${GMAKE_VERSION}.apk \
	packages/${ARCH}/patch-${PATCH_VERSION}.apk \
	packages/${ARCH}/sed-${SED_VERSION}.apk \
	packages/${ARCH}/xz-${XZ_VERSION}.apk \
        packages/${ARCH}/openssl-${OPENSSL_VERSION}.apk \
	packages/${ARCH}/cross-pkgconf-${CROSS_PKGCONF_VERSION}.apk \
	packages/${ARCH}/ca-certificates-${CA_CERTIFICATES_VERSION}.apk \
	packages/${ARCH}/wget-${WGET_VERSION}.apk \
	packages/${ARCH}/zlib-${ZLIB_VERSION}.apk \
	packages/${ARCH}/apk-tools-${APK_TOOLS_VERSION}.apk \
	packages/${ARCH}/binutils-${BINUTILS_VERSION}.apk \
	packages/${ARCH}/pkgconf-${PKGCONF_VERSION}.apk \
	packages/${ARCH}/bison-${BISON_VERSION}.apk \
	packages/${ARCH}/gmp-${GMP_VERSION}.apk \
	packages/${ARCH}/mpfr-${MPFR_VERSION}.apk \
	packages/${ARCH}/mpc-${MPC_VERSION}.apk \
	packages/${ARCH}/isl-${ISL_VERSION}.apk \
	packages/${ARCH}/gcc-${GCC_VERSION}.apk \
	packages/${ARCH}/pax-utils-${PAX_UTILS_VERSION}.apk \
	packages/${ARCH}/wolfi-baselayout-${WOLFI_BASELAYOUT_VERSION}.apk \
	packages/${ARCH}/linux-headers-${LINUX_HEADERS_VERSION}.apk \
	packages/${ARCH}/glibc-${GLIBC_VERSION}.apk \
	packages/${ARCH}/libstdc++-${LIBSTDCXX_VERSION}.apk \
	packages/${ARCH}/build-base-${BUILD_BASE_VERSION}.apk

all: ${KEY} ${PACKAGES}

packages/${ARCH}/m4-${M4_VERSION}.apk:
	${MELANGE} build m4.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/ncurses-${NCURSES_VERSION}.apk:
	${MELANGE} build ncurses.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/busybox-${BUSYBOX_VERSION}.apk:
	${MELANGE} build busybox.yaml ${MELANGE_OPTS} --source-dir ./busybox/

packages/${ARCH}/file-${FILE_VERSION}.apk:
	${MELANGE} build file.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/gawk-${GAWK_VERSION}.apk:
	${MELANGE} build gawk.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/grep-${GREP_VERSION}.apk:
	${MELANGE} build grep.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/gzip-${GZIP_VERSION}.apk:
	${MELANGE} build gzip.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/make-${GMAKE_VERSION}.apk:
	${MELANGE} build make.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/patch-${PATCH_VERSION}.apk:
	${MELANGE} build patch.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/sed-${SED_VERSION}.apk:
	${MELANGE} build sed.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/xz-${XZ_VERSION}.apk:
	${MELANGE} build xz.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/openssl-${OPENSSL_VERSION}.apk:
	${MELANGE} build openssl.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/cross-pkgconf-${CROSS_PKGCONF_VERSION}.apk:
	${MELANGE} build cross-pkgconf.yaml ${MELANGE_OPTS} --source-dir ./cross-pkgconf/

packages/${ARCH}/ca-certificates-${CA_CERTIFICATES_VERSION}.apk:
	${MELANGE} build ca-certificates.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/wget-${WGET_VERSION}.apk:
	${MELANGE} build wget.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/zlib-${ZLIB_VERSION}.apk:
	${MELANGE} build zlib.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/apk-tools-${APK_TOOLS_VERSION}.apk:
	${MELANGE} build apk-tools.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/binutils-${BINUTILS_VERSION}.apk:
	${MELANGE} build binutils.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/pkgconf-${PKGCONF_VERSION}.apk:
	${MELANGE} build pkgconf.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/bison-${BISON_VERSION}.apk:
	${MELANGE} build bison.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/gmp-${GMP_VERSION}.apk:
	${MELANGE} build gmp.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/mpfr-${MPFR_VERSION}.apk:
	${MELANGE} build mpfr.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/mpc-${MPC_VERSION}.apk:
	${MELANGE} build mpc.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/isl-${ISL_VERSION}.apk:
	${MELANGE} build isl.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/gcc-${GCC_VERSION}.apk:
	${MELANGE} build gcc.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/pax-utils-${PAX_UTILS_VERSION}.apk:
	${MELANGE} build pax-utils.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/linux-headers-${LINUX_HEADERS_VERSION}.apk:
	${MELANGE} build linux-headers.yaml ${MELANGE_OPTS} --source-dir ./glibc/

packages/${ARCH}/glibc-${GLIBC_VERSION}.apk:
	${MELANGE} build glibc.yaml ${MELANGE_OPTS} --source-dir ./glibc/

packages/${ARCH}/wolfi-baselayout-${WOLFI_BASELAYOUT_VERSION}.apk:
	${MELANGE} build wolfi-baselayout.yaml ${MELANGE_OPTS} --source-dir ./wolfi-baselayout/

packages/${ARCH}/libstdc++-${LIBSTDCXX_VERSION}.apk:
	${MELANGE} build libstdc++.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

packages/${ARCH}/build-base-${BUILD_BASE_VERSION}.apk:
	${MELANGE} build build-base.yaml ${MELANGE_OPTS} ${MELANGE_DEFOPTS}

${KEY}:
	${MELANGE} keygen ${KEY}

clean:
	rm -rf packages/${ARCH}
