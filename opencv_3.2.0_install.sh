echo -e "\033[40;31m[RO:BIT] installing OpenCV 3.2.0\033[0m"
echo -e "\033[40;31m[RO:BIT] robit 17th myeungjin lee\033[0m"
echo ""
echo ""
echo ""

echo -e "\033[40;31m[RO:BIT] DELETING other OpenCV\033[0m"
sudo apt-get purge -y libopencv* python-opencv
sudo apt autoremove -y
echo ""
echo ""
echo ""

echo -e "\033[40;31m[RO:BIT] updating packages\033[0m"
sudo apt update -y
sudo apt upgrade -y
echo ""
echo ""
echo ""

echo -e "\033[40;31m[RO:BIT] installing packages\033[0m"
sudo apt-get install -y build-essential cmake unzip pkg-config
sudo apt-get install -y libjpeg-dev libpng-dev libtiff-dev
sudo apt-get install -y build-essential cmake pkg-config git
sudo apt-get install -y libjpeg-dev libtiff5-dev libpng-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libxvidcore-dev libx264-dev libxine2-dev
sudo apt-get install -y libv4l-dev v4l-utils
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev 
sudo apt-get install -y libgtk2.0-dev
sudo apt-get install -y mesa-utils libgl1-mesa-dri libgtkgl2.0-dev libgtkglext1-dev
sudo apt-get install -y libatlas-base-dev gfortran libeigen3-dev
sudo apt-get install -y python2.7-dev python3-dev python-numpy python3-numpy
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev v4l-utils libxvidcore-dev libx264-dev libxine2-dev
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y libgtk-3-dev
sudo apt-get install -y mesa-utils libgl1-mesa-dri libgtkgl2.0-dev libgtkglext1-dev
sudo apt-get install -y libatlas-base-dev gfortran libeigen3-dev
sudo apt-get install -y -y build-essential cmake
sudo apt-get install -y pkg-config
sudo apt-get install -y libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libxvidcore-dev libx264-dev libxine2-dev
sudo apt-get install -y libv4l-dev v4l-utils
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev 
sudo apt-get install -y libqt4-dev 
sudo apt-get install -y mesa-utils libgl1-mesa-dri libqt4-opengl-dev 
sudo apt-get install -y mesa-utils libgtkgl2.0-dev libgtkglext1-dev
sudo apt-get install -y libatlas-base-dev gfortran libeigen3-dev
sudo apt-get install -y libgtk-3-dev
sudo apt-get install -y python2.7-dev python3-dev python-numpy python3-numpy
sudo apt-get install -y qt5-default
echo ""
echo ""
echo ""

echo -e "\033[40;31m[RO:BIT] making OpenCV folder\033[0m"
mkdir opencv
cd opencv/
wget -O opencv.zip https://github.com/opencv/opencv/archive/3.2.0.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.2.0.zip

unzip opencv.zip && unzip opencv_contrib.zip
cd opencv-3.2.0
mkdir build
cd build
echo ""
echo ""
echo ""

echo -e "\033[40;31m[RO:BIT] CMAKE!\033[0m"
cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D WITH_TBB=OFF \
-D WITH_IPP=OFF \
-D WITH_1394=OFF \
-D BUILD_WITH_DEBUG_INFO=OFF \
-D BUILD_DOCS=OFF \
-D INSTALL_C_EXAMPLES=ON \
-D INSTALL_PYTHON_EXAMPLES=ON \
-D BUILD_EXAMPLES=OFF \
-D BUILD_TESTS=OFF \
-D BUILD_PERF_TESTS=OFF \
-D WITH_QT=OFF \
-D WITH_GTK=ON \
-D WITH_OPENGL=ON \
-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
-D WITH_V4L=ON  \
-D WITH_FFMPEG=ON \
-D WITH_XINE=ON \
-D BUILD_NEW_PYTHON_SUPPORT=ON \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D WITH_CUDA=OFF \
../
echo ""
echo ""
echo ""

echo -e "\033[40;31m[RO:BIT] make\033[0m"
time make -j $(nproc)
sudo make install
sudo sh -c 'echo '/usr/local/lib' > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
echo ""
echo ""
echo ""

echo -e "\033[40;31m[RO:BIT] Installation Complete\033[0m"
echo -e "\033[40;31m[RO:BIT] Curent version of OpenCV is : \033[0m" 
pkg-config --modversion opencv
echo -e "\033[40;31m[RO:BIT] Reboot might be needed\033[0m"

cd
rm -rf opencv_3.2.0_install


