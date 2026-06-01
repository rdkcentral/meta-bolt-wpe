DEPENDS:remove = "westeros"
DEPENDS:remove = "wpeframework-clientlibraries"
DEPENDS:remove = "virtual/vendor-secapi2-adapter"
DEPENDS:remove = "virtual/vendor-westeros-sink"
DEPENDS:remove = "virtual/vendor-gst-drm-plugins"

DEPENDS += "rialto-ocdm-link"
RDEPENDS:${PN} += "rialto-gstreamer"

EXTRA_VERSIONS_PATH ??= "${TMPDIR}/versions"
SRC_URI += "file://2.38.8/w3c_lifecycle.patch"
SRC_URI += "file://2.38.8/1679.patch"

DISTRO_FEATURES:append = " opencdm"
