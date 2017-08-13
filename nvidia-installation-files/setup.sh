# add and install cuda through apt
#sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
#sudo apt-get update -yq
#sudo apt-get install cuda -yq

#NOTE I WOULD NOT TRUST THESE SCRIPTS
#they are probably out of date and incomplete
############# INIT ################################

#remove all nvidia related things
sudo apt-get purge nvidia-*


# blacklist nouveau (open source lib for GPU drivers)
if [ ! -d "/usr/lib/modprobe.d/" ]; then
   sudo mkdir /usr/lib/modprobe.d/
fi

if [ -f "/usr/lib/modprobe.d/blacklist-noveau.conf" ]; then
   sudo rm /usr/lib/modprobe.d/blacklist-nouveau.conf
fi

sudo echo "blacklist nouveau
options nouveau modeset=0" >> /usr/lib/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u

############# INSTALL DRIVERS #####################

# turn off lightdm, stops X server (GUI)
sudo service lightdm stop

sudo sh NVIDIA-Linux-x86_64-375.66.run

############### INSTALL CUDNN ######################

# make sure ~/cudnnlib directory exists
if [ ! -d "~/cudnnlib/" ]; then
   sudo mkdir ~/cudnnlib/
fi

tar -zxvf cudnn-8.0-linux-x64-v5.1.tgz -C ~/cudnnlib

############# INSTALL CUDA ########################

# run install script
#(lightdm should still be off)
sudo sh cuda_8.0.61_375.26_linux.run
