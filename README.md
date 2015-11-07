# DroidSharp-Build

DroidSharp-Build is collection of scripts and patches to easily cross-compile the Mono project for Android.

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

# Available Options

There are several options that can be passed to cmake to configure the build:
* ```CMAKE_TOOLCHAIN_FILE``` location of the cross-compile toolchain cmake file
* ```ANDROID_NDK``` location of the Android NDK (>= r5 required)
* ```MONO_SRC_DIR``` location of the mono source (>= 4.2.1.60 required) - must include the git history
* ```MONO_INSTALL_DIR``` location of the mono build tree
* ```MONO_REV``` mono revision to checkout and apply patches on
* ```MONO_APPLY_PATCHES``` disable application of patches

# License

DroidSharp-Build is copyrighted (C) by Zachariah Brown and licensed under the terms of LGPLv3.
