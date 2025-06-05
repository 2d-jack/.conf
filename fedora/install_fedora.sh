#!/usr/bin/env bash
set -e

echo "[*] Installing Hyprland and required tools on Fedora..."

sudo dnf update -y
sudo dnf install -y git @development-tools hyprland waybar rofi kitty thunar btop cava swappy fastfetch wlogout sddm kvantum qt5ct qt6ct

REPO_URL="https://github.com/2d-jack/.conf.git"
USERNAME=$(whoami)
HOME_DIR="/home/$USERNAME"
CONFIG_DIR="$HOME_DIR/.config"
PICTURES_DIR="$HOME_DIR/Pictures/wallpapers"

echo "[*] Cloning config repo..."
git clone "$REPO_URL" /tmp/hyprconf

mkdir -p "$CONFIG_DIR"
mkdir -p "$PICTURES_DIR"

echo "[*] Copying configuration files..."
for dir in ags btop cava fastfetch hypr kitty Kvantum qt5ct qt6ct rofi swappy swaync wallust waybar wlogout; do
    cp -rf /tmp/hyprconf/$dir "$CONFIG_DIR/"
done

cp -rf /tmp/hyprconf/wallpapers/* "$PICTURES_DIR/"

echo "[✓] Hyprland and your full config are installed on Fedora!"
