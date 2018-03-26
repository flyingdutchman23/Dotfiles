#!/bin/bash

wget https://github.com/SimonKagstrom/kcov/archive/master.tar.gz &&
    tar xzf master.tar.gz &&
    cd kcov-master &&
    mkdir build && cd build &&
    cmake .. && make && sudo make install &&
    cd ../.. &&
    rm -rf kcov-master &&
    mkdir -p coverage &&
    kcov coverage install.sh &&
    bash <(curl -s https://codecov.io/bash)
