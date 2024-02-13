#!/bin/sh

# This is a list of applications and software that I use which I install through a script.
# This script doesn't need to be run.

# Install applications
cd
cd Downloads
# Setup bluetooth
sudo dnf install bluez* -y
sudo dnf install blueman -y
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
# Install text editors
sudo dnf install nano neovim -y
# Install GCC/G++ compiler, clang, make and automake
sudo dnf install make automake gcc gcc-c++ kernel-devel valgrind clang -y
# Install java
#sudo dnf install openjdk-17-jdk -y
# Install vscode
sudo dnf install wget gpg
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf update
sudo dnf install code -y
# Install krita, gimp
sudo dnf install krita gimp -y
# Install gparted
sudo dnf install gparted -y
# Install mate-calculator
sudo dnf install mate-calc -y
# Install spotify
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install lpf-spotify-client -y
sudo usermod -a -G pkg-build $USER
# Install discord
sudo dnf install discord -y
# Install onlyoffice
wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm
sudo dnf install ./onlyoffice-desktopeditors.x86_64.rpm -y
# Install zoom
wget https://zoom.us/client/latest/zoom_x86_64.rpm 
sudo dnf install ./zoom_x86_64.rpm -y
# Install pip3
sudo dnf install python3-pip -y
# Install pip libraries - flask, pygame, jedi
sudo dnf install python3-flask python3-pygame python3-jedi -y # Need to find rpm package for python3-pylint-common
# Install SDL2 Libraries
sudo dnf install SDL2-devel SDL2_image-devel SDL2_mixer-devel SDL2_ttf-devel -y
# Install neofetch
sudo dnf install neofetch -y
# Install sqlitebrowser
sudo dnf install sqlitebrowser -y
# Install firefox-esr
sudo dnf install firefox -y
# Install qemu+kvm virt-manager
# sudo dnf install virt-manager qemu-kvm libvirt virt-install bridge-utils libvirt-devel virt-top libguestfs-tools guestfs-tools -y
# sudo systemctl start libvirtd
# sudo systemctl enable libvirtd
# sudo usermod -aG sudo libvirt-qemu	# Add libvirtd to sudo group
# sudo usermod -aG libvirt tvdragon	# Add tvdragon to libvirtd group
# Install redshift
sudo dnf install redshift-gtk -y
# Install sdk
cd
sudo dnf install curl unzip zip -y
curl -s "https://get.sdkman.io" | bash
# Needs to manually be typed below
# source "$HOME/.sdkman/bin/sdkman-init.sh"
# # Install gradle
# sdk install gradle 7.4
# sdk use gradle 7.4
# # Coc plugins
# nvim ~/.config/nvim/init.vim
# :PlugInstall
# cd ~/.local/share/nvim/plugged/coc.nvim
# npm install -g yarn
# yarn install
# Delete all directories and files in Downloads folder
cd ~/Downloads/
rm *.rpm

# Need to reboot then agree to Spotify agreement by entering command below in terminal
# lpf approve spotify-client
# sudo -u pkg-build lpf build spotify-client
# sudo dnf install /var/lib/lpf/rpms/spotify-client/spotify-client-*.rpm