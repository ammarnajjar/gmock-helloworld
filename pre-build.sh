#!/bin/bash

rm -rf build
rm -rf googletest

git clone https://github.com/google/googletest.git
cd googletest
mkdir build
cd build
cmake ..
make

cd ..

mkdir build
cd build

# vim: set ft=sh ts=4 sw=4 noet ai :
