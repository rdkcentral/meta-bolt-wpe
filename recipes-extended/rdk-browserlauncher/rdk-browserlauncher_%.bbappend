FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://wpe-test.sh"
SRC_URI += "file://0001.prompt_envs_on_set.patch;patchdir=../"
SRC_URI += "file://0002.RDKEAPPRT-724_more_versatile_options_passing_via_config_file.patch;patchdir=../"
SRC_URI += "file://0003.BCM-2057_gstreamer_plugins_for_webaudio.patch;patchdir=../"
SRC_URI += "file://0004.Initial-support-for-pre-load-intent.patch;patchdir=../"

# entservices-runtime 1.2.6 tag
SRCREV = "c53ecb3c1996135b69c7f2f4ebed671a9f6e4128"

PACKAGECONFIG += "tests"

RDEPENDS:${PN}:append = " wpe-webkit xkeyboard-config"
RDEPENDS:${PN}:append = " wpe-webkit-web-inspector-plugin"
RDEPENDS:${PN}:append = " shared-mime-info"

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
