FILESEXTRAPATHS:prepend = "${THISDIR}/files:"
SRC_URI += "file://wpe-test.sh"

PACKAGECONFIG += "tests"
DEPENDS += "libsoup"

do_install:append() {
	install -d ${D}${bindir}
	install -m 0555 ${WORKDIR}/wpe-test.sh ${D}${bindir}/wpe-rdk.sh
}

FILES:${PN} = " \
	${bindir}/wpe-rdk.sh \
	${libdir}/${BPN}/BrowserLauncher \
	${libdir}/${BPN}/wpewebkit/ \
"

PROVIDES += "rdk-browsertests"
PACKAGES =+ "rdk-browsertests"
FILES:rdk-browsertests = " \
	${bindir}/wpe-rdk.sh \
	${libdir}/${BPN}/tests/ \
"
