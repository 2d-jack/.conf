#this will a cring name like in the frames. kids Stuff

#!/bin/bash

frames=(
"█▓▒░     "
"▒░█▓ M   "
"▓█▒ MJ ░"
"█▒░ MJ~a"
"░▓ MJ@c "
"▓█▒ MJac"
"MJ@cK▒░ "
"MJack ░▓"
"MJack █ "
"MJac░▒█ "
"MJ▓▒░   "
"░▒      "
)

counter_file="/tmp/mjack_frame_counter"

# Init counter
if [ ! -f "$counter_file" ]; then
  echo 0 > "$counter_file"
fi

# Read current frame number
frame_num=$(cat "$counter_file")

# Output the current frame
echo -n "${frames[$frame_num]}"

# Update frame number
next_frame=$(( (frame_num + 1) % ${#frames[@]} ))
echo "$next_frame" > "$counter_file"
