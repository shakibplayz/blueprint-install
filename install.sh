#!/bin/bash

# =========================================================
#  Blueprint Auto Installer
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

# ---------- Banner ----------
print_banner() {
    clear
    echo -e "${CYAN}${BOLD}"
    echo "  ███████╗██╗  ██╗ █████╗ ██╗  ██╗██╗██████╗ "
    echo "  ██╔════╝██║  ██║██╔══██╗██║ ██╔╝██║██╔══██╗"
    echo "  ███████╗███████║███████║█████╔╝ ██║██████╔╝"
    echo "  ╚════██║██╔══██║██╔══██║██╔═██╗ ██║██╔═══╝ "
    echo "  ███████║██║  ██║██║  ██║██║  ██╗██║██║     "
    echo "  ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     "
    echo -e "${NC}"
    echo -e "${BOLD}              BLUEPRINT AUTO INSTALLER${NC}"
    echo -e "${YELLOW}                 Made By Shakib Playz${NC}"
    echo ""
    echo -e "${CYAN}  ────────────────────────────────────────────────────────${NC}"
    echo -e "  ${GREEN}Pterodactyl Blueprint Installation Utility${NC}"
    echo -e "${CYAN}  ────────────────────────────────────────────────────────${NC}"
    echo ""
}

print_banner

# ---------- Confirmation Prompt ----------
echo -e "${BOLD}Installation Setup${NC}"
echo ""
echo -e "  This installer will install and configure"
echo -e "  Blueprint on your Pterodactyl panel."
echo ""

read -p "  Continue installation? [y/N]: " choice

case "$choice" in
    y|Y )
        echo ""
        echo -e "${GREEN}[✓] Installation confirmed.${NC}"
        echo -e "${CYAN}[*] Initializing setup...${NC}"
        echo ""
        ;;
    n|N|"")
        echo ""
        echo -e "${YELLOW}[!] Installation cancelled.${NC}"
        echo -e "${CYAN}[*] Exiting installer safely...${NC}"
        exit 0
        ;;
    * )
        echo ""
        echo -e "${RED}[✗] Invalid option.${NC}"
        echo -e "${YELLOW}Please run the installer again.${NC}"
        exit 1
        ;;
esac

# ---------- Step 1: Blueprint Framework Setup ----------

export PTERODACTYL_DIRECTORY=/var/www/pterodactyl

echo -e "${CYAN}[01/13]${NC} Installing required packages..."
sudo apt install -y curl wget unzip

echo -e "${CYAN}[02/13]${NC} Moving to Pterodactyl directory..."
cd "$PTERODACTYL_DIRECTORY"

echo -e "${CYAN}[03/13]${NC} Downloading Blueprint release..."
wget "https://github.com/BlueprintFramework/framework/releases/latest/download/release.zip" -O "$PTERODACTYL_DIRECTORY/release.zip"
unzip -o release.zip

echo -e "${CYAN}[04/13]${NC} Installing dependencies..."
sudo apt install -y ca-certificates curl git gnupg unzip wget zip

echo -e "${CYAN}[05/13]${NC} Setting up NodeJS repository..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

echo -e "${CYAN}[06/13]${NC} Updating & installing NodeJS..."
sudo apt update
sudo apt install -y nodejs

echo -e "${CYAN}[07/13]${NC} Returning to Pterodactyl directory..."
cd "$PTERODACTYL_DIRECTORY"

echo -e "${CYAN}[08/13]${NC} Installing Yarn..."
sudo npm i -g yarn

echo -e "${CYAN}[09/13]${NC} Installing Blueprint dependencies..."
yarn install

echo -e "${CYAN}[10/13]${NC} Creating Blueprint configuration..."
touch "$PTERODACTYL_DIRECTORY/.blueprintrc"

echo -e "${CYAN}[11/13]${NC} Applying Blueprint configuration..."
echo 'WEBUSER="www-data";
OWNERSHIP="www-data:www-data";
USERSHELL="/bin/bash";' > "$PTERODACTYL_DIRECTORY/.blueprintrc"

echo -e "${CYAN}[12/13]${NC} Preparing Blueprint installer..."
chmod +x "$PTERODACTYL_DIRECTORY/blueprint.sh"

echo -e "${CYAN}[13/13]${NC} Running Blueprint installer..."
bash "$PTERODACTYL_DIRECTORY/blueprint.sh"

# ---------- Step 2: Addon Installer ----------

echo ""
echo -e "${CYAN}============================================================${NC}"
echo -e "${BOLD}                    ADDON INSTALLATION${NC}"
echo -e "${CYAN}============================================================${NC}"
echo ""
echo -e "${CYAN}[*] Starting addon installer...${NC}"

cd "$PTERODACTYL_DIRECTORY"
bash <(curl -fsSL https://raw.githubusercontent.com/hopingboyz/blueprint/main/addon-installer.sh)

# ---------- Final Message ----------

clear
echo -e "${CYAN}${BOLD}"
echo "  ███████╗██╗  ██╗ █████╗ ██╗  ██╗██╗██████╗ "
echo "  ██╔════╝██║  ██║██╔══██╗██║ ██╔╝██║██╔══██╗"
echo "  ███████╗███████║███████║█████╔╝ ██║██████╔╝"
echo "  ╚════██║██╔══██║██╔══██║██╔═██╗ ██║██╔═══╝ "
echo "  ███████║██║  ██║██║  ██║██║  ██╗██║██║     "
echo "  ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     "
echo -e "${NC}"
echo -e "${BOLD}              BLUEPRINT AUTO INSTALLER${NC}"
echo -e "${YELLOW}                 Made By Shakib Playz${NC}"
echo ""
echo -e "${GREEN}${BOLD}[✓] Installation Completed Successfully${NC}"
echo ""
echo -e "${CYAN}Blueprint has been installed and configured.${NC}"
echo -e "${CYAN}Your Pterodactyl environment is ready.${NC}"
echo ""
echo -e "${YELLOW}Thank you for using Shakib Playz.${NC}"
echo ""
echo -e "${CYAN}============================================================${NC}"
echo ""
