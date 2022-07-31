#!/usr/bin/env zsh
# `cd` into the prezto root directory and call `zsh setup.sh`

setopt EXTENDED_GLOB
# for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  # ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
# done

for rcfile in ./runcoms/^README.md(.N); do
	ln -sf "$(pwd)/$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -sf "$(pwd)" "${ZDOTDIR:-$HOME}/.zprezto"
