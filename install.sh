#!/bin/bash

# =========================================================
#  Shakib Playz - Blueprint + Addons Auto Installer
#  Made By Shakib Playz
# =========================================================

set -e

# ---------- Colors ----------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# ---------- Config ----------
export PTERODACTYL_DIRECTORY=/var/www/pterodactyl

# Addon repository
REPO_RAW="https://raw.githubusercontent.com/shakibplayz/blueprint-install/main/"

# ---------- Addons ----------
# Main addon list
ADDONS=(
    "huxregister"
    "loader"
    "mcplugins"
    "mctools"
    "minecraftpluginmanager"
    "serverbackgrounds"
    "simplefavicons"
    "startupchanger"
    "subdomains"
    "versionchanger"
)

# Extra themes / addons
EXTRA_ADDONS=(
    "nebula"
    "plugininstaller"
)

# ---------- Banner ----------
print_banner() {
    clear
    echo -e "${CYAN}${BOLD}"
    echo "  ███████╗ ██╗  ██╗  █████╗  ██╗  ██╗ ██╗ ██████╗ "
    echo "  ██╔════╝ ██║  ██║ ██╔══██╗ ██║ ██╔╝ ██║ ██╔══██╗"
    echo "  ███████╗ ███████║ ███████║ █████╔╝  ██║ ██████╔╝"
    echo "  ╚════██║ ██╔══██║ ██╔══██║ ██╔═██╗  ██║ ██╔══██╗"
    echo "  ███████║ ██║  ██║ ██║  ██║ ██║  ██╗ ██║  █████║"
    echo "  ╚══════╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝"
    echo -e "${NC}"

    echo -e "${BOLD}              BLUEPRINT ADDON INSTALLER${NC}"
    echo -e "${YELLOW}                 Made By Shakib Playz${NC}"
    echo ""
    echo -e "${CYAN}  ────────────────────────────────────────────────────────${NC}"
    echo -e "  ${GREEN}Pterodactyl Blueprint Themes & Addons Installer${NC}"
    echo -e "${CYAN}  ────────────────────────────────────────────────────────${NC}"
    echo ""
}

print_banner

# ---------- Confirmation ----------
echo -e "${BOLD}Installation Setup${NC}"
echo ""
echo -e "  This installer will install Blueprint addons,"
echo -e "  themes and plugins on your Pterodactyl panel."
echo ""

read -p "  Continue installation? [y/N]: " choice

case "$choice" in
    y|Y)
        echo ""
        echo -e "${GREEN}[✓] Installation confirmed.${NC}"
        echo -e "${CYAN}[*] Initializing addon installation...${NC}"
        echo ""
        ;;
    n|N|"")
        echo ""
        echo -e "${YELLOW}[!] Installation cancelled.${NC}"
        echo -e "${CYAN}[*] Exiting installer safely...${NC}"
        exit 0
        ;;
    *)
        echo ""
        echo -e "${RED}[✗] Invalid option.${NC}"
        echo -e "${YELLOW}Please run the installer again.${NC}"
        exit 1
        ;;
esac

# ---------- Checks ----------

if [ ! -d "$PTERODACTYL_DIRECTORY" ]; then
    echo -e "${RED}[✗] Pterodactyl directory not found:${NC}"
    echo -e "${YELLOW}$PTERODACTYL_DIRECTORY${NC}"
    exit 1
fi

if ! command -v blueprint >/dev/null 2>&1; then
    echo -e "${RED}[✗] Blueprint CLI not found.${NC}"
    echo -e "${YELLOW}Please install Blueprint Framework first.${NC}"
    exit 1
fi

cd "$PTERODACTYL_DIRECTORY"

# ---------- Main Addons ----------

echo ""
echo -e "${CYAN}============================================================${NC}"
echo -e "${BOLD}                    MAIN ADDONS${NC}"
echo -e "${CYAN}============================================================${NC}"
echo ""

