#!/bin/sh

#  Script.sh
#  
#
#  Created by moldeo on 3/2/16.
#
libdir='/opt/local/lib'
prefix='/opt/local'

bindir=${prefix}/bin
datadir=${prefix}/share/moldeo/data
modulesdir=${libdir}/moldeo
docdir=${prefix}/share/doc/moldeo
preeffectsdir=${modulesdir}/preeffects
effectsdir=${modulesdir}/effects
posteffectsdir=${modulesdir}/posteffects
iodevicesdir=${modulesdir}/iodevices
mastereffectsdir=${modulesdir}/mastereffects
resourcesdir=${modulesdir}/resources
moldeoversiondir=${prefix}/share/moldeo

moldeoplayersdl2=${bindir}/moldeoplayersdl2
moldeologo=${datadir}/icons/moldeologo.png
moldeotrans=${datadir}/icons/moldeotrans.png
moldeofont=${datadir}/fonts/Tuffy.ttf
mp2='Moldeo.app/Contents/MacOS/moldeoplayersdl2'

mkdir moldeo.iconset
sips -z 16 16     ${moldeologo} --out moldeo.iconset/icon_16x16.png
sips -z 32 32     ${moldeologo} --out moldeo.iconset/icon_16x16@2x.png
sips -z 32 32     ${moldeologo} --out moldeo.iconset/icon_32x32.png
sips -z 64 64     ${moldeologo} --out moldeo.iconset/icon_32x32@2x.png
sips -z 128 128   ${moldeologo} --out moldeo.iconset/icon_128x128.png
sips -z 256 256   ${moldeologo} --out moldeo.iconset/icon_128x128@2x.png
sips -z 256 256   ${moldeologo} --out moldeo.iconset/icon_256x256.png
sips -z 512 512   ${moldeologo} --out moldeo.iconset/icon_256x256@2x.png
sips -z 512 512   ${moldeologo} --out moldeo.iconset/icon_512x512.png
cp ${moldeologo} moldeo.iconset/icon_512x512@2x.png
iconutil -c icns moldeo.iconset
rm -R moldeo.iconset


rm -Rf Moldeo.app
mkdir Moldeo.app
mkdir Moldeo.app/Contents
mkdir Moldeo.app/Contents/MacOS
mkdir Moldeo.app/Contents/Resources
mkdir Moldeo.app/Contents/Resources/data
mkdir Moldeo.app/Contents/Resources/data/icons
mkdir Moldeo.app/Contents/Resources/data/fonts
mkdir Moldeo.app/Contents/Resources/data/shaders
mkdir Moldeo.app/Contents/Resources/plugins
mkdir Moldeo.app/Contents/Resources/plugins/iodevices
mkdir Moldeo.app/Contents/Resources/plugins/resources
mkdir Moldeo.app/Contents/Resources/plugins/effects
mkdir Moldeo.app/Contents/Resources/plugins/preeffects
mkdir Moldeo.app/Contents/Resources/plugins/posteffects
mkdir Moldeo.app/Contents/Resources/plugins/mastereffects


mkdir Moldeo.app/Contents/PlugIns
mkdir Moldeo.app/Contents/SharedSupport
cp ${moldeologo} Moldeo.app/Contents/Resources
cp ${moldeologo} Moldeo.app/Contents/Resources/data/icons
cp ${moldeotrans} Moldeo.app/Contents/Resources/data/icons
cp ${moldeofont} Moldeo.app/Contents/Resources/data/fonts

