#!/bin/sh

INSECURE="--disableWebSecurity=true"
COMWEBGL="--enableNonCompositedWebGL=true"
PARAMS="--enableMediaStream=true"
URL=""

URL_REGEX='^(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]\.[-A-Za-z0-9\+&@/%?=~_|]*[-A-Za-z0-9\+&@#/%=~_|]$'
FILE_REGEX='^file://(/.*)?$'

OPTIONS=$(getopt -o lvdh -l lightning,verbose,dev,help -n "$0" -- $@)

# If getopt fails, exit with an error
if [ $? -ne 0 ]; then
    exit -1
fi

# Use eval to set the positional parameters ( $@ ) to the output of getopt
eval set -- "$OPTIONS"

usage() {
    echo "RDK Browser Launcher runtime"
    echo
    echo "usage:"
    echo "    $(basename ${0}) [options] <url>"
    echo
    echo "options:"
    echo "    -h, --help      - show this message & exit"
    echo "    -l, --lightning - run as lightning app (html app is default)"
    echo "    -d, --dev       - adds inspector on port 12345"
    echo "    -v, --verbose   - enables webkit native & webkit gstreamer logs"
}

while true; do
    case "${1}" in
        -l|--lightning)
            PARAMS="${PARAMS} ${COMWEBGL}"
            shift
            ;;
        -v|--verbose)
            export GST_DEBUG="2,webkit*:6"
            export GST_DEBUG_NO_COLOR="1"
            export WEBKIT_DEBUG="all"
            shift
            ;;
        -d|--dev)
            PARAMS="${PARAMS} ${INSECURE}"
            export WEBKIT_INSPECTOR_HTTP_SERVER="0.0.0.0:12345"		
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        --)
            shift
            break
            ;;
        *)
            usage
            exit -2
            ;;
    esac
done

URL="${1}"

if [[ ! "${URL}" =~ ${URL_REGEX} ]]; then
    echo "missing url or not a url!";
    exit -3
fi

if [[ "${URL}" =~ ${FILE_REGEX} ]]; then
    PARAMS="${PARAMS} ${INSECURE}"
fi

export WEBKIT_GST_QUIRKS="rialto"
export WEBKIT_GST_HOLE_PUNCH_QUIRK="rialto"
export WEBKIT_GST_ENABLE_AUDIO_MIXER="1"

cd /usr/lib/rdk-browserlauncher/
exec ./BrowserLauncher ${PARAMS} --url "${URL}"
