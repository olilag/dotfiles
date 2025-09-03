#!/bin/sh

type gopass >/dev/null 2>&1 && exit
sudo pacman -S --needed --noconfirm gopass
gopass clone git@github.com:olilag/passwords.git
