#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
YELLOW='\033[1;33m'
NC='\033[0m'


echo -e "Copying ${PURPLE}set-charge-limit.sh${NC} to /usr/bin as ${PURPLE}setchargelimit${NC}"
sudo cp set-charge-limit.sh /usr/bin/setchargelimit

echo -e "Successfully copied ${GREEN}:)${NC}"
echo -e "${YELLOW}Now you can run ${PURPLE}setchargelimit${YELLOW} command from any directory${NC}"