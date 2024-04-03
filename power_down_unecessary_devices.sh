#/bin/bash

# the ethernet device takes up 2 watts even when disconnected
doas ip link set enp5s0 down

# camera takes up about half a watt even when unused
doas rmmod -f uvcvideo
