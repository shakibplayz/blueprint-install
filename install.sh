#!/bin/bash

# =========================================================
#  shakibplayz Script - Blueprint Auto Installer
#  Made By shakibplayz
# =========================================================

set -e

# ---------- Colors ----------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# ---------- Banner ----------
print_banner() {
    clear
    echo -e "${CYAN}${BOLD}"
    echo "============================================================"
    echo "                   shakibplayz Script"
    echo "============================================================"
    echo -e "${NC}${YELLOW}                     Made By shakibplayz${NC}"
    echo ""
}

print_banner

# ---------- Confirmation Prompt ----------
read -p "Continue Installing (y/n): " choice
case "$choice" in
    y|Y )
        echo -e "${GREEN}Installation Starting...${NC}"
        ;;
    n|N )
        echo -e "${RED}Installation Cancelled. Exiting Script...${NC}"
        exit 0
        ;;
    * )
        echo -e "${RED}Invalid Option. Exiting Script...${NC}"
        exit 1
        ;;
esac

# ---------- Step 1: Blueprint Framework Setup ----------

export PTERODACTYL_DIRECTORY=/var/www/pterodactyl

echo -e "${CYAN}[1/13] Installing required packages...${NC}"
sudo apt install -y curl wget unzip

echo -e "${CYAN}[2/13] Moving to Pterodactyl directory...${NC}"
cd "$PTERODACTYL_DIRECTORY"

echo -e "${CYAN}[3/13] Downloading Blueprint release...${NC}"
wget "https://github.com/BlueprintFramework/framework/releases/latest/download/release.zip" -O "$PTERODACTYL_DIRECTORY/release.zip"
unzip -o release.zip

echo -e "${CYAN}[4/13] Installing dependencies...${NC}"
sudo apt install -y ca-certificates curl git gnupg unzip wget zip

echo -e "${CYAN}[5/13] Setting up NodeJS repository...${NC}"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

echo -e "${CYAN}[6/13] Updating & Installing NodeJS...${NC}"
sudo apt update
sudo apt install -y nodejs

echo -e "${CYAN}[7/13] Moving to Pterodactyl directory again...${NC}"
cd "$PTERODACTYL_DIRECTORY"

echo -e "${CYAN}[8/13] Installing Yarn globally...${NC}"
sudo npm i -g yarn

echo -e "${CYAN}[9/13] Running yarn install...${NC}"
yarn install

echo -e "${CYAN}[10/13] Creating .blueprintrc file...${NC}"
touch "$PTERODACTYL_DIRECTORY/.blueprintrc"

echo -e "${CYAN}[11/13] Writing Blueprint configuration...${NC}"
echo 'WEBUSER="www-data";
OWNERSHIP="www-data:www-data";
USERSHELL="/bin/bash";' > "$PTERODACTYL_DIRECTORY/.blueprintrc"

echo -e "${CYAN}[12/13] Setting permissions for blueprint.sh...${NC}"
chmod +x "$PTERODACTYL_DIRECTORY/blueprint.sh"

echo -e "${CYAN}[13/13] Running Blueprint installer...${NC}"
bash "$PTERODACTYL_DIRECTORY/blueprint.sh"

# ---------- Step 2: Addon Installer ----------

echo -e "${CYAN}Running Addon Installer...${NC}"
cd "$PTERODACTYL_DIRECTORY"
bash <(curl -fsSL https://raw.githubusercontent.com/hopingboyz/blueprint/main/addon-installer.sh)

# ---------- Final Message ----------
clear
echo -e "${CYAN}${BOLD}"
echo "============================================================"
echo "                   shakibplayz Script"
echo "============================================================"
echo -e "${NC}${YELLOW}                     Made By shakibplayz${NC}"
echo ""
echo -e "${GREEN}Thanks For Using This Script${NC}"
echo ""
