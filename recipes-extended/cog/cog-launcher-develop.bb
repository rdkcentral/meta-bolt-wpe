SUMMARY = "Script which configures and launches cog with development tools"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

SRC_URI += "file://cog-launcher"

RDEPENDS:${PN} += "cog"
RDEPENDS:${PN} += "wpe-webkit-web-inspector-plugin"
RDEPENDS:${PN} += "shared-mime-info"

do_install() {
  install -d ${D}${bindir}
  install -m 0555 ${WORKDIR}/cog-launcher ${D}${bindir}
  sed -i "0,/export WEBKIT_/s//export WEBKIT_INSPECTOR_HTTP_SERVER=0.0.0.0:12345\nexport WEBKIT_/" ${D}${bindir}/cog-launcher
}
