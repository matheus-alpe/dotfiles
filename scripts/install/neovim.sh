#!/usr/bin/env bash

sudo add-apt-repository universe
sudo apt install libfuse2
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

chmod u+x $DIR/nvim.appimage

sudo mv $DIR/nvim.appimage /usr/local/bin/nvim