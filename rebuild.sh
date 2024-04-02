#!/usr/bin/env bash

if git diff --quiet; then
  echo "No changes detected, exiting."
  exit 0
fi

git add .
git diff --staged

echo "building NixOS Configuration"
sudo nixos-rebuild switch --flake .# &> nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)
rm nixos-switch.log

current=$(nixos-rebuild list-generations | grep current)
current_num=$(echo $current | awk '{print $1}')

echo "git commit -m \"$current\""

notify-send "NixOS build of Generation $current_num was successful!"
