#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

left_side="DisplayPort-0"
middle="DisplayPort-2"
right_side="DisplayPort-1"

mode="1920x1080"
rate="50"



function fix_monitors(){
    xrandr --output ${middle} --mode ${mode} --rate 60 --primary --auto
    xrandr --output ${right_side} --mode ${mode} --rate 60 --right-of ${middle} --auto
    set_left_active
}

function is_left_side_active(){
   
    if [ "${active/ /}" == "" ];
    then
        echo "true"
    else
        echo "false"
    fi
}

function set_left_active(){
    xrandr --output ${left_side} --mode ${mode} --rate 50 --left-of ${middle} --auto
}

function set_left_inactive(){
    xrandr --output ${left_side} --off
}

function switch_left(){
    active="$(xrandr --listactivemonitors | grep ${left_side})"
    echo "active: ${active}"

    if [ "${active/ /}" == "" ];
    then
        set_left_active
    else 
        set_left_inactive
    fi
}
