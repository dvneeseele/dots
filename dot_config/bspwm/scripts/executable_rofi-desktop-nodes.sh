#!/usr/bin/zsh

typeset -A menu

nodes=("${(f)$(xtitle $(bspc query -d 1 -N -n .leaf))}")
id=("${(f)$(bspc query -d 1 -N -n .leaf)}")

for n in $(seq 1 ${#nodes[@]}); do
    menu["${nodes[$n]}"]="${id[$n]}"
done

# pipe keys to rofi
win=$(printf '%s\n' ${(@k)menu} | rofi -dmenu -i -show-icons)
# focus the node based on id
bspc node -f $menu[$win]
