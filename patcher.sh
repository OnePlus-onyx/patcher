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
    'gonk-misc/libcarthage'
)

for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"

    git am --keep-cr "${ROOT}/patcher/patches/${repository}"/*

    cd "${ROOT}"
done
