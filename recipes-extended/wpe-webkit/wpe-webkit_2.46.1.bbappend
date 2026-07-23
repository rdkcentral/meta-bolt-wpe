FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DEPENDS:remove = "virtual/vendor-secapi2-adapter"
DEPENDS:remove = "virtual/vendor-gst-drm-plugins"
DEPENDS:remove = "entservices-opencdmi"

DEPENDS += "rialto-ocdm-link"
RDEPENDS:${PN} += "rialto-gstreamer"

EXTRA_VERSIONS_PATH ??= "${TMPDIR}/versions"
#SRC_URI += "file://2.46/1681.patch"

DISTRO_FEATURES:append = " opencdm"
