#!/bin/bash -e

DIR="$(cd "$(dirname "${0}")" && pwd)"
TMP="tmp"
TST="usr/share/tests"
IMGS="${DIR}/images.txt"
IMG="$(cat "${IMGS}" 2>/dev/null | sed s/\ .*//g)"
CONVERT="convert.im7"
PNGCRUSH="pngcrush"
HTML="lifecycle.html \
        webgl2d.html \
        webgl3d.html"

fail() {
        echo "FAIL: ${1}"
        exit -1
}

which ${CONVERT} > /dev/null || fail "no ${CONVERT}"
which ${PNGCRUSH} > /dev/null || fail "no ${PNGCRUSH}"

cd "${DIR}"

for f in ${IMG}; do
        if [ -f "${f}" -a "${IMGS}" -ot "${f}" ]; then
                continue;
        fi
        eval "args=( $(grep -e "^${f} " "${IMGS}" | sed "s:^${f} ::" | xargs printf '%q ') )"
        "${CONVERT}" "${args[@]}" "${f}"
        "${PNGCRUSH}" -brute -ow "${f}"
done

for f in ${HTML}; do
        BASE="${f%.*}"
        TGZ="${DIR}/rootfs-${BASE}.tgz"
        if [ -f "${TGZ}" -a "${f}" -ot "${TGZ}" ]; then
                continue;
        fi
        cd "${DIR}"
        mkdir -p "${TMP}/${TST}"
        cp "${BASE}"* "${TMP}/${TST}"
        cd "${TMP}"
        tar czf "${TGZ}" "${TST}/"
        cd "${DIR}"
        rm -fr "${TMP}"
done
