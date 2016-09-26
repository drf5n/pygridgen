#!/bin/bash


cd csa
CC=/usr/bin/gcc ./configure && make
sudo make install
cd ..

cd nn
CC=/usr/bin/gcc ./configure && make
sudo make install
cd ..

cd gridutils
CC=/usr/bin/gcc ./configure && make
sudo make install
cd ..

cd gridgen
CC=/usr/bin/gcc ./configure && make && make lib && make shlib
sudo make install
cd ..
