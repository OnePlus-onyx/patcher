#!/bin/bash

ROOT="${PWD}"

REPOSITORIES=(
    'art'
    'bionic'
    'build/make'
    'build/soong'
    'external/selinux'
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
