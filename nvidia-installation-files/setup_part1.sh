############# INIT ################################
#NOTE I WOULD NOT TRUST THESE SCRIPTS
#they are probably out of date and incomplete

#remove all nvidia related things
sudo apt-get purge nvidia-*

# do not use nouveau in the future (open source lib for GPU drivers)
if [ ! -d "/usr/lib/modprobe.d/" ]; then
   sudo mkdir /usr/lib/modprobe.d/
fi

if [ -f "/usr/lib/modprobe.d/blacklist-noveau.conf" ]; then
   sudo rm /usr/lib/modprobe.d/blacklist-nouveau.conf
fi

sudo echo "blacklist nouveau
#options nouveau modeset=0" >> /usr/lib/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u

# switch off lightdm this will make you boot without Xserver
sudo systemctl disable lightdm.service

# sudo shutdown the system
sudo shutdown -h now
