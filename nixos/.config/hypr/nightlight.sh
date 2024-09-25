#!/usr/bin/env bash

# is gammastep running :
test="$(ps aux | grep "gammastep" | grep -v "grep")"
if [ -z "$test" ]; then
  # if not then turn it on 
  gammastep -O 3750
else
  # if it is then kill it
  killall gammastep 
fi
