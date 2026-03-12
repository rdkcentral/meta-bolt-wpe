SUMMARY = "RDK Browser Launcher bolt exec"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
FILESEXTRAPATHS:prepend = "${THISDIR}/files:"
SRC_URI += "file://wpe-rdk.sh"

RDEPENDS:${PN} = "rdk-browserlauncher bash"

do_install() {
	install -d ${D}${bindir}
	install -m 0555 ${WORKDIR}/wpe-rdk.sh ${D}${bindir}
}

FILES:${PN} = " \
	${bindir}/wpe-rdk.sh \
"
