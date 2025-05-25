#!/bin/bash

echo "🚗 Pre-Trip Vehicle Inspection - Automated Checklist"

# Function to prompt user for input (Yes/No)
check_component() {
    read -p "✔️ Have you checked $1? (y/n): " response
    [[ "$response" == "y" ]] && echo "✅ $1 is confirmed!" || echo "⚠️ Warning: $1 needs attention!"
}

echo "===================================="
echo "🔧 Engine & Fluids:"
check_component "Engine Oil Level & Condition"
check_component "Coolant/Antifreeze"
check_component "Brake Fluid"
check_component "Transmission Fluid (for automatic vehicles)"
check_component "Power Steering Fluid"
check_component "Windshield Washer Fluid"

echo "===================================="
echo "🛞 Tires:"
check_component "Tire Pressure (incl. spare)"
check_component "Tire Tread Depth"
check_component "Visible Tire Damage"
check_component "Spare Tire Readiness"

echo "===================================="
echo "🛑 Brakes:"
check_component "Brake Pad Thickness"
check_component "Brake Functionality"
check_component "ABS & Brake Warning Lights"

echo "===================================="
echo "🔋 Battery:"
check_component "Battery Voltage/Charge"
check_component "Corrosion on Terminals"
check_component "Age of Battery"

echo "===================================="
echo "💡 Lights & Electrical:"
check_component "Headlights (Low/High Beam)"
check_component "Turn Signals & Brake Lights"
check_component "Reverse & Fog Lights"
check_component "Interior Lights, Horn, Wipers"

echo "===================================="
echo "🧳 Load & Cargo Readiness:"
check_component "Secure Heavy Luggage"
check_component "Check Load Limits (GVWR)"
check_component "Distribute Weight Evenly"

echo "===================================="
echo "🌍 Navigation & Emergency Equipment:"
check_component "GPS/Phone Charging Setup"
check_component "First Aid Kit"
check_component "Fire Extinguisher"
check_component "Flashlight & Batteries"
check_component "Reflective Triangles or Flares"
check_component "Tool Kit"

echo "===================================="

# Final Decision
echo "🚦 Evaluating your pre-trip readiness..."
sleep 2
echo "🚗 **Final Recommendation:**"
echo "✅ If all components are checked ✅ - You're good to go!"
echo "⚠️ If some items are missing, make sure to fix them before departing! Safety first."
