FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://wpe-test.sh"
SRC_URI += "file://0001.prompt_envs_on_set.patch;patchdir=../"

# entservices-runtime develop, PR 77 (RDKEMW-27353). Not a tag: it carries the
# config resilience that patch 0002 used to provide, which 1.2.8 predates.
SRCREV = "10067dd6d0dd2fc526644b7bc7c7ddc5bbf30345"

PACKAGECONFIG += "tests"

RDEPENDS:${PN}:append = " wpe-webkit xkeyboard-config"
RDEPENDS:${PN}:append = " wpe-webkit-web-inspector-plugin"
RDEPENDS:${PN}:append = " shared-mime-info"
RDEPENDS:${PN}:append = " firebolt-web"

RDEPENDS:${PN}:append = " gstreamer1.0-plugins-base-app"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-base-audioconvert"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-base-audiomixer"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-base-audioresample"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-base-gio"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-base-playback"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-base-typefindfunctions"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-good-audioparsers"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-good-autodetect"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-good-icydemux"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-good-id3demux"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-good-interleave"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-good-isomp4"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-good-matroska"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-good-wavparse"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-bad-inter"
RDEPENDS:${PN}:append = " gstreamer1.0-plugins-bad-videoparsersbad"

do_install:append() {
	install -d ${D}${bindir}
	install -m 0555 ${WORKDIR}/wpe-test.sh ${D}${bindir}/wpe-rdk.sh
}

FILES:${PN} = " \
	${libexecdir}/${BPN}/BrowserLauncher \
	${libexecdir}/${BPN}/wpewebkit/ \
"

PROVIDES += "rdk-browsertests"
PACKAGES =+ "rdk-browsertests"
RDEPENDS:rdk-browsertests = "rdk-browserlauncher"
FILES:rdk-browsertests = " \
	${bindir}/wpe-rdk.sh \
	${libexecdir}/${BPN}/tests/ \
"
