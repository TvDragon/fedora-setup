#!/bin/sh

cd
sudo dnf update && sudo dnf upgrade -y
# Essential installs
sudo dnf install curl wget tar unzip -y
sudo dnf install ./fedora-setup/rpm-packages/notify-osd-0.9.25-15.1.x86_64.rpm -y
sudo dnf install bspwm polybar sxhkd libnotify dunst pavucontrol thunar thunar-archive-plugin rofi dmenu picom xfce4-terminal lxpolkit feh network-manager-applet -y
# Less important installs
sudo dnf install lxappearance -y

# Install neovim and autoload directory
sudo dnf install neovim -y
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Install Node.js and npm for CocInstall neovim plugins
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install --lts

# Make directory so applications like spotify can be opened using rofi
sudo mkdir /usr/share/desktop-directories/

# Make dot files, copying configs, and copy wallpapers
cd
mkdir .config .icons .themes .fonts
mkdir Desktop Downloads Pictures Videos
mkdir Pictures/Wallpapers
cp -r fedora-setup/Wallpapers/* ~/Pictures/Wallpapers/
cp -r fedora-setup/dotconfigs/* ~/.config/

# Copying and making icons into icons folder
cp -r fedora-setup/doticons/* ~/.icons/
wget https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v5.0.1/gruvbox-plus-icon-pack-5.0.1.zip
unzip gruvbox-plus-icon-pack-5.0.1.zip -d ~/.icons/
git clone https://www.opencode.net/adhe/gruvboxplasma.git
cp -r gruvboxplasma/icons/Gruvbox ~/.icons/

# Copying themes into themes folder
cp -r fedora-setup/dotthemes/* ~/.themes/

# Installing fonts
cp -r fedora-setup/dotfonts/* ~/.fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases//download/v3.1.1/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases//download/v3.1.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.fonts/

# Copying desktop icons to view in rofi
sudo cp fedora-setup/desktop_icons/* /usr/share/applications/

# Copying other configs and settings
cp fedora-setup/.xinitrc ~/.
cp fedora-setup/.vimrc ~/.
sudo cp -r fedora-setup/terminal_themes/* /usr/share/xfce4/terminal/colorschemes/
# sudo os-prober
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/polybar/launch.sh

# Install display manager
sudo nala install sddm -y
sudo systemctl enable sddm
sudo systemctl set-default graphical.target