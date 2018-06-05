#!/usr/bin/env bash

apps_root=$HOME/Applications
src_root=$HOME/src
mkdir $apps_root $src_root

# Install xcode command line tools (we need git)
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" --verbose;

curl -Lo /tmp/iterm2.zip https://iterm2.com/downloads/stable/latest
unzip -q /tmp/$3 -d $apps_root/
