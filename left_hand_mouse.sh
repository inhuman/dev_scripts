#!/usr/bin/env bash

MouseStr='A4TECH USB Device  '
prefix="id="

if [[ $# -eq 0 ]]; then
    for p in `xinput | grep "${MouseStr}"`
        do
            if [[ $p == id=* ]]; then
                id=${p#"$prefix"}

                echo "device ${id} button map"
                xinput --get-button-map ${id}
                echo
            fi
        done
else
    echo there is args $1 $2

    if [[ $2 == 'left' ]]; then
        echo "set up device $1 for left hand"
        xinput --set-button-map $1 3 2 1
        xinput --get-button-map $1
    fi

    if [[ $2 == 'right' ]]; then
        echo "set up device $1 for right hand"
        xinput --set-button-map $1 1 2 3
        xinput --get-button-map $1
    fi
fi
