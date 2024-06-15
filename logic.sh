#!/bin/bash

# Change directory and source ROS setup
cd ~/robot_ws
source install/setup.bash
ros2 launch line_follower line_follower.launch.py

# Once terminated, assume we are at the pick-up zone
cd ~/capstone

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

# Process commands for numbers
for cmd in "${commands[@]}"; do
    if [[ "$cmd" =~ " " ]]; then
        action=${cmd%% *}   # Extract the action (before the space)
        number=${cmd##* }   # Extract the number (after the space)
        if [[ " ${input_numbers[*]} " =~ " ${number} " ]]; then
            $action  # Call the function by its name
        fi
    else
        # It's just a 'forward' command, so call it directly
        $cmd
    fi
done

# Relaunch the line follower program after pick-up
cd ~/robot_ws
ros2 launch line_follower line_follower.launch.py

# Finally, process commands for letters
for letter in "${input_letters[@]}"; do
    if [[ -n "${letter_to_number[$letter]}" ]]; then
        execute_multiple_times "forward1.sh" "${letter_to_number[$letter]}"
    fi
done

./right1.sh