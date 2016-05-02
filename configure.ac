#
# autoheader
# libtoolize
# automake –add-missing –foreign
# autoconf
# ./configure
# make
# make install
#
AC_INIT([Moldeo], [1.0.0.160], [info@moldeointeractive.com.ar], [moldeo])

AM_INIT_AUTOMAKE
AM_PROG_LIBTOOL
AC_CONFIG_MACRO_DIR([m4])

AC_CONFIG_SUBDIRS(
	libmoldeo
    moldeoplugins
    moldeoplayer
    moldeonet
    moldeosamples
)

AC_OUTPUT([
Makefile
libmoldeo/Makefile
moldeoplugins/Makefile
moldeoplayer/Makefile
moldeonet/Makefile
moldeosamples/Makefile
])
