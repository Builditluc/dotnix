#!/usr/bin/env bash

git add .
git diff --staged

echo "building NixOS Configuration"
sudo nixos-rebuild switch --flake .# &> nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

current=$(nixos-rebuild list-generations | grep current)
current_num=$(echo $current | awk '{print $1}')

rm nixos-switch.log

git commit -am "$current"
notify-send "NixOS build of Generation $current_num was successful!"
