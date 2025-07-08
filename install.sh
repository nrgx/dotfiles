#!/bin/sh

sudo xbps-install -Syu \
	st \
	dwm \
	dmenu \
	slock \
	slstatus \
	xautolock \
	dbus \
	git \
	zsh \
	tmux \
	curl \
	wget \
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
	zathura \
	yazi \
	pipewire \
	wireplumber \
	alsa-lib \
	alsa-tools \
	alsa-utils \
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
 		
# Setting up audio
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d

# Setting up visuals
xrandr --output DP-4 --mode 1920X1080 --rate 239.96

# Setting up services
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/seatd /var/service
sudo ln -s /etc/sv/polkitd /var/service
sudo ln -s /etc/sv/libvirtd /var/service
sudo ln -s /etc/sv/virtlogd /var/service
sudo ln -s /etc/sv/virtlockd /var/service
