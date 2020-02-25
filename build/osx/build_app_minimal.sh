#!/bin/sh

#  Script.sh
#
#
#  Created by moldeo on 3/2/16.
#
libdir='/opt/local/lib'
prefix='/opt/local'

bindir=${prefix}/bin
moldeodir=${prefix}/share/moldeo
datadir=${moldeodir}/data
modulesdir=${libdir}/moldeo
docdir=${prefix}/share/doc/moldeo
preeffectsdir=${modulesdir}/preeffects
effectsdir=${modulesdir}/effects
posteffectsdir=${modulesdir}/posteffects
iodevicesdir=${modulesdir}/iodevices
mastereffectsdir=${modulesdir}/mastereffects
resourcesdir=${modulesdir}/resources
moldeoversiondir=${moldeodir}

moldeoplayersdl2=${bindir}/moldeoplayersdl2
moldeocontrol=
moldeologo=${datadir}/icons/moldeologo.png
moldeotrans=${datadir}/icons/moldeotrans.png
moldeofont=${datadir}/fonts/Tuffy.ttf
moldeoversiontxt=${moldeoversiondir}/moldeoversion.txt
mp2='Moldeo.app/Contents/MacOS/moldeoplayersdl2'
moldeobasic=${moldeodir}/basic
moldeosamples=${moldeodir}/samples
moldeotaller=${moldeodir}/taller

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
rm -Rf MoldeoControl
rm -Rf ./build

cp -R ../../moldeonet/MoldeoControl ./MoldeoControl
cd MoldeoControl && npm install
cd ../
sudo nwbuild --platforms "osx32" --version 0.12.2 --macIcns ./moldeo.icns --appName "Moldeo" --appVersion "1.0.0" ./MoldeoControl
sudo chown -R moldeo:staff ./build
sudo chmod -R +r ./build
sudo chmod +x ./build/MoldeoControl/osx32/MoldeoControl.app/Contents/MacOS/nwjs
sudo chmod +x ./build/MoldeoControl/osx32/MoldeoControl.app/Contents/Frameworks/nwjs\ Helper.app/Contents/MacOS/nwjs\ Helper
sudo chmod +x ./build/MoldeoControl/osx32/MoldeoControl.app/Contents/Frameworks/nwjs\ Helper\ EH.app/Contents/MacOS/nwjs\ Helper\ EH
sudo chmod +x ./build/MoldeoControl/osx32/MoldeoControl.app/Contents/Frameworks/nwjs\ Helper\ NP.app/Contents/MacOS/nwjs\ Helper\ NP

cp -R ./build/MoldeoControl/osx32/MoldeoControl.app Moldeo.app

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
cp ${moldeoversiontxt} Moldeo.app/Contents/Resources
cp ${moldeologo} Moldeo.app/Contents/Resources
cp ${moldeologo} Moldeo.app/Contents/Resources/data/icons
cp ${moldeotrans} Moldeo.app/Contents/Resources/data/icons
cp ${moldeofont} Moldeo.app/Contents/Resources/data/fonts

echo "effects"

