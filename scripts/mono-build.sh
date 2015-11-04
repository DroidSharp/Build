#!/bin/bash

mono_src=$1
mono_rev=$2
apply_patches=$3
patch_dir=$4
install_dir=$5
ndk=$6
sysroot=$7
abi=$8
path=$9

export NDK="$ndk"
export SYSROOT="$sysroot"
export PATH="$path":$PATH

export CC="$abi-gcc --sysroot=$SYSROOT"
export CXX="$abi-g++ --sysroot=$SYSROOT"
export AR="$abi-ar"
export AS="$abi-as"
export CPP="$abi-cpp --sysroot=$SYSROOT"
export LD="$abi-ld --sysroot=$SYSROOT"
export RANLIB="$abi-ranlib"
export STRIP="$abi-strip"

if [ ! -d "$mono_src" ]; then
    echo "Cloning mono into $mono_src"
    git clone https://github.com/mono/mono.git "$mono_src"
else
    echo "Using existing mono src at $mono_src"
fi

echo "Changing into mono src dir $mono_src"
cd "$mono_src"
echo "Checking out revision $mono_rev"
git reset "$mono_rev" --hard

if [ $apply_patches == "yes" ]; then
    for patch in "$patch_dir/$mono_rev/"*.patch; do
        echo "Applying patch $patch..."
        git am "$patch"
    done
fi

git reset HEAD --hard

echo "make clean"
make clean
echo "./autogen.sh --prefix="$install_dir" --host="$abi" --target="$abi" --enable-small-config=yes --disable-mcs-build"
./autogen.sh --prefix="$install_dir" --host="$abi" --target="$abi" --enable-small-config=yes --disable-mcs-build
echo "make CFLAGS=\"$flags\""
make CFLAGS="$flags"
echo "make install"
make install
echo "Mono has been built for $abi at $install_dir"
