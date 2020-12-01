#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${CYAN}
Welcome to Set Charging Limit Script
Created By Ankit Jain ${NC}
"

currLimit=$(</sys/class/power_supply/BAT0/charge_control_end_threshold)
echo "Current charge limit is: $currLimit
"
# echo -e "${RED}Remember to unplug and plug the charger again :)${NC}
# "

echo "Enter the charge limit between 0 - 100: "
read chargeLimit

if [ $currLimit == $chargeLimit ]
then
    echo -e "${RED}Charge Limit is set to $chargeLimit already :)${NC}"

elif [ $currLimit != $chargeLimit ]
then
    echo -e "${YELLOW}
Setting Charge Limit to $chargeLimit...
    ${NC}"
    echo KERNEL==\"BAT0\", SUBSYSTEM==\"power_supply\", ATTR{charge_control_end_threshold}=\"$chargeLimit\" | sudo tee /etc/udev/rules.d/$currLimit-charge-limit.rules
    sudo mv /etc/udev/rules.d/$currLimit-charge-limit.rules $chargeLimit-charge-limit.rules

    echo $chargeLimit | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold

    echo -e "${GREEN}
Done!!!
${NC}   "
fi
