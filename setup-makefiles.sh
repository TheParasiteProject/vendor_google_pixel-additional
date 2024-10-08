#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=common
VENDOR=google/pixel-additional

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

export TARGET_ENABLE_CHECKELF=true

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" true

# Warning headers and guards
write_headers "arm64"
sed -i 's|TARGET_DEVICE|TARGET_ARCH|g' "${ANDROIDMK}"
sed -i 's|vendor/google/pixel-additional/|vendor/google/pixel-additional/common|g' "${PRODUCTMK}"
sed -i 's|device/google/pixel-additional//setup-makefiles.sh|vendor/google/pixel-additional/setup-makefiles.sh|g' "${ANDROIDBP}" "${ANDROIDMK}" "${BOARDMK}" "${PRODUCTMK}"

write_makefiles "${MY_DIR}/proprietary-files.txt" true

# Finish
write_footers

# Exclusions
sed -i '/libpowerstatshaldataprovider/d' "${ANDROID_ROOT}/vendor/google/pixel-additional/common/common-vendor.mk"

# Initialize the helper
setup_vendor "radio" "${VENDOR}" "${ANDROID_ROOT}" true

# Warning headers and guards
write_headers "arm64"
sed -i 's|TARGET_DEVICE|TARGET_ARCH|g' "${ANDROIDMK}"
sed -i 's|vendor/google/pixel-additional/|vendor/google/pixel-additional/common|g' "${PRODUCTMK}"
sed -i 's|device/google/pixel-additional//setup-makefiles.sh|vendor/google/pixel-additional/setup-makefiles.sh|g' "${ANDROIDBP}" "${ANDROIDMK}" "${BOARDMK}" "${PRODUCTMK}"

write_makefiles "${MY_DIR}/proprietary-files-radio.txt" true

# Finish
write_footers

cp -rf ${MY_DIR}/radiovendormk.txt ${MY_DIR}/radio/radio-vendor.mk
