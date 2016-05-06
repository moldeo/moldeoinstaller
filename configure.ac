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


dnl Set install paths.
if test "x$prefix" = "xNONE" ; then
  prefix="/usr/local"
fi
if test "x$exec_prefix" = "xNONE" ; then
  exec_prefix=$prefix
fi

case "$host" in
        *-*-mingw*|*-*-cygwin*)
                AC_DEFINE(PLATFORM_WIN32, 1, [Platform is Win32])
                PLATFORM_STRING="Win32"
                ;;
        *-*-linux*)
                AC_DEFINE(PLATFORM_LINUX, 1, [Platform is Linux])
                PLATFORM_STRING="Linux"
                ;;
        *-*-darwin*)
		AC_MSG_WARN([Hello])
                AC_DEFINE(PLATFORM_APPLE, 1, [Platform is Apple])
                PLATFORM_STRING="Apple"
                ;;
        *)
                AC_MSG_WARN([*** Please add $host to configure.ac checks!])
                ;;
esac


case "$host" in
        i?86-* | k?-* | athlon-* | pentium*-)
                AC_DEFINE(ARCH_X86, 1, [Architecture is x86])
                ARCH_SPECIFIC_CFLAGS=""
                ARCH_STRING="X86"
                ;;
        x86_64-*)
                AC_DEFINE(ARCH_X86_64, 1, [Architecture is x86-64])
                ARCH_SPECIFIC_CFLAGS="-DUSE_ADDR64"
                ARCH_STRING="X86-64"
                with_boost_libdir="/usr/lib/x86_64-linux-gnu"
                libdir=$prefix"/lib"
                ;;
        ppc-* | powerpc-*)
		AC_MSG_WARN([HI THERE!])
                AC_DEFINE(ARCH_PPC, 1, [Architecture is PowerPC])
                ARCH_SPECIFIC_CFLAGS=""
                ARCH_STRING="PowerPC"
                ;;
        *)
                AC_MSG_ERROR([Unknown Architecture])
                ;;
esac

AC_CONFIG_FILES([moldeo.sh], [chmod +x moldeo.sh])

AC_OUTPUT([Makefile])
