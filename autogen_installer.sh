
#clone submodules repositories (libmoldeo, moldeodirector, moldeoplugins, libwxmoldeocontrols, moldeoplayer )
git submodule update --init
git submodule foreach git checkout master
git submodule foreach git pull

#libmoldeo
sudo apt-get install autoconf libtool automake libmuparser-dev lua5.1-dev libtinyxml-dev libgtk2.0-dev libsdl1.2-dev libsdl2-dev libglew-dev freeglut3-dev libgle3-dev ftgl-dev libfreeimage-dev libalut-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libboost-dev libboost-filesystem-dev libboost-thread-dev  libboost-system-dev libasio-dev autoconf-archive check

#Moldeo Plugins
sudo apt-get install libopencv-dev doxygen graphviz openjdk-7-jdk

#Moldeo Director
sudo apt-get install libgtk2.0-dev   wx-common  libwxgtk2.8-dev

mkdir build
cd build

cd ../libmoldeo
git checkout master && git pull
./autogen_x64.sh
make
sudo make install

cd ../libwxmoldeocontrols
git checkout master && git pull
./autogen_x64.sh
make
sudo make install

cd ../moldeoplayer
git checkout master && git pull
./autogen_x64.sh
make
sudo make install

cd ../moldeoplugins
git checkout master && git pull
cd IODevices/Kinect
./install_OpenNI.sh
cd ../../
./autogen_x64.sh
make
sudo make install

cd ../moldeodirector
git checkout master && git pull
./autogen_x64.sh
make
sudo make install

cd ../moldeonet
./node-webkit_install.sh

cd ../moldeosamples
git checkout master && git pull
./autogen_x64.sh
make
sudo make install