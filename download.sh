#!/bin/sh

NO_ARCH=none
source include.sh

echo "$SOURCES"

# Download everything we haven't already got a copy of.

echo "=== Download source code." &&

# Required for cross compile toolchain

export STAGEDIR=sources/build-cross
mkdir -p "$STAGEDIR"

URL=http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.19.tar.bz2 \
SHA1=c00d5891e2461bce45be51c1ef7846ee842792dd \
download &&

URL=http://www.uclibc.org/downloads/snapshots/uClibc-20061128.tar.bz2 \
SHA1=50c024ac137262981348ad54e0f64d83db1bce4e \
download &&

URL=ftp://ftp.gnu.org/gnu/binutils/binutils-2.17.tar.bz2 \
SHA1=a557686eef68362ea31a3aa41ce274e3eeae1ef0 \
download &&

URL=ftp://ftp.gnu.org/gnu/gcc/gcc-4.1.1/gcc-core-4.1.1.tar.bz2 \
SHA1=147e12bf96a8d857fda1d43f0d7ea599b89cebf9 \
download &&

# Ye olde emulator

URL=http://qemu.org/qemu-0.8.2.tar.gz \
SHA1=d775239a545e7d0c5b677660a2122df590afde6d \
download &&

# Required for native build environment

export STAGEDIR=sources/build-native &&
mkdir -p "$STAGEDIR" &&

URL=http://superb-east.dl.sourceforge.net/sourceforge/squashfs/squashfs3.1.tar.gz \
SHA1=89d537fd18190402ff226ff885ddbc14f6227a9b \
download &&

URL=http://www.busybox.net/downloads/busybox-1.2.2.tar.bz2 \
SHA1=59670600121c9dacfd61e72e34f4bd975ec2c36f \
download &&

URL=ftp://ftp.gnu.org/gnu/make/make-3.81.tar.bz2 \
SHA1=41ed86d941b9c8025aee45db56c0283169dcab3d \
download &&

echo === Got all source.
