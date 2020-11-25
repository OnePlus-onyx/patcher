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
    'hardware/libhardware'
    'hardware/libhardware_legacy'
    'system/bt'
    'system/core'
)

for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"
        for patch in ${ROOT}/patcher/patches/${repository}/*.patch; do
                #Check if patch is already applied
                if patch -f -p1 --dry-run -R < $patch > /dev/null;then
                        echo -e "\e[1;33m [Skip] \e[0m  ${patch##*/}"
                        continue
                fi
                #Ckeck patch error
                git apply --check  $patch  2> ${ROOT}/patcher/patch.tmp
                if [ -s ${ROOT}/patcher/patch.tmp ]; then
                    echo -e "\e[1;31m [Error] \e[0m removed: ${patch##*/}"
                    rm ${ROOT}/patcher/patch.tmp
                else
                    echo -e "\e[1;32m [Patch] \e[0m  ${patch##*/}"
                    git am $patch > /dev/null
                fi
        done 
    cd "${ROOT}"
done



cd ${ROOT}


