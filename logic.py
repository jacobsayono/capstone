def left():
    print("left")

def right():
    print("right")

def forward():
    print("forward")

# Define the input numbers here
input_numbers = [5, 2]

def generate_output(input_numbers):
    # Define the sequence of commands and the numbers they correspond to
    commands = [
        (left, 1),
        (right, 2),
        forward,
        (left, 3),
        (right, 4),
        forward,
        (left, 5),
        (right, 6),
        forward
    ]

    # Iterate through the command list and execute the appropriate function
    for command in commands:
        if isinstance(command, tuple):  # It's a tuple if it has a number associated with it
            action, number = command
            if number in input_numbers:
                action()
        else:  # It's just a 'forward' command
            command()

# Run the command generation function
generate_output(input_numbers)
