#!/bin/sh

# Install fundamebtal software
sudo xbps-install -Syu \
	dbus \
	git \
	zsh \
	tmux \
	curl \
	wget \
	xautolock \
	xorg \
	sxhkd \
	base-devel \
	libX11-devel \
	libXft-devel \
	libXinerama-devel \
	libXrandr-devel \
	freetype-devel \
	fontconfig-devel \
	feh \
	picom \
	zathura \
	yazi \
	pipewire \
	wireplumber \
	alsa-pipewire \
	ffmpeg \
	neovim \
	emacs \
	fastfetch \
	libvirt \
	qemu \
	virt-manager \
	polkit \
	mesa-nouveau-dri \
	xf86-video-nouveau \
	chrony \
	lightdm \
	lightdm-mini-greeter \
	firefox

# Set time
sudo ln -sf /usr/share/zoneinfo/Asia/Almaty /etc/localtime

# Add user to groups
sudo usermod -aG input,video,libvirt,kvm $USER

# Copying zsh, tmux, xinit files to $HOME
cp .zshrc $HOME
cp .tmux.conf $HOME
cp .xprofile $HOME
sudo cp pics/lock.jpg /etc/lightdm
# Adding wallpapers
cp -r pics $HOME

# Making suckless setup
mkdir -p $HOME/.suckless
cd $HOME/.suckless
git clone https://git.suckless.org/st
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/slock
git clone https://git.suckless.org/slstatus

for dir in st dwm dmenu slock slstatus;
do
	cd $dir && sudo make clean install && cd ..
done

# FROM NOW ON PATH IS $HOME

# Setting up audio
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d

# Setting up mini greeter
sudo cp lightdm-mini-greeter.conf /etc/lightdm

# Setting up visuals
xrandr --output DP-4 --mode 1920X1080 --rate 239.96

# Enabling services
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/chronyd /var/service
sudo ln -s /etc/sv/lightdm /var/service
# services for virtualization with qemu 
sudo ln -s /etc/sv/polkitd /var/service
sudo ln -s /etc/sv/libvirtd /var/service
sudo ln -s /etc/sv/virtlogd /var/service
sudo ln -s /etc/sv/virtlockd /var/service

