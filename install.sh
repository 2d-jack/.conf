#!/usr/bin/env bash
set -e

# Make sure the script is not run as root
if [ "$EUID" -eq 0 ]; then
    echo "❌ Please do NOT run this script as root or with sudo."
    echo "   Run it as a normal user (e.g., ./install.sh)"
    exit 1
fi

# Detect the distribution
DISTRO=""
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo "❌ Cannot detect Linux distribution."
    exit 1
fi

echo "👉 Detected distro: $DISTRO"

case "$DISTRO" in
    arch|manjaro|endeavouros)
        bash ./install_arch.sh
        ;;
    debian|ubuntu|linuxmint|kali)
        bash ./install_debian.sh
        ;;
    fedora)
        bash ./install_fedora.sh
        ;;
    opensuse*|suse)
        bash ./install_opensuse.sh
        ;;
    *)
        echo "❌ Unsupported distribution: $DISTRO"
        exit 1
        ;;
esac

echo ""
echo "✅ Installation complete!"
echo "🔁 Your system will reboot in 10 seconds to apply changes..."
echo "    Press Ctrl+C to cancel reboot if needed."

sleep 10
reboot
