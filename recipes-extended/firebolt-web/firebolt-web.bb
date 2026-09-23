SUMMARY = "Firebolt Web Extension"
DESCRIPTION = "WPE WebKit extension for Firebolt JavaScript client providing C++ transport layer"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=ac5da370952f0d8ae72c087138a7deb8"

inherit cmake

PACKAGE_ARCH = "${MIDDLEWARE_ARCH}"

PV = "0.1.0"
PR = "r0"

# TODO: Update to tag when available
# SRC_URI = "git://github.com/rdkcentral/firebolt-js-client.git;protocol=https;tag=${PV}"
SRC_URI = "git://github.com/rdkcentral/firebolt-js-client.git;protocol=https;branch=feature/wpeextn"
SRCREV = "3abbb2ef0319e60fbcefc3b3b50be3365b7e5b51"

S = "${WORKDIR}/git"

# Dependencies
DEPENDS = " \
    libwpe \
    wpe-webkit \
    pkgconfig-native \
    glib-2.0 \
    glib-2.0-native \
"

# Ensure proper PIC compilation to avoid text relocations
CFLAGS += "-fPIC"
CXXFLAGS += "-fPIC"

# Custom CMake modules
EXTRA_OECMAKE += "-DCMAKE_MODULE_PATH=${S}/wpeExtension/cmake"

# Include generated C++ headers
EXTRA_OECMAKE += "-DCMAKE_INCLUDE_PATH=${S}/generated/cpp"

# Install to same directory as browser launcher (libexec/rdk-browserlauncher)
EXTRA_OECMAKE += "-DCMAKE_INSTALL_LIBDIR=${libexecdir}/rdk-browserlauncher"

PACKAGECONFIG ??= ""
PACKAGECONFIG[debug] = "-DCMAKE_BUILD_TYPE=Debug,-DCMAKE_BUILD_TYPE=Release"

FILES_SOLIBSDEV = ""
FILES:${PN} += "${libexecdir}/rdk-browserlauncher/wpewebkit/extensions/*.so"
FILES:${PN}-dbg += "${libexecdir}/.debug ${libexecdir}/rdk-browserlauncher/wpewebkit/extensions/.debug"

INSANE_SKIP:${PN} += "dev-so"
INSANE_SKIP:${PN}-dbg += "dev-so"

