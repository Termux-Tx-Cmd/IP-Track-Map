#!/bin/bash

# Auto open Facebook Page
xdg-open "https://www.facebook.com/share/16JmHprSe1/" > /dev/null 2>&1

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Banner
clear
echo -e "${CYAN}"
echo "████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗"
echo "╚══██╔══╝██╔════╝██╔══██╗████╗ ████║╚██╗ ██╔╝╚██╗██╔╝"
echo "   ██║   █████╗  ██████╔╝██╔████╔██║ ╚████╔╝  ╚███╔╝ "
echo "   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║  ╚██╔╝   ██╔██╗ "
echo "   ██║   ███████╗██║  ██║██║ ╚═╝ ██║   ██║   ██╔╝ ██╗"
echo "   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝   ╚═╝  ╚═╝"
echo -e "${YELLOW}        ------[ Termux Tx Cmd ]------"
echo -e "${GREEN}         ------[ Developer: Mahim ]------"
echo -e "${NC}"

# Input Target IP
echo -ne "${BLUE}Enter target IP address: ${NC}"
read ip

# API Call
echo -e "\n${GREEN}[+] Tracking IP: $ip...${NC}\n"
sleep 1

# Fetch IP Information
response=$(curl -s "http://ip-api.com/json/$ip")

# Parse and Display Info
status=$(echo $response | jq -r '.status')
if [ "$status" != "success" ]; then
  echo -e "${RED}[-] Invalid IP or failed to fetch data.${NC}"
  exit 1
fi

echo -e "${YELLOW}IP Info:${NC}"
echo -e "${GREEN}IP         :${NC} $(echo $response | jq -r '.query')"
echo -e "${GREEN}Country    :${NC} $(echo $response | jq -r '.country')"
echo -e "${GREEN}Region     :${NC} $(echo $response | jq -r '.regionName')"
echo -e "${GREEN}City       :${NC} $(echo $response | jq -r '.city')"
echo -e "${GREEN}ISP        :${NC} $(echo $response | jq -r '.isp')"
echo -e "${GREEN}Timezone   :${NC} $(echo $response | jq -r '.timezone')"
echo -e "${GREEN}Latitude   :${NC} $(echo $response | jq -r '.lat')"
echo -e "${GREEN}Longitude  :${NC} $(echo $response | jq -r '.lon')"

# Google Maps Link
lat=$(echo $response | jq -r '.lat')
lon=$(echo $response | jq -r '.lon')
echo -e "${CYAN}\nMap Location: https://www.google.com/maps/place/$lat,$lon${NC}"
echo -e "\n${GREEN}[✓] Tracking Complete.${NC}"
