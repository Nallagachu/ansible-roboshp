#!/bin/bash

# Define threshold values for alerts
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

# Log file location
LOG_FILE="/tmp/vehicle_health.log"

# Function to log data
log_status() {
    echo "[$(date)] $1" >> "$LOG_FILE"
}

# Start diagnostics
echo "🚗 Running AutoVitals Vehicle Diagnostics..." > "$LOG_FILE"
log_status "🚗 Running AutoVitals Vehicle Diagnostics..."

# Check vehicle health
[[ $engine_rpm -gt $MAX_RPM ]] && log_status "⚠️ High RPM ($engine_rpm). Consider reducing stress on the engine."
[[ $oil_viscosity -lt $MIN_OIL_VISCOSITY ]] && log_status "⚠️ Oil viscosity too low ($oil_viscosity). Potential wear risk."
[[ $engine_temp -gt $MAX_ENGINE_TEMP ]] && log_status "⚠️ Engine overheating ($engine_temp°C). Check cooling system."
[[ $brake_pad -lt $MIN_BRAKE_PAD ]] && log_status "⚠️ Brake pads too thin ($brake_pad%). Consider replacement."
[[ $tire_pressure -lt $MIN_TIRE_PRESSURE ]] && log_status "⚠️ Tire pressure low ($tire_pressure PSI). Check for leaks."

log_status "✅ Vehicle diagnostics complete."

# Display log file contents
cat "$LOG_FILE"
