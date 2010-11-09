# Build Linux From Scratch 6.7 packages under target environment.

# Note: this doesn't rebuild the toolchain packages (libc, binutils,
# gcc, linux-headers), but reuses the toolchain we've got, because:

# 1) Building a new toolchain is a target-dependent can of worms.
# 2) Doing so would lose distcc acceleration.
# 3) Building glibc under uClibc is buggy because glibc expects that a
#    2.6 kernel will have TLS, and uClibc without NPTL doesn't.  (Yes,
#    repeat after me, "autoconf is useless".)

# Download upstream tarball

URL=http://ftp.osuosl.org/pub/lfs/lfs-packages/lfs-packages-6.7.tar \
SHA1= \
RENAME='s/-sources//' \
download || dienow

cleanup_oldfiles

# Extract the individual packages from the upstream tarball

SRCDIR="$SRCTREE/lfs-packages"
PATCHDIR="$SRCDIR"

# Fixups for tarball names the Aboriginal extract scripts can't parse

mv "$SRCDIR"/sysvinit-2.88{dsf,}.tar.bz2 &&
mv "$SRCDIR"/tcl{8.5.8-src,-src-8.5.8}.tar.gz &&
mv "$SRCDIR"/udev-{161-testfiles,testfiles-161}.tar.bz2 || exit 1

# Remove damaged patches (whitespace damaged, don't apply without "fuzz").

rm "$SRCDIR"/gcc-4.5.1-startfiles_fix-1.patch &&
rm "$SRCDIR"/tar-1.23-overflow_fix-1.patch || exit 1

# Break down upstream tarball

for i in $(cd "$SRCDIR"; ls *.tar.*)
do
  extract_package $(noversion $i)
done

rm -rf "$SRCDIR"