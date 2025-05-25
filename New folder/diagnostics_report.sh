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

# Generate timestamp for report
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Log file location
REPORT_FILE="/tmp/pre_trip_report.log"

# Function to log diagnostics
log_status() {
    echo "[$DATE] $1" >> "$REPORT_FILE"
}

# Start report
echo "🚗 **Pre-Trip Vehicle Report** - Generated on $DATE" > "$REPORT_FILE"
log_status "🚗 **Pre-Trip Vehicle Report** - Generated on $DATE"

# Check vehicle health & log it
log_status "📊 Engine RPM: $engine_rpm (Max Threshold: $MAX_RPM)"
log_status "📊 Oil Viscosity: $oil_viscosity (Min Recommended: $MIN_OIL_VISCOSITY)"
log_status "📊 Engine Temperature: $engine_temp°C (Max Safe Limit: $MAX_ENGINE_TEMP)"
log_status "📊 Brake Pad Condition: $brake_pad% remaining (Min Safe Limit: $MIN_BRAKE_PAD)"
log_status "📊 Tire Pressure: $tire_pressure PSI (Min Safe Limit: $MIN_TIRE_PRESSURE)"

# Analyze engine condition based on RPM and temperature
if [[ $engine_rpm -gt $MAX_RPM || $engine_temp -gt $MAX_ENGINE_TEMP ]]; then
    log_status "⚠️ Engine Condition: High Stress! RPM and Temperature above safe limits. Consider maintenance."
else
    log_status "✅ Engine Condition: Operating Normally."
fi

# Warning messages based on thresholds
[[ $oil_viscosity -lt $MIN_OIL_VISCOSITY ]] && log_status "⚠️ Oil viscosity too low! Potential wear risk."
[[ $brake_pad -lt $MIN_BRAKE_PAD ]] && log_status "⚠️ Brake pads are worn! Consider replacement."
[[ $tire_pressure -lt $MIN_TIRE_PRESSURE ]] && log_status "⚠️ Low tire pressure detected! Inspect for leaks."

# Final recommendation
echo "------------------------------------" >> "$REPORT_FILE"
if [[ $brake_pad -lt 40 || $tire_pressure -lt 40 || $engine_temp -gt $MAX_ENGINE_TEMP ]]; then
    log_status "⚠️ 🚨 Maintenance recommended before your trip!"
else
    log_status "✅ Vehicle condition looks good! Ride safe. 🏁"
fi

# Display report on screen
cat "$REPORT_FILE"
