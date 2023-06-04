#!/usr/bin/env bash
set -eux

sudo python3 -m pip install virtualenv virtualenvwrapper

config_file=$HOME/dotfiles/prezto/general/local.zsh
echo 'export WORKON_HOME=$HOME/.virtualenvs' >> "$config_file"
echo 'export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3' >> "$config_file"
echo 'source /usr/local/bin/virtualenvwrapper.sh' >> "$config_file"

zsh ~/.zshrc
