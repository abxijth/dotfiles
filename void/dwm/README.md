# dwm configuration for void linux

## Install Packages
```
sudo xbps-install -Suy
sudo xbps-install -S void-repo-nonfree base-devel libX11-devel libXft-devel libXinerama-devel git curl wget xorg-minimal xorg-fonts xf86-input-evdev xinit dbus elogind alacritty firefox neovim ripgrep bat fastfetch feh picom brightnessctl scrot betterlockscreen xclip pipewire wireplumber alsa-pipewire pamixer pulseaudio-utils
```

## Setup Graphics Drivers
```
differs for each host
```

## Setup Dotfiles 
```
set it up according to the repo's folder structure
```

## Enable Services
```
sudo ln -s /etc/sv/dbus /var/service/
sudo ln -s /etc/sv/elogind /var/service/
sudo mkdir -p /etc/alsa/conf.d/ && sudo ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d/ && sudo ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d/ 
sudo mkdir -p ~/.config/pipewire/pipewire.conf.d/ && sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf ~/.config/pipewire/pipewire.conf.d/ 
```

## Done
```
startx
```
