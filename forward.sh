#!/bin/bash

ros2 topic pub /cmd_vel_tracker geometry_msgs/msg/Twist '{linear: {x: 0.6, y: 0, z: 0}, angular: {x: 0, y: 0, z: 0}}' -1

ros2 topic pub /cmd_vel_tracker geometry_msgs/msg/Twist '{linear: {x: 0.6, y: 0, z: 0}, angular: {x: 0, y: 0, z: 0}}' -1

ros2 topic pub /cmd_vel_tracker geometry_msgs/msg/Twist '{linear: {x: 0.6, y: 0, z: 0}, angular: {x: 0, y: 0, z: 0}}' -1
