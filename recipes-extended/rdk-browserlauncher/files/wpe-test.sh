#!/bin/sh

# export GST_DEBUG="2,webkit*:6"
# export GST_DEBUG_NO_COLOR="1"
# export WEBKIT_DEBUG="all"
# export WEBKIT_INSPECTOR_HTTP_SERVER=0.0.0.0:12345

export WEBKIT_GST_QUIRKS=rialto
export WEBKIT_GST_HOLE_PUNCH_QUIRK=rialto
export WEBKIT_GST_ENABLE_AUDIO_MIXER=1

cd /usr/lib/rdk-browserlauncher/
./tests/browser_launcher_tests