TOTAL=${#ADDONS[@]}
COUNT=0

for ADDON in "${ADDONS[@]}"; do

    COUNT=$((COUNT+1))

    echo -e "${CYAN}[$COUNT/$TOTAL]${NC} Downloading ${BOLD}${ADDON}${NC}..."

    if wget -q \
        "$REPO_RAW/${ADDON}.blueprint" \
        -O "$PTERODACTYL_DIRECTORY/${ADDON}.blueprint"; then

        echo -e "${CYAN}[$COUNT/$TOTAL]${NC} Installing ${ADDON}..."

        if blueprint -install "$ADDON"; then
            echo -e "${GREEN}[✓] ${ADDON} installed successfully.${NC}"
        else
            echo -e "${YELLOW}[!] ${ADDON} installation failed. Continuing...${NC}"
        fi

    else
        echo -e "${YELLOW}[!] ${ADDON}.blueprint not found. Skipping...${NC}"
    fi

    echo ""
done

# ---------- Extra Themes / Plugins ----------

echo ""
echo -e "${CYAN}============================================================${NC}"
echo -e "${BOLD}                THEMES & EXTRA PLUGINS${NC}"
echo -e "${CYAN}============================================================${NC}"
echo ""

EXTRA_TOTAL=${#EXTRA_ADDONS[@]}
EXTRA_COUNT=0

for ADDON in "${EXTRA_ADDONS[@]}"; do

    EXTRA_COUNT=$((EXTRA_COUNT+1))

    echo -e "${CYAN}[$EXTRA_COUNT/$EXTRA_TOTAL]${NC} Downloading ${BOLD}${ADDON}${NC}..."

    if wget -q \
        "$REPO_RAW/${ADDON}.blueprint" \
        -O "$PTERODACTYL_DIRECTORY/${ADDON}.blueprint"; then

        echo -e "${CYAN}[$EXTRA_COUNT/$EXTRA_TOTAL]${NC} Installing ${ADDON}..."

        if blueprint -install "$ADDON"; then
            echo -e "${GREEN}[✓] ${ADDON} installed successfully.${NC}"
        else
            echo -e "${YELLOW}[!] ${ADDON} installation failed. Continuing...${NC}"
        fi

    else
        echo -e "${YELLOW}[!] ${ADDON}.blueprint not found. Skipping...${NC}"
    fi

    echo ""
done

# ---------- Additional Addon Installer ----------

echo ""
echo -e "${CYAN}============================================================${NC}"
echo -e "${BOLD}              ADDON INSTALLER EXTENSION${NC}"
echo -e "${CYAN}============================================================${NC}"
echo ""

echo -e "${CYAN}[*] Starting additional addon installer...${NC}"
echo ""

cd "$PTERODACTYL_DIRECTORY"

if bash <(curl -fsSL \
    https://raw.githubusercontent.com/hopingboyz/blueprint/main/addon-installer.sh); then

    echo ""
    echo -e "${GREEN}[✓] Additional addon installer completed.${NC}"

else

    echo ""
    echo -e "${YELLOW}[!] Additional addon installer returned an error.${NC}"
    echo -e "${YELLOW}[!] Continuing to final stage...${NC}"

fi

# ---------- Final Message ----------

clear

echo -e "${CYAN}${BOLD}"
echo "  ███████╗ ██╗  ██╗  █████╗  ██╗  ██╗ ██╗ ██████╗ "
echo "  ██╔════╝ ██║  ██║ ██╔══██╗ ██║ ██╔╝ ██║ ██╔══██╗"
echo "  ███████╗ ███████║ ███████║ █████╔╝  ██║ ██████╔╝"
echo "  ╚════██║ ██╔══██║ ██╔══██║ ██╔═██╗  ██║ ██╔══██╗"
echo "  ███████║ ██║  ██║ ██║  ██║ ██║  ██╗ ██║ ██║  ██║"
echo "  ╚══════╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝"
echo -e "${NC}"

echo -e "${BOLD}          BLUEPRINT INSTALLATION COMPLETE${NC}"
echo -e "${YELLOW}                 Made By Shakib Playz${NC}"
echo ""

echo -e "${GREEN}${BOLD}[✓] Installation Completed Successfully${NC}"
echo ""

echo -e "${CYAN}Blueprint Framework has been installed.${NC}"
echo -e "${CYAN}Themes, addons and plugin installers have been processed.${NC}"
echo -e "${CYAN}Your Pterodactyl environment is ready.${NC}"
echo ""

echo -e "${YELLOW}Thank you for using Shakib Playz.${NC}"
echo ""

echo -e "${CYAN}============================================================${NC}"
echo ""