cp ${effectsdir}/* Moldeo.app/Contents/Resources/plugins/effects
cp ${iodevicesdir}/* Moldeo.app/Contents/Resources/plugins/iodevices
cp ${preeffectsdir}/* Moldeo.app/Contents/Resources/plugins/preeffects
cp ${posteffectsdir}/* Moldeo.app/Contents/Resources/plugins/posteffects
cp ${mastereffectsdir}/* Moldeo.app/Contents/Resources/plugins/mastereffects
cp ${resourcesdir}/* Moldeo.app/Contents/Resources/plugins/resources


cp ${moldeologo} Moldeo.app/Contents/Resources
cp moldeo.icns Moldeo.app/Contents/Resources
cp ${moldeoplayersdl2} Moldeo.app/Contents/MacOS
cp Info.plist Moldeo.app/Contents
#relinking libs
#sdl2
cp ${libdir}/libSDL2-2.0.0.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libSDL2-2.0.0.dylib @executable_path/libSDL2-2.0.0.dylib ${mp2}

#libmoldeo
cp ${libdir}/libmoldeo.0.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libmoldeo.0.dylib @executable_path/libmoldeo.0.dylib ${mp2}

#libfreeimage
cp ${libdir}/libfreeimage.3.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libfreeimage.3.dylib @executable_path/libfreeimage.3.dylib ${mp2}
install_name_tool -change ${libdir}/libfreeimage.3.dylib @executable_path/libfreeimage.3.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib

#libboost_thread
cp ${libdir}/libboost_thread-mt.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libboost_thread-mt.dylib @executable_path/libboost_thread-mt.dylib ${mp2}
install_name_tool -change ${libdir}/libboost_thread-mt.dylib @executable_path/libboost_thread-mt.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib

#libboost_filesystem-mt.dylib
cp ${libdir}/libboost_filesystem-mt.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libboost_filesystem-mt.dylib @executable_path/libboost_filesystem-mt.dylib ${mp2}
install_name_tool -change ${libdir}/libboost_filesystem-mt.dylib @executable_path/libboost_filesystem-mt.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib

#libboost_system-mt.dylib
cp ${libdir}/libboost_system-mt.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libboost_system-mt.dylib @executable_path/libboost_system-mt.dylib ${mp2}
install_name_tool -change ${libdir}/libboost_system-mt.dylib @executable_path/libboost_system-mt.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib
install_name_tool -change ${libdir}/libboost_system-mt.dylib @executable_path/libboost_system-mt.dylib Moldeo.app/Contents/MacOS/libboost_thread-mt.dylib
install_name_tool -change ${libdir}/libboost_system-mt.dylib @executable_path/libboost_system-mt.dylib Moldeo.app/Contents/MacOS/libboost_filesystem-mt.dylib

#libGLEW.1.13.0.dylib
cp ${libdir}/libGLEW.1.13.0.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libGLEW.1.13.0.dylib @executable_path/libGLEW.1.13.0.dylib ${mp2}
install_name_tool -change ${libdir}/libGLEW.1.13.0.dylib @executable_path/libGLEW.1.13.0.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib

#lua-5.1/liblua-5.1.dylib
cp ${libdir}/lua-5.1/liblua-5.1.dylib Moldeo.app/Contents/MacOS/liblua-5.1.dylib
install_name_tool -change ${libdir}/lua-5.1/liblua-5.1.dylib @executable_path/liblua-5.1.dylib ${mp2}
install_name_tool -change ${libdir}/lua-5.1/liblua-5.1.dylib @executable_path/liblua-5.1.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib

#libtinyxml.dylib
cp ${libdir}/libtinyxml.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libtinyxml.dylib @executable_path/libtinyxml.dylib ${mp2}
install_name_tool -change ${libdir}/libtinyxml.dylib @executable_path/libtinyxml.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib

#libmuparser.0.dylib
cp ${libdir}/libmuparser.0.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libmuparser.0.dylib @executable_path/libmuparser.0.dylib ${mp2}
install_name_tool -change ${libdir}/libmuparser.0.dylib @executable_path/libmuparser.0.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib

#libSDL-1.2.0.dylib
cp ${libdir}/libSDL-1.2.0.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libSDL-1.2.0.dylib @executable_path/libSDL-1.2.0.dylib ${mp2}
install_name_tool -change ${libdir}/libSDL-1.2.0.dylib @executable_path/libSDL-1.2.0.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib

#libftgl.2.dylib
cp ${libdir}/libftgl.2.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libftgl.2.dylib @executable_path/libftgl.2.dylib ${mp2}
install_name_tool -change ${libdir}/libftgl.2.dylib @executable_path/libftgl.2.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib

#libfreetype.6.dylib
cp ${libdir}/libfreetype.6.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libfreetype.6.dylib @executable_path/libfreetype.6.dylib ${mp2}
install_name_tool -change ${libdir}/libfreetype.6.dylib @executable_path/libfreetype.6.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib
install_name_tool -change ${libdir}/libfreetype.6.dylib @executable_path/libfreetype.6.dylib Moldeo.app/Contents/MacOS/libftgl.2.dylib

#libcheck.0.dylib
cp ${libdir}/libcheck.0.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libcheck.0.dylib @executable_path/libcheck.0.dylib ${mp2}
install_name_tool -change ${libdir}/libcheck.0.dylib @executable_path/libcheck.0.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib

#libpng16.16.dylib
cp ${libdir}/libpng16.16.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libpng16.16.dylib @executable_path/libpng16.16.dylib Moldeo.app/Contents/MacOS/libfreetype.6.dylib

#libXrandr.2.dylib
cp ${libdir}/libXrandr.2.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXrandr.2.dylib @executable_path/libXrandr.2.dylib Moldeo.app/Contents/MacOS/libSDL-1.2.0.dylib

#libXext.6.dylib
cp ${libdir}/libXext.6.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXext.6.dylib @executable_path/libXext.6.dylib Moldeo.app/Contents/MacOS/libSDL-1.2.0.dylib
install_name_tool -change ${libdir}/libXext.6.dylib @executable_path/libXext.6.dylib Moldeo.app/Contents/MacOS/libXrandr.2.dylib



#libXrender.1.dylib
cp ${libdir}/libXrender.1.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXrender.1.dylib @executable_path/libXrender.1.dylib Moldeo.app/Contents/MacOS/libSDL-1.2.0.dylib
install_name_tool -change ${libdir}/libXrender.1.dylib @executable_path/libXrender.1.dylib Moldeo.app/Contents/MacOS/libXrandr.2.dylib


#libX11.6.dylib
cp ${libdir}/libX11.6.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libSDL-1.2.0.dylib
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libXext.6.dylib
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libXrandr.2.dylib
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libXrender.1.dylib

#libxcb.1.dylib
cp ${libdir}/libxcb.1.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libxcb.1.dylib @executable_path/libxcb.1.dylib Moldeo.app/Contents/MacOS/libX11.6.dylib

#libXau.6.dylib
cp ${libdir}/libXau.6.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXau.6.dylib @executable_path/libXau.6.dylib Moldeo.app/Contents/MacOS/libxcb.1.dylib

#libXdmcp.6.dylib
cp ${libdir}/libXdmcp.6.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXdmcp.6.dylib @executable_path/libXdmcp.6.dylib Moldeo.app/Contents/MacOS/libxcb.1.dylib

rm moldeo.icns
