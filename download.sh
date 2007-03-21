#!/bin/sh

NO_ARCH=none
source include.sh

# Dark blue
echo -e "\e[34m"

# Download everything we haven't already got a copy of.

echo "=== Download source code." &&

# Required for cross compile toolchain

URL=http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.20.tar.bz2 \
SHA1=e730979adfb287528263e779c91284659672510d \
download &&

URL=http://www.uclibc.org/downloads/snapshots/uClibc-20070317.tar.bz2 \
SHA1= \
download &&

URL=ftp://ftp.gnu.org/gnu/binutils/binutils-2.17.tar.bz2 \
SHA1=a557686eef68362ea31a3aa41ce274e3eeae1ef0 \
download &&

URL=ftp://ftp.gnu.org/gnu/gcc/gcc-4.1.2/gcc-core-4.1.2.tar.bz2 \
SHA1=d6875295f6df1bec4a6f4ab8f0da54bfb8d97306 \
download &&

URL=http://ftp.gnu.org/gnu/gcc/gcc-4.1.2/gcc-g++-4.1.2.tar.bz2 \
SHA1=e29c6e151050f8b5ac5d680b99483df522606143 \
download &&

URL=http://landley.net/code/toybox/downloads/toybox-0.0.3.tar.bz2 \
SHA1= \
download &&

# Ye olde emulator

#URL=http://qemu.org/qemu-0.9.0.tar.gz \
#SHA1=1e57e48a06eb8729913d92601000466eecef06cb \
#download &&

# Required for native build environment

URL=http://superb-east.dl.sourceforge.net/sourceforge/squashfs/squashfs3.1.tar.gz \
SHA1=89d537fd18190402ff226ff885ddbc14f6227a9b \
download &&

URL=http://www.busybox.net/downloads/busybox-1.2.2.tar.bz2 \
SHA1=59670600121c9dacfd61e72e34f4bd975ec2c36f \
download &&

URL=ftp://ftp.gnu.org/gnu/make/make-3.81.tar.bz2 \
SHA1=41ed86d941b9c8025aee45db56c0283169dcab3d \
download &&

URL=http://ftp.gnu.org/gnu/bash/bash-2.05b.tar.gz \
SHA1=b3e158877f94e66ec1c8ef604e994851ee388b09 \
download &&

URL=http://superb-east.dl.sourceforge.net/sourceforge/strace/strace-4.5.14.tar.bz2 \
SHA1=72c17d1dd6786d22ca0aaaa7292b8edcd70a27de \
download &&

# We look for things.  Things that make us go.  (Laxatives, aisle 7.)
URL=http://distcc.samba.org/ftp/distcc/distcc-2.18.3.tar.bz2 \
SHA1=88e4c15826bdbc5a3de0f7c1bcb429e558c6976d \
download &&

# ftp://ftp.denx.de/pub/u-boot/u-boot-1.2.0.tar.bz2
# http://tinderbox.dev.gentoo.org/portage/scripts/bootstrap.sh
# http://cxx.uclibc.org/src/uClibc++-0.2.1.tar.bz2

echo === Got all source. &&

cleanup_oldfiles &&

# Set color back to normal.
echo -e "\e[0m"
