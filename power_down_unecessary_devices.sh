#/bin/bash

# the ethernet device takes up 2 watts even when disconnected
sudo ip link set enp5s0 down

# camera takes up about half a watt even when unused
sudo rmmod -f uvcvideo
