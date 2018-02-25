#!/bin/bash

set -ex

sudo pip install -e .

pushd /tmp
 git clone https://aur.archlinux.org/cower.git 
 pushd cower
  makepkg -fsri --noconfirm --needed --asdeps --skippgpcheck
 popd
 git clone https://aur.archlinux.org/pacaur.git 
 pushd pacaur
  makepkg -fsri --noconfirm --needed --asdeps --skippgpcheck
 popd
popd

export EDITOR=vi
export VISUAL=vi
pacaur -S --noconfirm --noedit isolate-git

pushd deployment/pkg/camisole-languages
export PATH=/usr/bin

make PKGBUILD .SRCINFO
makepkg -fsri --noconfirm --needed --asdeps --skippgpcheck

which camisole
camisole -l debug test -vv

