#!/bin/sh

# Update system
sudo xbps-install -Syu

# Allow installation of proprietary software
sudo xbps-install void-repo-multilib void-repo-nonfree

# Setup time zone
sudo ln -sf /usr/share/zoneinfo/Asia/Almaty /etc/localtime

# Install necessary software
sudo xbps-install -Syu base-devel opendoas \
  sddm xorg dbus polkit \
  git zsh tmux curl wget alacritty rxvt-unicode neovim lua luarocks \
  dejavu-fonts-ttf noto-fonts-ttf font-awesome \
  bspwm sxhkd rofi polybar picom feh conky dunst fastfetch \
  fzf btop rtkit p7zip ffmpeg ripgrep os-prober \
  pam_rundir pipewire wireplumber alsa-pipewire brightnessctl \
  yazi okular zathura \
  qemu libvirt virt-manager \
  firefox

# Create services
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/rtkit /var/service
sudo ln -s /etc/sv/polkitd /var/service
sudo ln -s /etc/sv/sddm /var/service
sudo ln -s /etc/sv/libvirtd /var/service
sudo ln -s /etc/sv/virtlogd /var/service
sudo ln -s /etc/sv/virtlockd /var/service

# Copy BSPWM dotfiles to ~/.config
cp -r .config .xprofile ~

# Setup alsa, pipewire and wireplumber
mkdir -p ~/.config/pipewire/pipewire.conf.d/
ln -s /usr/share/examples/wireplumber/10-wireplumber.conf ~/.config/pipewire/pipewire.conf.d
ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf ~/.config/pipewire/pipewire.conf.d
sudo mkdir -p /etc/alsa/conf.d
sudo ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
sudo ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d

# Create home folders
mkdir -p ~/downloads
mkdir -p ~/media/pictures/
mkdir -p ~/media/screenshots/
mkdir -p ~/projects
mkdir -p ~/software

# Copy wallpapers
cp -r ../wallpapers ~/media/pictures
