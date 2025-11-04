SUMMARY = "Script which configures and launches cog"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

FILESEXTRAPATHS:prepend = "${THISDIR}/files:"

SRC_URI += "file://cog-launcher"

RDEPENDS:${PN} += "cog"

S = "${WORKDIR}"

do_compile[noexec] = "1"
do_configure[noexec] = "1"
do_patch[noexec] = "1"

do_install() {
  install -d ${D}${bindir}
  install -m 0555 ${S}/cog-launcher ${D}${bindir}
}

FILES:${PN} += "${bindir}"
