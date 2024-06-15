#!/bin/bash

# Function to execute a command multiple times based on letter input
function execute_multiple_times() {
    local command_script=$1
    local times=$2
    for ((i=0; i<times; i++)); do
        ./$command_script
    done
}

# Mapping letters to the number of times a command should be executed
declare -A letter_to_number=( ["a"]=1 ["b"]=2 ["c"]=3 ["d"]=4 ["e"]=5 ["f"]=6 )

# Input numbers and letters from command line arguments
input_numbers=()
input_letters=()

# Separate numbers and letters into different arrays
for arg in "$@"; do
    if [[ "$arg" =~ [a-f] ]]; then
        input_letters+=("$arg")
    else
        input_numbers+=("$arg")
    fi
done

# Finally, process commands for letters
for letter in "${input_letters[@]}"; do
    if [[ -n "${letter_to_number[$letter]}" ]]; then
        execute_multiple_times "forward1.sh" "${letter_to_number[$letter]}"
    fi
done

./right1.sh