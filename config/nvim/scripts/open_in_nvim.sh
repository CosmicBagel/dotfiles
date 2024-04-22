#!/bin/bash
# pass +LINE_NUM FILE to this script, or just FILE

# if nvim already running, open file in it
# otherwise open it in a new terminal instance
if [ -e "/tmp/nvimsocket" ]; then
    nvr --remote $@
    # will only work with plasma 6 and WezTerm
    kdotool search --class "org.wezfurlong.wezterm" windowactivate
else
    wezterm -e nvr -s $@
fi

