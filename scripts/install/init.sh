#!/usr/bin/env bash

SCRIPTS=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

$SCRIPTS/git.sh
$SCRIPTS/zsh.sh
$SCRIPTS/tools.sh
$SCRIPTS/nvm.sh
$SCRIPTS/tmux.sh
$SCRIPTS/kitty.sh
