#!/bin/bash

set -ex

cd deployment/pkg/camisole-languages

make PKGBUILD
make .SRCINFO

makepkg -fcsi

