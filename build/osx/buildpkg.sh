#build mac osx package
rm Moldeo.pkg
rm MoldeoInstaller.pkg
rm Distribution.xml
rm MoldeoAppComponents.plist
sudo rm -Rf ./MoldeoApp
mkdir MoldeoApp
mkdir MoldeoApp/Applications
cp -R Moldeo.app MoldeoApp/Applications
pkgbuild --analyze --root ./MoldeoApp MoldeoAppComponents.plist
/usr/libexec/PlistBuddy -c 'set :0:BundleIsRelocatable false' MoldeoAppComponents.plist
pkgbuild --identifier com.moldeointeractive.moldeo --version 1.0 --root ./MoldeoApp --component-plist ./MoldeoAppComponents.plist Moldeo.pkg

gstv=1.9.90
echo 'GStreamer version: '${gstv}
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/base-crypto-${gstv}-x86_64.pkg ./gstflat/base-crypto-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/base-system-1.0-${gstv}-x86_64.pkg ./gstflat/base-system-1.0-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-capture-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-capture-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-codecs-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-codecs-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-codecs-gpl-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-codecs-gpl-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-codecs-restricted-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-codecs-restricted-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-core-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-core-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-devtools-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-devtools-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-dvd-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-dvd-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-editing-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-editing-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-effects-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-effects-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-encoding-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-encoding-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-libav-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-libav-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-net-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-net-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-net-restricted-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-net-restricted-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-playback-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-playback-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-system-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-system-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/gstreamer-1.0-visualizers-${gstv}-x86_64.pkg ./gstflat/gstreamer-1.0-visualizers-${gstv}-x86_64.pkg
pkgutil --flatten ./gstreamer-1.0-${gstv}-x86_64/osx-framework-${gstv}-x86_64.pkg ./gstflat/osx-framework-${gstv}-x86_64.pkg




productbuild --synthesize --package Moldeo.pkg \
--package ./gstflat/base-crypto-${gstv}-x86_64.pkg \
--package ./gstflat/base-system-1.0-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-capture-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-codecs-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-codecs-gpl-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-codecs-restricted-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-core-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-devtools-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-dvd-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-editing-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-effects-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-encoding-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-libav-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-net-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-net-restricted-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-playback-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-system-${gstv}-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-visualizers-${gstv}-x86_64.pkg \
--package ./gstflat/osx-framework-${gstv}-x86_64.pkg \
Distribution.xml

sed -i "" \
-e '$ i\
\    <title>Moldeo for Mac OSX</title>' \
-e '$ i\
\    <background file="background.png" alignment="topleft" scaling="proportional" />' \
-e '$ i\
\    <welcome file="license.txt" />' \
"Distribution.xml"

productbuild --distribution ./Distribution.xml --package-path . --package-path ./gstflat/ --resources ./Resources  ./MoldeoInstaller.pkg
