#!/bin/bash

# Define functions
function left() {
    ./left.sh
}

function right() {
    ./right.sh
}

function forward() {
    ./forward.sh
}

# Input numbers from command line arguments
input_numbers=("$@")

# Define sequence and associated numbers
commands=(
    "left 1"
    "right 2"
    "forward"
    "left 3"
    "right 4"
    "forward"
    "left 5"
    "right 6"
    "forward"
)

# Process commands
for cmd in "${commands[@]}"; do
    if [[ "$cmd" =~ " " ]]; then
        # Extract the action and the associated number
        action=${cmd%% *}   # Everything before the space
        number=${cmd##* }   # Everything after the space

        # Check if the number is in the input array
        if [[ " ${input_numbers[*]} " =~ " ${number} " ]]; then
            $action  # Call the function by its name
        fi
    else
        # It's just a 'forward' command, so call it directly
        $cmd
    fi
done
