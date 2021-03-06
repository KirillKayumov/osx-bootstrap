#!/usr/bin/env bash

osx_bootstrap="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$osx_bootstrap/modules/functions.bash"

info_echo "Enable rbenv alias"
eval "$(rbenv init -)"

info_echo "Set default gems list"
echo "bundler" >> "$(brew --prefix rbenv)/default-gems"
echo "tmuxinator" >> "$(brew --prefix rbenv)/default-gems"

if test -z "$(rbenv versions --bare|grep "2.2.4")"; then
  info_echo "Install Ruby 2.2.4"
  rbenv install 2.2.4
fi

info_echo "Set Ruby 2.2.4 as global default Ruby"
rbenv global 2.2.4
rbenv shell 2.2.4

info_echo "Update to latest Rubygems version"
gem update --system --no-document

info_echo "Installing Bundler to install project-specific Ruby gems"
gem install bundler --no-document
