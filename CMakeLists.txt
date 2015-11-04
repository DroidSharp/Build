cmake_minimum_required (VERSION 2.6)
project (MonoBuild)

if(NOT ANDROID)
	message(FATAL_ERROR "Building without the android toolchain is not supported")
endif()

set(MONO_SRC_DIR "${CMAKE_SOURCE_DIR}/mono-src" CACHE PATH "Mono source directory [requires git dir]")
set(MONO_INSTALL_DIR "${CMAKE_SOURCE_DIR}/mono-build" CACHE PATH "Mono installation directory")
set(MONO_REV "mono-4.2.1.60" CACHE STRING "Mono revision to checkout")
set(MONO_APPLY_PATCHES TRUE CACHE BOOL "Should patches be applied?")

if (MONO_APPLY_PATCHES)
	set(MONO_APPLY_PATCHES_VALUE "yes")
else()
	set(MONO_APPLY_PATCHES_VALUE "no")
endif()

add_custom_target(
	MonoBuild ALL	
	COMMAND bash scripts/mono-build.sh
		"${MONO_SRC_DIR}"
		"${MONO_REV}"
		"${MONO_APPLY_PATCHES_VALUE}"
		"${CMAKE_SOURCE_DIR}/patches"
		"${MONO_INSTALL_DIR}"
		"${ANDROID_NDK}"
		"${ANDROID_SYSROOT}"
		"${ANDROID_TOOLCHAIN_MACHINE_NAME}"
		"${ANDROID_TOOLCHAIN_ROOT}/bin"
	WORKING_DIRECTORY
		"${CMAKE_SOURCE_DIR}")
