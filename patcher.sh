#!/bin/bash

ROOT="${PWD}"

REPOSITORIES=(
    'art'
    'bionic'
    'build/make'
    'build/soong'
    'external/tinycompress'
    'frameworks/av'
    'frameworks/native'
    'frameworks/base'
    'hardware/libhardware'
    'hardware/libhardware_legacy'
    'system/bt'
    'system/core'
)

for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"

    git am --keep-cr "${ROOT}/patcher/patches/${repository}"/*

    cd "${ROOT}"
done


#echo "Switch libcarthage to https://github.com/OnePlus-onyx/libcarthage" 
#cd ${ROOT}/gonk-misc
#rm -rf libcarthage
#git clone https://github.com/OnePlus-onyx/libcarthage -b onyx --depth=1
#echo "Done!" 

cd ${ROOT}


