#!/bin/sh

sudo xbps-install -Syu \
	dbus \
	git \
	zsh \
	tmux \
	curl \
	wget \
	xautolock \
	xorg \
	xorg-minimal \
	xinit \
	sxhkd \
	base-devel \
	libX11-devel \
	libXft-devel \
	libXinerama-devel \
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
	seatd \
	mesa-nouveau-dri \
	xf86-video-nouveau
 	
# Adding wallpapers
cp pics ~

# Making suckless setup
mkdir -p ~/suckless
cd ~/suckless
git clone https://git.suckless.org/st
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/slock
git clone https://git.suckless.org/slstatus

for dir in st dwm dmenu slock slstatus;
do
	cd $dir && sudo make clean install && cd ..
done

# Setting up audio
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d

# Setting up visuals
xrandr --output DP-4 --mode 1920X1080 --rate 239.96

# Enabling services
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/seatd /var/service
# services for virtualization with qemu 
sudo ln -s /etc/sv/polkitd /var/service
sudo ln -s /etc/sv/libvirtd /var/service
sudo ln -s /etc/sv/virtlogd /var/service
sudo ln -s /etc/sv/virtlockd /var/service

