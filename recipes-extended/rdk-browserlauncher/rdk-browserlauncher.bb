SUMMARY = "RDK Browser Launcher"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = "file://../LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
FILESEXTRAPATHS:prepend = "${THISDIR}/files:"

S = "${WORKDIR}/git/BrowserLauncher"

PACKAGE_ARCH = "${MIDDLEWARE_ARCH}"
SRC_URI = "${CMF_GITHUB_ROOT}/entservices-runtime.git;protocol=${CMF_GITHUB_PROTOCOL};nobranch=1;"
SRC_URI += "file://wpe-rdk.sh"
#SRCREV = "0d818289957fc9746a8db851f8ec2b2814ceab41"
SRCREV = "69e29bf2476c5abb71762b8f7902b11ce8a4fb7c"
PV .= "+${@bb.fetch2.get_srcrev(d).replace('AUTOINC+','')}"

inherit pkgconfig cmake

PACKAGECONFIG[tests] = "-DENABLE_TESTS=ON,-DENABLE_TESTS=OFF,googletest,"
PACKAGECONFIG[testrunner] = "-DENABLE_TESTRUNNER=ON,-DENABLE_TESTRUNNER=OFF,westeros westeros-simpleshell,"

DEPENDS += "glib-2.0 glib-2.0-native wpe-webkit nlohmann-json firebolt-cpp-client firebolt-cpp-transport websocketpp"
RDEPENDS:${PN}:append = " wpe-webkit xkeyboard-config"
RDEPENDS:${PN}:append = " wpe-webkit-web-inspector-plugin"
RDEPENDS:${PN}:append = " shared-mime-info"

EXTRA_OECMAKE:append = " -DBROWSER_LAUNCHER_VERSION=${PV}"

do_install:append() {
	install -d ${D}${bindir}
	install -m 0555 ${WORKDIR}/wpe-rdk.sh ${D}${bindir} 
}

# override install prefix
EXTRA_OECMAKE:append = " -DCMAKE_INSTALL_PREFIX:PATH=${libdir}/${BPN}"
INSANE_SKIP:${PN} += "installed-vs-shipped"
