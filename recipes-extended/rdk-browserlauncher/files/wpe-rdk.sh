#!/bin/bash

INSECURE="--disableWebSecurity=true"
COMWEBGL="--enableNonCompositedWebGL=true"
PARAMS=""
URL=""
OPTIONS=$(getopt -o hf: --long help,file: --name "$0" -- "$@")

# If getopt fails, exit with an error
if [ $? -ne 0 ]; then
    exit 1
fi

# Use eval to set the positional parameters ( $@ ) to the output of getopt
eval set -- "$OPTIONS"

while true; do
    case "${1}" in
        --lightning)
            PARAMS="${PARAMS} ${COMWEBGL}"
            shift
            ;;
        --logs)
            export GST_DEBUG="2,webkit*:6"
            export GST_DEBUG_NO_COLOR="1"
            export WEBKIT_DEBUG="all"
            shift
            ;;
        --debug)
            PARAMS="${PARAMS} ${INSECURE}"
            export WEBKIT_INSPECTOR_HTTP_SERVER="0.0.0.0:12345"		
            shift # Shift past the option and its argument
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "unkown option: ${1}"
            break;
            ;;
    esac
done

URL="${1}"

if [[ -z "${URL}" ]]; then
    echo "missing url! $@";
    exit -3
fi
if [[ "${URL}" =~ "^file://(/.*)?$" ]]; then
    PARAMS="${PARAMS} ${INSECURE}"
fi

export WEBKIT_GST_QUIRKS="rialto"
export WEBKIT_GST_HOLE_PUNCH_QUIRK="rialto"
export WEBKIT_GST_ENABLE_AUDIO_MIXER="1"

cd /usr/lib/rdk-browserlauncher/
exec ./BrowserLauncher ${PARAMS} --url "${URL}"
