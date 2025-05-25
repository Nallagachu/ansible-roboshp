#!/bin/bash

# Define thresholds
MAX_RPM=7000
MIN_OIL_VISCOSITY=30
MAX_ENGINE_TEMP=120
MIN_BRAKE_PAD=20
MIN_TIRE_PRESSURE=30

# Simulate retrieving vehicle data (Replace with actual sensor data)
engine_rpm=$(( RANDOM % 8000 ))
oil_viscosity=$(( RANDOM % 50 + 20 ))
engine_temp=$(( RANDOM % 150 + 50 ))
brake_pad=$(( RANDOM % 100 ))
tire_pressure=$(( RANDOM % 40 + 20 ))
oil_pressure=$(( RANDOM % 20 + 35 ))
battery_voltage_idle=$(echo "scale=1; 12.5 + $(( RANDOM % 4 )) * 0.1" | bc)
battery_voltage_load=$(echo "scale=1; 13.5 + $(( RANDOM % 4 )) * 0.1" | bc)

# Generate timestamp for report
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Log file location
REPORT_FILE="/tmp/pre_trip_report.log"

# Function to log diagnostics
log_status() {
    echo "[$DATE] $1" >> "$REPORT_FILE"
}

# Start report
echo "🚘 **AutoVitals – Pre-Trip Vehicle Health Report**" > "$REPORT_FILE"
log_status "🕒 Generated on $DATE"

# Engine System
log_status "🔧 **ENGINE SYSTEM**"
log_status "📊 Oil Pressure: $oil_pressure PSI (Normal Range: 35–55 PSI)"
log_status "📊 Oil Viscosity: $oil_viscosity (Min Recommended: $MIN_OIL_VISCOSITY)"
log_status "📊 Coolant Temperature: $engine_temp°C"
log_status "📊 RPM Idle Range: $engine_rpm"
log_status "📊 Engine Condition: $( [[ $engine_temp -gt $MAX_ENGINE_TEMP || $engine_rpm -gt $MAX_RPM ]] && echo '⚠️ High Stress! Consider maintenance' || echo '✅ Normal' )"

# Tire System
log_status "🛞 **TIRE SYSTEM**"
log_status "📊 Tire Pressure: $tire_pressure PSI (Min Safe Limit: $MIN_TIRE_PRESSURE)"
log_status "📊 Tread Depth: $(($RANDOM % 8 + 2)) mm"
log_status "📊 Temperature: $(($RANDOM % 10 + 30))°C"

# Brake System
log_status "🛑 **BRAKE SYSTEM**"
log_status "📊 Front Pad Wear: $brake_pad% remaining"
log_status "📊 Rear Pad Wear: $(($brake_pad - 10))% remaining"
log_status "📊 Brake Fluid Level: ✅ Full"
log_status "📊 ABS System Check: ✅ Passed"

# Battery & Electrical
log_status "🔋 **BATTERY & ELECTRICAL**"
log_status "📊 Voltage at Idle: $battery_voltage_idle V"
log_status "📊 Voltage Under Load: $battery_voltage_load V"
log_status "📊 Alternator Status: ✅ Stable"

# Navigation & Safety
log_status "🌍 **NAVIGATION & SENSOR STATUS**"
log_status "📊 GPS Lock: ✅ Active"
log_status "📊 TPMS Sensors: ✅ Functional"
log_status "📊 External Temp Sensor: $(($RANDOM % 15 + 20))°C"

# Final Decision
log_status "------------------------------------"
if [[ $brake_pad -lt 40 || $tire_pressure -lt 40 || $engine_temp -gt $MAX_ENGINE_TEMP ]]; then
    log_status "⚠️ 🚨 Maintenance recommended before your trip!"
else
    log_status "✅ Vehicle condition looks good! Ride safe. 🏁"
fi

# Display report on screen
cat "$REPORT_FILE"
