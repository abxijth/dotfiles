# Dotfiles Setup

This repository contains my personal Linux configuration files.

---

## 📦 Required Packages

### Official repositories (pacman)

```bash
sudo pacman -S --needed \
fish rofi swaync fastfetch nautilus \
nwg-look pavucontrol \
ttf-jetbrains-mono-nerd gpsd
```

---

## 🧩 AUR Packages

### waybar with cava support

```bash
yay -S waybar-cava-git ttf-rubik
```

---

## ⭐ Starship Prompt

Install Starship shell prompt:

```bash
curl -sS https://starship.rs/install.sh | sh
```

---

## 🛠️ Install yay (AUR helper)

### Install dependencies

```bash
sudo pacman -S --needed base-devel git
```

### Build and install yay

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### Verify

```bash
yay --version
```

---

## 📁 Apply Dotfiles

Clone repo:

```bash
git clone https://github.com/abxijth/dotfiles.git
cd dotfiles
```

Copy configs:

```bash
cp -r .config/* ~/.config/
```

---

## 🐚 Fish Shell Setup

Set fish as default shell:

```bash
chsh -s /usr/bin/fish
```

---

## 📌 Notes

* Hyprland is assumed already installed via `archinstall`
* Only user-space configs are included here
* Some apps may require logout/login after install