cp ${effectsdir}/*.dylib Moldeo.app/Contents/Resources/plugins/effects
cp ${iodevicesdir}/*.dylib Moldeo.app/Contents/Resources/plugins/iodevices
cp ${preeffectsdir}/*.dylib Moldeo.app/Contents/Resources/plugins/preeffects
cp ${posteffectsdir}/*.dylib Moldeo.app/Contents/Resources/plugins/posteffects
cp ${mastereffectsdir}/*.dylib Moldeo.app/Contents/Resources/plugins/mastereffects
cp ${resourcesdir}/*.dylib Moldeo.app/Contents/Resources/plugins/resources

echo "samples"

cp -R ${moldeobasic} Moldeo.app/Contents/Resources/
cp -R ${moldeosamples} Moldeo.app/Contents/Resources/
cp -R ${moldeotaller} Moldeo.app/Contents/Resources/

cp ${moldeologo} Moldeo.app/Contents/Resources
cp moldeo.icns Moldeo.app/Contents/Resources
cp ${moldeoplayersdl2} Moldeo.app/Contents/MacOS
cp Info.plist Moldeo.app/Contents

echo "relinking libs"
#sdl2
cp ${libdir}/libSDL2-2.0.0.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libSDL2-2.0.0.dylib @executable_path/libSDL2-2.0.0.dylib ${mp2}

#libXcursor.1.dylib
cp ${libdir}/libXcursor.1.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXcursor.1.dylib @executable_path/libXcursor.1.dylib Moldeo.app/Contents/MacOS/libSDL2-2.0.0.dylib

#libXinerama.1.dylib
cp ${libdir}/libXinerama.1.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXinerama.1.dylib @executable_path/libXinerama.1.dylib Moldeo.app/Contents/MacOS/libSDL2-2.0.0.dylib

#libXi.6.dylib
cp ${libdir}/libXi.6.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXi.6.dylib @executable_path/libXi.6.dylib Moldeo.app/Contents/MacOS/libSDL2-2.0.0.dylib

#libXss.1.dylib
cp ${libdir}/libXss.1.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXss.1.dylib @executable_path/libXss.1.dylib Moldeo.app/Contents/MacOS/libSDL2-2.0.0.dylib

#libXxf86vm.1.dylib
cp ${libdir}/libXxf86vm.1.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXxf86vm.1.dylib @executable_path/libXxf86vm.1.dylib Moldeo.app/Contents/MacOS/libSDL2-2.0.0.dylib


#libmoldeo
cp ${libdir}/libmoldeo.0.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libmoldeo.0.dylib @executable_path/libmoldeo.0.dylib ${mp2}

#libalut.0.dylib
cp ${libdir}/libalut.0.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libalut.0.dylib @executable_path/libalut.0.dylib Moldeo.app/Contents/Resources/plugins/effects/libmoldeo_sound3d.dylib

#libopenal.1.dylib
cp ${libdir}/libopenal.1.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libopenal.1.dylib @executable_path/libopenal.1.dylib Moldeo.app/Contents/Resources/plugins/effects/libmoldeo_sound3d.dylib

#libsndfile.1.dylib
cp ${libdir}/libsndfile.1.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libsndfile.1.dylib @executable_path/libsndfile.1.dylib Moldeo.app/Contents/Resources/plugins/effects/libmoldeo_sound3d.dylib

#libFLAC.8.dylib
cp ${libdir}/libFLAC.8.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libFLAC.8.dylib @executable_path/libFLAC.8.dylib Moldeo.app/Contents/MacOS/libsndfile.1.dylib

#libvorbisenc.2.dylib
cp ${libdir}/libvorbisenc.2.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libvorbisenc.2.dylib @executable_path/libvorbisenc.2.dylib Moldeo.app/Contents/MacOS/libsndfile.1.dylib


#libvorbis.0.dylib
cp ${libdir}/libvorbis.0.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libvorbis.0.dylib @executable_path/libvorbis.0.dylib Moldeo.app/Contents/MacOS/libsndfile.1.dylib
install_name_tool -change ${libdir}/libvorbis.0.dylib @executable_path/libvorbis.0.dylib Moldeo.app/Contents/MacOS/libvorbisenc.2.dylib


#libogg.0.dylib
cp ${libdir}/libogg.0.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libogg.0.dylib @executable_path/libogg.0.dylib Moldeo.app/Contents/MacOS/libsndfile.1.dylib
install_name_tool -change ${libdir}/libogg.0.dylib @executable_path/libogg.0.dylib Moldeo.app/Contents/MacOS/libFLAC.8.dylib
install_name_tool -change ${libdir}/libogg.0.dylib @executable_path/libogg.0.dylib Moldeo.app/Contents/MacOS/libvorbis.0.dylib
install_name_tool -change ${libdir}/libogg.0.dylib @executable_path/libogg.0.dylib Moldeo.app/Contents/MacOS/libvorbisenc.2.dylib



echo "freeimage"
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

#libGLEW.2.1.0.dylib
cp ${libdir}/libGLEW.2.1.0.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libGLEW.2.1.0.dylib @executable_path/libGLEW.2.1.0.dylib ${mp2}
install_name_tool -change ${libdir}/libGLEW.2.1.0.dylib @executable_path/libGLEW.2.1.0.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib

#lua-5.1/liblua-5.1.dylib
cp ${libdir}/lua-5.1/liblua-5.1.dylib Moldeo.app/Contents/MacOS/liblua-5.1.dylib
install_name_tool -change ${libdir}/lua-5.1/liblua-5.1.dylib @executable_path/liblua-5.1.dylib ${mp2}
install_name_tool -change ${libdir}/lua-5.1/liblua-5.1.dylib @executable_path/liblua-5.1.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib

#libtinyxml.dylib
cp ${libdir}/libtinyxml.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libtinyxml.dylib @executable_path/libtinyxml.dylib ${mp2}
install_name_tool -change ${libdir}/libtinyxml.dylib @executable_path/libtinyxml.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib

#libmuparser.2.dylib
cp ${libdir}/libmuparser.2.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libmuparser.2.dylib @executable_path/libmuparser.2.dylib ${mp2}
install_name_tool -change ${libdir}/libmuparser.2.dylib @executable_path/libmuparser.2.dylib Moldeo.app/Contents/MacOS/libmoldeo.0.dylib

echo "libSDL1.2"
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
install_name_tool -change ${libdir}/libXrandr.2.dylib @executable_path/libXrandr.2.dylib Moldeo.app/Contents/MacOS/libSDL2-2.0.0.dylib

#libXext.6.dylib
cp ${libdir}/libXext.6.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXext.6.dylib @executable_path/libXext.6.dylib Moldeo.app/Contents/MacOS/libSDL2-2.0.0.dylib
install_name_tool -change ${libdir}/libXext.6.dylib @executable_path/libXext.6.dylib Moldeo.app/Contents/MacOS/libSDL-1.2.0.dylib
install_name_tool -change ${libdir}/libXext.6.dylib @executable_path/libXext.6.dylib Moldeo.app/Contents/MacOS/libXrandr.2.dylib
install_name_tool -change ${libdir}/libXext.6.dylib @executable_path/libXext.6.dylib Moldeo.app/Contents/MacOS/libXinerama.1.dylib
install_name_tool -change ${libdir}/libXext.6.dylib @executable_path/libXext.6.dylib Moldeo.app/Contents/MacOS/libXi.6.dylib
install_name_tool -change ${libdir}/libXext.6.dylib @executable_path/libXext.6.dylib Moldeo.app/Contents/MacOS/libXss.1.dylib
install_name_tool -change ${libdir}/libXext.6.dylib @executable_path/libXext.6.dylib Moldeo.app/Contents/MacOS/libXxf86vm.1.dylib



#libXrender.1.dylib
cp ${libdir}/libXrender.1.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXrender.1.dylib @executable_path/libXrender.1.dylib Moldeo.app/Contents/MacOS/libSDL2-2.0.0.dylib
install_name_tool -change ${libdir}/libXrender.1.dylib @executable_path/libXrender.1.dylib Moldeo.app/Contents/MacOS/libSDL-1.2.0.dylib
install_name_tool -change ${libdir}/libXrender.1.dylib @executable_path/libXrender.1.dylib Moldeo.app/Contents/MacOS/libXrandr.2.dylib
install_name_tool -change ${libdir}/libXrender.1.dylib @executable_path/libXrender.1.dylib Moldeo.app/Contents/MacOS/libXcursor.1.dylib

#libXfixes.3.dylib
cp ${libdir}/libXfixes.3.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXfixes.3.dylib @executable_path/libXfixes.3.dylib Moldeo.app/Contents/MacOS/libXcursor.1.dylib


echo "libX11.6"
#libX11.6.dylib
cp ${libdir}/libX11.6.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libSDL2-2.0.0.dylib
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libSDL-1.2.0.dylib
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libXext.6.dylib
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libXrandr.2.dylib
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libXrender.1.dylib
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libXcursor.1.dylib
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libXfixes.3.dylib
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libXinerama.1.dylib
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libXi.6.dylib
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libXss.1.dylib
install_name_tool -change ${libdir}/libX11.6.dylib @executable_path/libX11.6.dylib Moldeo.app/Contents/MacOS/libXxf86vm.1.dylib

#libxcb.1.dylib
cp ${libdir}/libxcb.1.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libxcb.1.dylib @executable_path/libxcb.1.dylib Moldeo.app/Contents/MacOS/libX11.6.dylib

#libXau.6.dylib
cp ${libdir}/libXau.6.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXau.6.dylib @executable_path/libXau.6.dylib Moldeo.app/Contents/MacOS/libxcb.1.dylib

#libXdmcp.6.dylib
cp ${libdir}/libXdmcp.6.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/libXdmcp.6.dylib @executable_path/libXdmcp.6.dylib Moldeo.app/Contents/MacOS/libxcb.1.dylib

#liblo.7.dylib
cp ${libdir}/liblo.7.dylib Moldeo.app/Contents/MacOS
install_name_tool -change ${libdir}/liblo.7.dylib @executable_path/liblo.7.dylib Moldeo.app/Contents/Resources/plugins/iodevices/libmoldeo_netoscin.dylib
install_name_tool -change ${libdir}/liblo.7.dylib @executable_path/liblo.7.dylib Moldeo.app/Contents/Resources/plugins/iodevices/libmoldeo_netoscout.dylib

#
rm moldeo.icns
