#!/bin/bash

# AutoVitals - Intelligent Vehicle Health Report (Simulated)
# Version: 1.0

# ANSI Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

divider() {
    echo -e "${CYAN}------------------------------------------------------------${NC}"
}

status_icon() {
    case $1 in
        OK) echo -e "${GREEN}✅${NC}";;
        WARN) echo -e "${YELLOW}⚠️${NC}";;
        FAIL) echo -e "${RED}❌${NC}";;
        *) echo "$1";;
    esac
}

section_header() {
    echo
    divider
    echo -e "🔧 ${CYAN}$1${NC}"
    divider
}

kv() {
    local key=$1
    local value=$2
    local status=$3
    printf "%-35s %s %s\n" "$key" "$value" "$(status_icon $status)"
}

# Header
clear
divider
echo -e "🚘 ${CYAN}AutoVitals – Pre-Trip Vehicle Health Summary${NC}"
divider
echo -e "📅 Timestamp: $(date)"
echo -e "📍 Vehicle ID: AXV-2397 | Driver ID: D-034"
divider

# Sections
section_header "ENGINE & POWERTRAIN"
kv "Oil Pressure" "42 PSI" OK
kv "Oil Quality Index" "85%" OK
kv "Coolant Temperature" "88°C" OK
kv "Fuel Level" "72%" OK
kv "Estimated Range" "610 km" OK
kv "Turbo Boost Pressure" "13.8 PSI" OK
kv "DPF Soot Level" "8%" OK

section_header "TIRE SYSTEM"
kv "Front Left" "33 PSI, 7.2mm" OK
kv "Front Right" "32.5 PSI, 7.1mm" OK
kv "Rear Left" "34 PSI, 6.9mm" OK
kv "Rear Right" "32 PSI, 6.1mm" WARN
kv "Tire Load Balance" "93% symmetrical" OK

section_header "BRAKING SYSTEM"
kv "Front Pads" "65% Remaining" OK
kv "Rear Pads" "58% Remaining" OK
kv "Brake Fluid" "Full" OK
kv "Brake Heat" "Even" OK
kv "ABS System" "OK" OK

section_header "ELECTRICAL & BATTERY"
kv "Battery Voltage (Idle)" "12.7V" OK
kv "Charging Voltage (Load)" "13.9V" OK
kv "Battery Health" "92%" OK
kv "Crank Time" "1.2 sec" OK
kv "ECU Errors" "None" OK

section_header "SUSPENSION & STRUCTURE"
kv "Shock Absorbers" "Normal" OK
kv "Suspension Fatigue Index" "14%" OK
kv "Ride Height Deviation" "<1.2%" OK
kv "Vibration Patterns" "Moderate at rear right" WARN

section_header "SAFETY & TELEMATICS"
kv "ADAS & Lane Assist" "Operational" OK
kv "GPS Lock" "±1.5m" OK
kv "Telematics Sync" "Connected" OK
kv "Emergency Response" "Armed" OK

section_header "AI PREDICTIONS & INSIGHTS"
kv "Weather" "Clear, 33°C" OK
kv "Road Condition" "Hot asphalt" WARN
kv "Driving Style" "Aggressive in last 3 trips" WARN
kv "Rear Right Tire Heat" "Slightly above average" WARN
kv "Payload Stress Level" "Medium (2.3 tons)" OK

# Summary
divider
echo -e "✅ ${GREEN}SYSTEM STATUS: TRIP READY${NC}"
echo -e "📌 ${YELLOW}Note:${NC} Uneven wear and rear vibration detected."
echo -e "🔧 ${CYAN}Recommendation:${NC} Please get your wheel alignment and rear suspension components inspected after your trip to ensure safety and extend tire life."
echo -e "🛡️ ${CYAN}AutoVitals AI confirms vehicle is safe to proceed with caution.${NC}"
echo -e "🏁 ${GREEN}You're cleared to ride. Drive safe and enjoy your journey!${NC}"
divider
echo
