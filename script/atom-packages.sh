#!/usr/bin/env bash
set -e
set -u

packages=(

editorconfig
fileicons
git-plus

language-applescript
language-ejs
language-iced-coffee-script
language-jade
language-pgsql

linter
minimap
minimap-find-and-replace
minimap-highlight-selected
minimap-selection
pain-split

)

for package in "${packages[@]}"; do
   apm install "$package"
done
