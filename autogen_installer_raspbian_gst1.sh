
#clone submodules repositories (libmoldeo, moldeodirector, moldeoplugins, libwxmoldeocontrols, moldeoplayer )
git submodule update --init
git submodule foreach git checkout master
git submodule foreach git pull

#libmoldeo
sudo apt-get install autoconf libtool automake libmuparser-dev lua5.1-dev libtinyxml-dev libgtk2.0-dev libsdl1.2-dev libglew-dev freeglut3-dev libgle3-dev ftgl-dev libfreeimage-dev libalut-dev  libboost-dev libboost-filesystem-dev libboost-thread-dev  libboost-system-dev libasio-dev autoconf-archive check

#Moldeo Plugins
sudo apt-get install libopencv-dev doxygen graphviz openjdk-7-jdk
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
#Moldeo Director
sudo apt-get install libgtk2.0-dev   wx-common  libwxgtk2.8-dev
sudo apt-get install libgles2-mesa-dev libegl1-mesa-dev mesa-utils-extra libwayland-egl1-mesa
sudo apt-get install locate libudev-dev

cd build
./build_SDL2_gles.sh

cd ../libmoldeo
git checkout rc1gst1 && git pull
./autogen.sh --with-gles --enable-host=raspbian --prefix=/usr --libdir=/usr/lib --with-boost-libdir=/usr/lib/arm-linux-gnueabihf
make
sudo make install

cd ../moldeoplayer
git checkout rc1gst1 && git pull
./autogen.sh --with-gles --enable-host=raspbian  --prefix=/usr --libdir=/usr/lib 
make
sudo make install

cd ../moldeoplugins
git checkout rc1 && git pull
./autogen.sh --prefix=/usr --libdir=/usr/lib 
make
sudo make install

cd ../moldeonet
./node-webkit_install_arm.sh

cd ../moldeosamples
git checkout master && git pull
./autogen.sh --prefix=/usr --libdir=/usr/lib
make
sudo make install
