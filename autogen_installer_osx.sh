#install XCode
#this install xcode command line tools
xcode-select --install

#install macports from macports, then run:
sudo port -v selfupdate

#installing packages:
port install subversion
port install git

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

export LDFLAGS='-L/opt/local/lib'
export CPPFLAGS='-I/opt/local/include'
export LD_LIBRARY_PATH=/opt/local/lib
export LD_INCLUDE_PATH=/opt/local/include

#moldeo dependencies:
# search name packages with: port search nameofthepackage
port install muparser
port install lua51
port install tinyxml
port install libsdl
port install libsdl2
port install glew
port install freeglut
#port install gle
port install ftgl
port install freeimage
port install freealut
port install gstreamer010*
port install boost +universal
#port install autoconf-archive
port install check
port install libtool
port install intltool
port install automake
port install pkgconfig


wget https://gstreamer.freedesktop.org/data/pkg/osx/1.20.2/gstreamer-1.0-1.20.2-universal.pkg
wget https://gstreamer.freedesktop.org/data/pkg/osx/1.20.2/gstreamer-1.0-devel-1.20.2-universal.pkg

#libmoldeo
#sudo apt-get install
#libmuparser-dev
#lua5.1-dev
#libtinyxml-dev
#!!! libgtk2.0-dev
#libsdl1.2-dev
#libsdl2-dev
#libglew-dev
#freeglut3-dev

#BAD!! libgle3-dev

#ftgl-dev
#libfreeimage-dev
#libalut-dev
#libgstreamer0.10-dev
#libgstreamer-plugins-base0.10-dev
#libboost-dev
#libboost-filesystem-dev
#libboost-thread-dev
#libboost-system-dev
#libasio-dev
#autoconf-archive
#check

#Moldeo Plugins
#sudo apt-get install libopencv-dev doxygen graphviz openjdk-7-jdk
port install opencv
port install doxygen
port install graphviz
#CHECK!! javacc or gjdb
#port install openjdk-7-jdk

#Moldeo Director
#sudo apt-get install libgtk2.0-dev   wx-common  libwxgtk2.8-dev
port install wxgtk-2.8
#port install wxWidgets-2.8
port install wx-common


#clone submodules repositories (libmoldeo, moldeodirector, moldeoplugins, libwxmoldeocontrols, moldeoplayer )
git submodule update --init

mkdir build
cd build

cd ../libmoldeo
git checkout master && git pull
./autogen_osx.sh
sudo make install

cd ../libwxmoldeocontrols
git checkout master && git pull
./autogen_osx.sh
sudo make install

cd ../moldeoplayer
git checkout master && git pull
./autogen_osx.sh
sudo make install

cd ../moldeoplugins
git checkout master && git pull
cd IODevices/Kinect
./install_OpenNI.sh
cd ../../
./autogen_osx.sh
sudo make install

cd ../moldeodirector
git checkout master && git pull
./autogen_osx.sh
sudo make install

cd ../moldeonet
./node-webkit_install.sh

cd ../moldeosamples
git checkout master && git pull
./autogen_osx.sh
make
sudo make install
