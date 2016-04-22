
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

mkdir build
cd build


#sudo apt-get install locate libudev-dev
#wget http://libsdl.org/release/SDL2-2.0.3.tar.gz
#tar xvfz SDL2-2.0.3.tar.gz
#rm SDL2-2.0.3.tar.gz
#cd SDL2-2.0.3
#mkdir build
#cd build
# "--disable-video-opengl" is used to disable the software implementation of desktop OpenGL on the Pi
# "--host=*" is used to force the Raspberry Pi host. See issue #395 on GitHub for details on why.
#../configure --prefix=/usr --libdir=/usr/lib CPPFLAGS="-I/opt/vc/include" LDFLAGS="-L/opt/vc/lib" --host=armv7l-raspberry-linux-gnueabihf --disable-pulseaudio --disable-esd --disable-video-mir --disable-video-wayland --disable-video-x11 --disable-video-opengl
#make
#sudo make install
#cd ../../

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
