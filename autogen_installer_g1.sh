
#clone submodules repositories (libmoldeo, moldeodirector, moldeoplugins, libwxmoldeocontrols, moldeoplayer )
git submodule update --init
git submodule foreach git checkout master
git submodule foreach git pull

#libmoldeo
sudo apt-get install autoconf libtool automake libmuparser-dev lua5.1-dev libtinyxml-dev libgtk2.0-dev libsdl1.2-dev libsdl2-dev libglew-dev freeglut3-dev libgle3-dev ftgl-dev libfreeimage-dev libalut-dev libboost-dev libboost-filesystem-dev libboost-thread-dev  libboost-system-dev libasio-dev autoconf-archive check liblo-dev libportmidi-dev

#gstreamer 1
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev

#Moldeo Plugins
sudo apt-get install libopencv-dev doxygen graphviz
sudo apt-get install openjdk-7-jdk
sudo apt-get install openjdk-8-jdk

#Moldeo Director
sudo apt-get install libgtk2.0-dev   wx-common  libwxgtk2.8-dev

mkdir build
cd build

cd ../libmoldeo
git checkout master && git pull
./autogen.sh --prefix=/usr --enable-gstreamer=1.0
make
sudo make install

cd ../moldeoplugins
git checkout master && git pull
cd IODevices/Kinect
./install_OpenNI.sh
cd ../../
./autogen.sh --prefix=/usr
make
sudo make install


cd ../moldeonet
./node-webkit_install.sh

cd ../moldeosamples
git checkout master && git pull
./autogen.sh --prefix=/usr
make
sudo make install

cd ../moldeoplayer
git checkout master && git pull
./autogen.sh --prefix=/usr --enable-gstreamer=1.0
make
sudo make install


cd ../libwxmoldeocontrols
git checkout master && git pull
./autogen.sh --prefix=/usr
make
sudo make install

cd ../moldeodirector
git checkout master && git pull
./autogen.sh --prefix=/usr
make
sudo make install


