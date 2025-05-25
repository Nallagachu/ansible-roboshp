#!/bin/bash

# Define color codes
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
CYAN="\e[36m"
RESET="\e[0m"

# Define thresholds
MAX_RPM=7000
MIN_OIL_VISCOSITY=30
MAX_ENGINE_TEMP=120
MIN_BRAKE_PAD=20
MIN_TIRE_PRESSURE=30

# Simulate retrieving vehicle data
engine_rpm=$(( RANDOM % 8000 ))
oil_viscosity=$(( RANDOM % 50 + 20 ))
engine_temp=$(( RANDOM % 150 + 50 ))
brake_pad=$(( RANDOM % 100 ))
tire_pressure=$(( RANDOM % 40 + 20 ))
oil_pressure=$(( RANDOM % 20 + 35 ))
fuel_level=$(( RANDOM % 30 + 70 ))  # Fuel level in percentage
battery_voltage_idle=$(echo "scale=1; 12.5 + $(( RANDOM % 4 )) * 0.1" | bc)
battery_voltage_load=$(echo "scale=1; 13.5 + $(( RANDOM % 4 )) * 0.1" | bc)
gps_lock_status=$(( RANDOM % 2 ))

# Generate timestamp for report
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Log file location
REPORT_FILE="/tmp/pre_trip_report.log"

# Function to log diagnostics
log_status() {
    echo -e "[$DATE] $1" >> "$REPORT_FILE"
}

# Function to colorize output
colorize_output() {
    local message="$1"
    local condition="$2"

    case "$condition" in
        "good") echo -e "${GREEN}$message${RESET}" ;;
        "warning") echo -e "${YELLOW}$message${RESET}" ;;
        "critical") echo -e "${RED}$message${RESET}" ;;
        "info") echo -e "${CYAN}$message${RESET}" ;;
        *) echo -e "$message" ;;
    esac
}

# Start report
echo -e "${CYAN}🚘 **AutoVitals – Intelligent Pre-Trip Vehicle Health Report**${RESET}" > "$REPORT_FILE"
log_status "🕒 Auto-Generated on $DATE"
log_status "📍 Vehicle ID: AXV-2397 | Driver ID: D-034"

# Engine System
log_status "🔧 **ENGINE & POWERTRAIN SYSTEM**"
log_status "$(colorize_output "📊 Oil Pressure: $oil_pressure PSI (Normal Range: 35–55 PSI)" "info")"
log_status "$(colorize_output "📊 Coolant Temperature: $engine_temp°C" "$( [[ $engine_temp -gt $MAX_ENGINE_TEMP ]] && echo 'critical' || echo 'good' )")"
log_status "$(colorize_output "📊 RPM Idle Range: $engine_rpm" "$( [[ $engine_rpm -gt $MAX_RPM ]] && echo 'critical' || echo 'good' )")"
log_status "$(colorize_output "📊 Fuel Level: $fuel_level% Remaining" "$( [[ $fuel_level -lt 30 ]] && echo 'warning' || echo 'good' )")"

# Tire System
log_status "🛞 **TIRE SYSTEM (TPMS + Thermal Monitoring)**"
log_status "$(colorize_output "📊 Tire Pressure: $tire_pressure PSI" "$( [[ $tire_pressure -lt $MIN_TIRE_PRESSURE ]] && echo 'warning' || echo 'good' )")"

# Brake System
log_status "🛑 **BRAKING SYSTEM**"
log_status "$(colorize_output "📊 Front Pads Remaining: $brake_pad%" "$( [[ $brake_pad -lt $MIN_BRAKE_PAD ]] && echo 'warning' || echo 'good' )")"

# Battery & Electrical
log_status "🔋 **BATTERY & ELECTRICAL SYSTEM**"
log_status "$(colorize_output "📊 Voltage (Idle): $battery_voltage_idle V" "info")"

# Navigation & Safety
log_status "🌍 **NAVIGATION & SENSOR STATUS**"
log_status "$(colorize_output "📊 GPS Lock: $( [[ $gps_lock_status -eq 1 ]] && echo '✅ Active' || echo '⚠️ Not Synced' )" "$( [[ $gps_lock_status -eq 1 ]] && echo 'good' || echo 'warning' )")"

# Final Recommendation
log_status "------------------------------------"
if [[ $brake_pad -lt 40 || $tire_pressure -lt 40 || $engine_temp -gt $MAX_ENGINE_TEMP ]]; then
    log_status "$(colorize_output "⚠️ 🚨 Maintenance recommended before your trip!" "critical")"
else
    log_status "$(colorize_output "✅ Vehicle condition looks good! Ride safe. 🏁" "good")"
fi

# Display report on screen
cat "$REPORT_FILE"
