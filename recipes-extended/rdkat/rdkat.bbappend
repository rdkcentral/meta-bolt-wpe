do_compile () {
    oe_runmake -C ${S} -f Makefile
}

do_install () {
    export INSTALL_PATH=${D}
    oe_runmake -C ${S} -f Makefile install
}
