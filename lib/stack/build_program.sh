#!/bin/sh
./build_lib.sh
fpc ./main.pas -Mtp -obuild/main -Fubuild
