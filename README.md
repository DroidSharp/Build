# DroidSharp | Mono-Build

Mono-Build is collection of scripts and patches to easily cross-compile the Mono project for Android.

## TL;DR

    cmake -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/android.toolchain.cmake \
          -DANDROID_NDK=<ndk_path>                                        \
          <source_path>
    make

The build scripts will automatically download and patch the Mono project so it compiles while targeting Android.

# Getting started

To get started you need the following tools and libraries downloaded and installed:
* [Android NDK](http://developer.android.com/ndk/downloads/index.html)
* [git](https://git-scm.com/)
* [cmake](https://cmake.org)
* [Autoconf](http://www.gnu.org/software/autoconf/autoconf.html)
* [Automake](https://www.gnu.org/software/automake/)
* libtool
* build-essential
* mono-devel
* gettext

# License
Mono-Build is copyrighted (C) by Zachariah Brown and licensed under the terms of LGPL3.
