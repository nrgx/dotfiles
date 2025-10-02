#!/bin/sh

# Update system
sudo xbps-install -Syu

# Allow installation of proprietary software
sudo xbps-install void-repo-multilib void-repo-nonfree

# Set up time zone
sudo ln -sf /usr/share/zoneinfo/Asia/Almaty /etc/localtime

# Install necessary software
sudo xbps-install -Syu \
	base-devel \
	sddm \
	elogind \
	nvidia \
	wget \
	curl \
	zsh \
	alacritty \
	rxvt-unicode \
	tmux \
	neovim \
	git \
	p7zip \
	xorg-server \
	xset \
	xinit \
	xrandr \
	xsetroot \
	setxkbmap \
	xorg-input-drivers \
	xf86-input-libinput \
	xrdb \
	fontconfig \
	dejavu-fonts-ttf \
	noto-fonts-ttf \
	font-awesome \
	bspwm \
	sxhkd \
	rofi \
	polybar \
	picom \
	feh \
	conky \
	dunst \
	fastfetch \
	papirus-icon-theme \
	btop \
	fzf \
	ripgrep \
	ffmpeg \
	os-prober \
	pipewire \
	wireplumber \
	alsa-pipewire \
	rtkit \
	brightnessctl \
	dbus \
	polkit \
	yazi \
	zathura \
	libvirt \
	virt-manager \
	qemu \
	firefox \
    chrony

# Enable services
sudo ln -s /etc/sv/dbus		    /var/service
sudo ln -s /etc/sv/rtkit	    /var/service
sudo ln -s /etc/sv/polkitd	    /var/service
sudo ln -s /etc/sv/sddm		    /var/service
sudo ln -s /etc/sv/elogind	    /var/service
sudo ln -s /etc/sv/libvirtd	    /var/service
sudo ln -s /etc/sv/virtlogd	    /var/service
sudo ln -s /etc/sv/virtlockd	/var/service
sudo ln -s /etc/sv/chronyd      /var/service

# Fonts setup
sudo mkdir -p /usr/share/fonts/NerdFonts/ttf
# Go install FiraCode and symbols font and run fc-cache -fv

# Copy dotfiles to home root
cp config ~/.config

