SUMMARY = "RDK Browser Launcher bolt exec"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
FILESEXTRAPATHS:prepend = "${THISDIR}/files:"
SRC_URI += "file://wpe-rdk.sh"
SRC_URI += "file://testuri.c"
SRC_URI += "file://CMakeLists.txt"

S = "${WORKDIR}"

DEPENDS = "libsoup-3.0 glib-2.0 pkgconfig-native"

inherit cmake

RDEPENDS:${PN} = "rdk-browserlauncher netcat"

do_install() {
	install -d ${D}${bindir}
	install -m 0555 ${WORKDIR}/wpe-rdk.sh ${D}${bindir}
	install -m 0755 ${B}/testuri ${D}${bindir}
}

FILES:${PN} = " \
	${bindir}/wpe-rdk.sh \
	${bindir}/testuri \
"
