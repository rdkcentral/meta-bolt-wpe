#!/bin/sh

export GST_DEBUG="2,webkit*:6"
export GST_DEBUG_NO_COLOR="1"
export WEBKIT_DEBUG="all"
export WEBKIT_INSPECTOR_HTTP_SERVER=0.0.0.0:12345

cd /usr/lib/rdk-browserlauncher/
./BrowserLauncher $@
