#!/usr/bin/env bash

set -x

git add .
git diff --staged

echo "building NixOS Configuration"

sudo nixos-rebuild switch --flake .# --log-format internal-json -v |& nom --json

current=$(nixos-rebuild list-generations | grep current)
current_num=$(echo $current | awk '{print $1}')

notify-send "NixOS build of Generation $current_num is finished!"
