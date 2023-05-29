#!/usr/bin/env bash

source "$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )/env.sh"


# xrandr --output ${left_side} --auto --mode ${mode} --left-of ${middle}



xrandr --listmonitors
xrandr --listactivemonitors


# set_left_active