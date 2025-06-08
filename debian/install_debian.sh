#!/usr/bin/env bash
set -e

echo "📦 Installing dependencies for Debian/Ubuntu..."

# Update and install common packages
sudo apt update
sudo apt install -y \
  build-essential \
  git curl wget unzip meson ninja-build cmake \
  libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev \
  libpixman-1-dev libwayland-dev libinput-dev libxkbcommon-dev libxkbcommon-x11-dev \
  libglib2.0-dev libpng-dev libavutil-dev libavcodec-dev libavformat-dev \
  libpam0g-dev libsystemd-dev wayland-protocols libinih-dev \
  libudev-dev libseat-dev libdrm-dev libxcb-composite0-dev \
  libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev \
  libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
  qt5ct qt6ct rofi kitty cava btop swaync wlogout waybar

# 🌀 FASTFETCH (install from GitHub)
echo "⬇️ Installing fastfetch..."
git clone https://github.com/fastfetch-cli/fastfetch.git /tmp/fastfetch
cd /tmp/fastfetch
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j$(nproc)
sudo cp build/fastfetch /usr/local/bin/
cd ~
rm -rf /tmp/fastfetch

# 🌀 SWAPPY (build from source)
echo "⬇️ Installing swappy..."
git clone https://github.com/jtheoof/swappy.git /tmp/swappy
cd /tmp/swappy
meson setup build
ninja -C build
sudo ninja -C build install
cd ~
rm -rf /tmp/swappy

# 🌀 HYPRLAND (build from source)
echo "⬇️ Installing Hyprland..."
git clone --recursive https://github.com/hyprwm/Hyprland.git /tmp/Hyprland
cd /tmp/Hyprland
meson setup build
ninja -C build
sudo ninja -C build install
cd ~
rm -rf /tmp/Hyprland

# 🌀 KVANTUM (build from source)
echo "⬇️ Installing Kvantum..."
git clone https://github.com/tsujan/Kvantum.git /tmp/Kvantum
cd /tmp/Kvantum
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
cd ~
rm -rf /tmp/Kvantum

# 🎯 Clone configuration files
echo "📁 Cloning your config from GitHub..."
git clone https://github.com/2d-jack/.conf.git /tmp/.conf

# Define user home path
USER_HOME="$HOME"

# Copy configs
echo "📂 Copying config files to $USER_HOME/.config..."
mkdir -p "$USER_HOME/.config"
cp -r /tmp/.conf/.config/* "$USER_HOME/.config/"

# Copy wallpapers to Pictures
mkdir -p "$USER_HOME/Pictures"
cp -r /tmp/.conf/wallpapers "$USER_HOME/Pictures/"

# Cleanup
rm -rf /tmp/.conf

echo "✅ All components installed and configured for Debian/Ubuntu."

