#!/bin/sh

# Update system
sudo xbps-install -Syu

# Allow installation of proprietary software
sudo xbps-install void-repo-multilib void-repo-nonfree

# Set up time zone
# sudo ln -sf /usr/share/zoneinfo/Asia/Almaty /etc/localtime

# Install necessary software
sudo xbps-install -Syu \
	base-devel \
	sddm \
    xorg \
	dbus \
	polkit \
	git \
	zsh \
	tmux \
	curl \
	wget \
	neovim \
	alacritty \
	rxvt-unicode \
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
	fzf \
	btop \
	rtkit \
	p7zip \
	ffmpeg \
	ripgrep \
	pipewire \
	os-prober \
	wireplumber \
	alsa-pipewire \
	brightnessctl \
	yazi \
    okular \
	zathura \
	qemu \
	libvirt \
	virt-manager \
	firefox \
    lua \
    luarocks

# Create services
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/rtkit /var/service
sudo ln -s /etc/sv/polkitd /var/service
sudo ln -s /etc/sv/sddm /var/service
sudo ln -s /etc/sv/libvirtd /var/service
sudo ln -s /etc/sv/virtlogd /var/service
sudo ln -s /etc/sv/virtlockd /var/service

# Copy BSPWM dotfiles to ~/.config
cp -r .config ~/.config

# Create home folders
mkdir -p ~/downloads 
mkdir -p ~/media/pictures/
mkdir -p ~/media/screenshots/
mkdir -p ~/projects
mkdir -p ~/software

# Copy wallpapers
cp -r ../wallpapers ~/meida/pictures
cp .xprofile ~

