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

# Set up disguised iTerm2
curl -Lo /tmp/iterm.zip https://iterm2.com/downloads/stable/latest
unzip -q /tmp/iterm.zip -d $apps_root/
git clone https://github.com/ErikBoesen/disguise $src_root/disguse
$src_root/disguise/disguise.sh $apps_root/iTerm.app it

git clone https://github.com/ErikBoesen/setup $src_root/setup
