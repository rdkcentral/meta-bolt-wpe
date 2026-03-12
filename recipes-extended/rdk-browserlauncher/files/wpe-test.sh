#!/bin/sh

export WEBKIT_GST_QUIRKS="rialto"
export WEBKIT_GST_HOLE_PUNCH_QUIRK="rialto"
export WEBKIT_GST_ENABLE_AUDIO_MIXER="1"

cd /usr/lib/rdk-browserlauncher/
./tests/browser_launcher_tests
