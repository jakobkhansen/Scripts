#! /bin/bash


num=$(i3-msg -t get_workspaces | jq '.[-1] | .num')

num=$(($num+1))

i3-msg workspace $num
