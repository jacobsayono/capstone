#!/bin/bash
sudo pigpiod

# initial
pigs s 14 1480
sleep 0.5
pigs s 15 515
sleep 0.5
pigs s 18 500
sleep 0.5

# open
pigs s 15 700
sleep 0.5

# extend
pigs s 14 2500
sleep 2.5
pigs s 14 1480
sleep 0.5

# close
pigs s 15 515
sleep 0.5

# pullback
pigs s 14 500
sleep 2.5
pigs s 14 1480
sleep 0.5

sudo killall pigpiod
# chmod +x script.sh to make this text file executable and run ./script.sh
