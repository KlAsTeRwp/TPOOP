#!/bin/sh
rm -rf build
mkdir build
fpc stack.pas -Mtp -obuild/pack.ppu
