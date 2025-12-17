do_install:append() {
  install -d ${D}${includedir}/WPEFramework/ocdm
  install -m 0644 ${S}/Source/ocdm/open_cdm.h ${D}${includedir}/WPEFramework/ocdm
  install -m 0644 ${S}/Source/ocdm/open_cdm_ext.h ${D}${includedir}/WPEFramework/ocdm
  install -m 0644 ${S}/Source/ocdm/adapter/open_cdm_adapter.h ${D}${includedir}/WPEFramework/ocdm
}
