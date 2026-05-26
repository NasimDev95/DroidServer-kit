#!/bin/bash

# ==========================================
# Colors for Terminal
# ==========================================
GREEN='\033[1;32m'
BLUE='\033[1;34m'
RED='\033[1;31m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# ==========================================
# Installation Functions
# ==========================================

install_core() {
    echo -e "${BLUE}[*] Updating system and setting up storage...${NC}"
    pkg update -y && pkg upgrade -y
    termux-setup-storage
    echo -e "${BLUE}[*] Installing essential tools...${NC}"
    pkg install git nano curl wget tar proot-distro -y
    echo -e "${GREEN}[✔] Core System installed successfully!${NC}"
    sleep 2
}

install_languages() {
    echo -e "${BLUE}[*] Installing Node.js, Python and Package Managers...${NC}"
    pkg install nodejs python -y
    pip install --upgrade pip
    npm install -g yarn nodemon
    echo -e "${GREEN}[✔] Node.js & Python installed successfully!${NC}"
    sleep 2
}

install_xampp() {
    echo -e "${BLUE}[*] Installing XAMPP Stack (Apache, MariaDB, PHP)...${NC}"
    pkg install php apache2 mariadb -y
    echo -e "${GREEN}[✔] Server Stack installed successfully!${NC}"
    sleep 2
}

install_vscode() {
    echo -e "${BLUE}[*] Installing VS Code Server...${NC}"
    pkg install tur-repo -y
    pkg install code-server -y
    echo -e "${GREEN}[✔] VS Code Server installed! Type 'code-server' to start.${NC}"
    sleep 2
}

install_ubuntu() {
    echo -e "${BLUE}[*] Installing Ubuntu CLI...${NC}"
    proot-distro install ubuntu
    echo -e "${GREEN}[✔] Ubuntu installed! Type 'proot-distro login ubuntu' to start.${NC}"
    sleep 2
}

install_manager() {
    echo -e "${BLUE}[*] Setting up 'droidserver' global command...${NC}"
    
    # GitHub se direct server-manager.sh file ko download karke bin folder me save karna
    # Note: Baad me 'TUMHARA_USERNAME' ko apne GitHub username se replace kar dena
    curl -sL https://raw.githubusercontent.com/NasimDev95/DroidServer-Kit/main/server-manager.sh -o $PREFIX/bin/droidserver
    
    # File ko run karne ki permission dena
    chmod +x $PREFIX/bin/droidserver
    
    echo -e "${GREEN}[✔] Global command 'droidserver' activated!${NC}"
    sleep 2
}

install_all() {
    install_core
    install_languages
    install_xampp
    install_vscode
    install_ubuntu
    install_manager
    echo -e "${GREEN}[✔] EVERYTHING INSTALLED SUCCESSFULLY!${NC}"
    echo -e "${CYAN}Installation complete. Exiting DroidServer-Kit automatically...${NC}"
    sleep 2
    exit 0  # <--- Yeh command "Everything" ke baad script ko auto-close kar dega
}

# ==========================================
# Main CLI Menu Loop
# ==========================================

while true; do
    clear
    echo -e "${CYAN}=================================================${NC}"
    echo -e "${GREEN}              DroidServer-Kit               ${NC}"
    echo -e "${BLUE}          Developed By: Nasim Akhtab             ${NC}"
    echo -e "${CYAN}=================================================${NC}"
    echo -e "Please select an option to install:"
    echo -e "  [1] Install Core System (Required First)"
    echo -e "  [2] Install Node.js & Python"
    echo -e "  [3] Install XAMPP Stack (Apache, MariaDB, PHP)"
    echo -e "  [4] Install VS Code Server"
    echo -e "  [5] Install Ubuntu CLI"
    echo -e "  [6] Install EVERYTHING (Auto-Exit after completion)"
    echo -e "  [0] Exit Menu"
    echo -e "${CYAN}=================================================${NC}"
    
    read -p "Enter your choice [0-6]: " choice

    case $choice in
        1) install_core ;;
        2) install_languages ;;
        3) install_xampp ;;
        4) install_vscode ;;
        5) install_ubuntu ;;
        6) install_all ;; 
        0) echo -e "${GREEN}Exiting DroidServer-Kit. Happy Coding!${NC}"; exit 0 ;;
        *) echo -e "${RED}Invalid option! Please try again.${NC}"; sleep 2 ;;
    esac
done
