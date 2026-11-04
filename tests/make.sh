#!/bin/sh

DIR="$(cd "$(dirname "${0}")" && pwd)"
TMP="tmp"
TST="usr/share/tests"
HTML="lifecycle.html \
        webgl2d.html \
        webgl3d.html"

cd "${DIR}"

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
