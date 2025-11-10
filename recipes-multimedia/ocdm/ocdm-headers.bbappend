do_install:append() {
  install -d ${D}${includedir}/WPEFramework/ocdm
  install -m 0644 ${WORKDIR}/open_cdm.h ${D}${includedir}/WPEFramework/ocdm
  install -m 0644 ${WORKDIR}/open_cdm_ext.h ${D}${includedir}/WPEFramework/ocdm
  install -m 0644 ${WORKDIR}/open_cdm_adapter.h ${D}${includedir}/WPEFramework/ocdm
}
