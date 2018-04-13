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

pkgutil --flatten ./gst/base-crypto-1.9.1-x86_64.pkg ./gstflat/base-crypto-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/base-system-1.0-1.9.1-x86_64.pkg ./gstflat/base-system-1.0-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-capture-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-capture-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-codecs-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-codecs-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-codecs-gpl-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-codecs-gpl-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-codecs-restricted-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-codecs-restricted-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-core-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-core-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-devtools-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-devtools-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-dvd-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-dvd-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-editing-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-editing-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-effects-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-effects-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-encoding-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-encoding-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-libav-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-libav-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-net-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-net-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-net-restricted-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-net-restricted-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-playback-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-playback-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-system-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-system-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/gstreamer-1.0-visualizers-1.9.1-x86_64.pkg ./gstflat/gstreamer-1.0-visualizers-1.9.1-x86_64.pkg
pkgutil --flatten ./gst/osx-framework-1.9.1-x86_64.pkg ./gstflat/osx-framework-1.9.1-x86_64.pkg




productbuild --synthesize --package Moldeo.pkg \
--package ./gstflat/base-crypto-1.9.1-x86_64.pkg \
--package ./gstflat/base-system-1.0-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-capture-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-codecs-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-codecs-gpl-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-codecs-restricted-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-core-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-devtools-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-dvd-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-editing-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-effects-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-encoding-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-libav-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-net-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-net-restricted-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-playback-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-system-1.9.1-x86_64.pkg \
--package ./gstflat/gstreamer-1.0-visualizers-1.9.1-x86_64.pkg \
--package ./gstflat/osx-framework-1.9.1-x86_64.pkg \
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
