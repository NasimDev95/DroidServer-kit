#!/bin/bash

# Colors for output
GREEN='\033[1;32m'
RED='\033[1;31m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to start services
start_servers() {
    echo -e "${BLUE}[*] Starting DroidServer-Kit Services...${NC}"
    
    # Start Apache
    apachectl start 2>/dev/null
    echo -e "${GREEN}[✔] Apache Server Started (Port: 8080)${NC}"

    # Start MariaDB in background
    nohup mysqld_safe > /dev/null 2>&1 &
    echo -e "${GREEN}[✔] MariaDB (Database) Started (Port: 3306)${NC}"

    # Start VS Code Server in background
    nohup code-server > /dev/null 2>&1 &
    echo -e "${GREEN}[✔] VS Code Server Started (Port: 8080 or 8000)${NC}"
    
    echo -e "${YELLOW}All services are running in the background!${NC}"
}

# Function to stop services
stop_servers() {
    echo -e "${BLUE}[*] Stopping DroidServer-Kit Services...${NC}"
    
    apachectl stop 2>/dev/null
    pkill mysqld 2>/dev/null
    pkill node 2>/dev/null # VS Code server node par chalta hai
    
    echo -e "${RED}[✔] All Services Stopped!${NC}"
}

# Function to check status
check_status() {
    echo -e "${BLUE}[*] DroidServer-Kit Status:${NC}"
    
    if pgrep -x "httpd" > /dev/null; then echo -e "Apache: ${GREEN}Running${NC}"; else echo -e "Apache: ${RED}Stopped${NC}"; fi
    if pgrep -x "mysqld" > /dev/null; then echo -e "MariaDB: ${GREEN}Running${NC}"; else echo -e "MariaDB: ${RED}Stopped${NC}"; fi
    if pgrep -f "code-server" > /dev/null; then echo -e "VS Code: ${GREEN}Running${NC}"; else echo -e "VS Code: ${RED}Stopped${NC}"; fi
}

# Command Logic
case "$1" in
    start)
        start_servers
        ;;
    stop)
        stop_servers
        ;;
    restart)
        stop_servers
        sleep 2
        start_servers
        ;;
    status)
        check_status
        ;;
    *)
        echo -e "${YELLOW}Usage: droidserver {start|stop|restart|status}${NC}"
        echo -e "  start   - Start Apache, MySQL, and VS Code"
        echo -e "  stop    - Stop all services"
        echo -e "  restart - Restart all services"
        echo -e "  status  - Check what is running"
        ;;
esac
