#!/bin/bash

# Default OTP length
OTP_LENGTH=6

# Define character set for OTP (only numbers)
NUMBERS="0123456789"

# Function to generate a random OTP
generate_otp() {
    local length=$1
    local otp=""
    for _ in $(seq 1 $length); do
        # Pick a random number from NUMBERS
        local index=$(( RANDOM % ${#NUMBERS} ))
        otp="${otp}${NUMBERS:$index:1}"
    done
    echo "$otp"
}

# Allow the user to specify an OTP length (default is 6)
read -p "Enter OTP length (default $OTP_LENGTH): " length
length=${length:-$OTP_LENGTH}

# Generate the OTP
echo "Generated OTP: $(generate_otp $length)"

