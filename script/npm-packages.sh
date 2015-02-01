#!/usr/bin/env bash
set -e
set -u

packages=(
  bower
  browserify
  chai
  coffee-script
  grunt-cli
  html2jade
  iced-coffee-script
  jade
  js2coffee
  mocha
  node-inspector
  node-static
  nodemon
  sails
  yo
)

for package in "${packages[@]}"; do
   npm install -g "$package"
done
