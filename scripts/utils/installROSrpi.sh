# From this guide:
# http://wiki.ros.org/indigo/Installation/UbuntuARM
# claims to be for Ubuntu Trusty, but also appears to work for Raspbian Jessie.

# Set locale stuff (optional?).
# Some of this seems to fail anyway.
sudo update-locale LANG=C LANGUAGE=C LC_ALL=C LC_MESSAGES=POSIX
sudo export LANGUAGE=en_US.UTF-8
sudo export LANG=en_US.UTF-8
sudo export LC_ALL=en_US.UTF-8
sudo update-locale LANG=C LANGUAGE=C LC_ALL=C LC_MESSAGES=POSIX
sudo locale-gen en_US.UTF-8
# probably optional-er:
#sudo dpkg-reconfigure locales
function aptinst {
    for i in 1 2 3 4
    do
        sudo apt-get install --yes --force-yes $@
        sleep 4
    done
}


# Add apt source/key.
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116
sudo apt-get update

# Instal ROS Indigo base. 
aptinst ros-indigo-ros-base

# Install other ROS packages.
aptinst ros-indigo-geometry python-rosdep
	
# Install some non-ROS packages.
aptinst python-pip arduino ipython vim git python-matplotlib
	
# Install some Python packages.
sudo pip install rosdep rosinstall_generator wstool rosinstall
	
# Initialize ROS.
sudo rosdep init
rosdep update