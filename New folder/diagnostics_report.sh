#!/bin/bash

# Define threshold values for alerts
MAX_RPM=7000
MIN_OIL_VISCOSITY=30
MAX_ENGINE_TEMP=120
MIN_BRAKE_PAD=20
MIN_TIRE_PRESSURE=30

# Get user input
echo "🚗 Enter your trip distance (in km):"
read -r trip_distance

echo "🚗 Select road type: (1) Highway (2) City (3) Off-road"
read -r road_type

# Simulate retrieving vehicle data (Replace with actual sensor data)
engine_rpm=$(( RANDOM % 8000 ))
oil_viscosity=$(( RANDOM % 50 + 20 ))
engine_temp=$(( RANDOM % 150 + 50 ))
brake_pad=$(( RANDOM % 100 ))
tire_pressure=$(( RANDOM % 40 + 20 ))

# Function to display vehicle condition based on input
vehicle_health_check() {
    echo "🚗 Vehicle Diagnostics Report:"
    echo "-----------------------------------"

    [[ $engine_rpm -gt $MAX_RPM ]] && echo "⚠️ High RPM detected ($engine_rpm). Consider reducing stress on the engine."
    [[ $oil_viscosity -lt $MIN_OIL_VISCOSITY ]] && echo "⚠️ Low oil viscosity ($oil_viscosity). Risk of wear."
    [[ $engine_temp -gt $MAX_ENGINE_TEMP ]] && echo "⚠️ Engine overheating ($engine_temp°C). Check cooling system."
    [[ $brake_pad -lt $MIN_BRAKE_PAD ]] && echo "⚠️ Brake pads are worn out ($brake_pad%). Consider replacement."
    [[ $tire_pressure -lt $MIN_TIRE_PRESSURE ]] && echo "⚠️ Low tire pressure ($tire_pressure PSI). Check for leaks."

    # Additional insights based on trip and road type
    echo "-----------------------------------"
    if [[ $road_type -eq 1 ]]; then
        echo "🚙 Highway trip: Ensure proper tire pressure and brake efficiency for high speeds."
    elif [[ $road_type -eq 2 ]]; then
        echo "🚗 City driving: Watch engine temperature, stop-and-go traffic affects cooling."
    elif [[ $road_type -eq 3 ]]; then
        echo "🏔️ Off-road trip: Check tire pressure and suspension components for uneven terrain."
    fi

    echo "✅ Vehicle health check complete!"
}

# Run health check
vehicle_health_check
