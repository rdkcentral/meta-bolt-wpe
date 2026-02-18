SUMMARY = "RDK Browser Launcher"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://../LICENSE;md5=dc6e390ad71aef79d0c2caf3cde03a19"

S = "${WORKDIR}/git/BrowserLauncher"

PACKAGE_ARCH = "${MIDDLEWARE_ARCH}"
SRC_URI = "${CMF_GITHUB_ROOT}/entservices-runtime.git;protocol=${CMF_GITHUB_PROTOCOL};nobranch=1;"
SRCREV = "4bef1f6a91ce26ff715007df861f2a11866467ed"
PV .= "+${@bb.fetch2.get_srcrev(d).replace('AUTOINC+','')}"

inherit pkgconfig cmake

PACKAGECONFIG[tests] = "-DENABLE_TESTS=ON,-DENABLE_TESTS=OFF,googletest,"
PACKAGECONFIG[testrunner] = "-DENABLE_TESTRUNNER=ON,-DENABLE_TESTRUNNER=OFF,westeros westeros-simpleshell,"

DEPENDS += "glib-2.0 glib-2.0-native wpe-webkit nlohmann-json firebolt-cpp-client firebolt-cpp-transport websocketpp"
RDEPENDS:${PN}:append = " wpe-webkit xkeyboard-config"
RDEPENDS:${PN}:append = " wpe-webkit-web-inspector-plugin"
RDEPENDS:${PN}:append = " shared-mime-info"

EXTRA_OECMAKE:append = " -DBROWSER_LAUNCHER_VERSION=${PV}"

# override install prefix
EXTRA_OECMAKE:append = " -DCMAKE_INSTALL_PREFIX:PATH=${libdir}/${BPN}"
FILES:${PN} += "${libdir}/${BPN}"
