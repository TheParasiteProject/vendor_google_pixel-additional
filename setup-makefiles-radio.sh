#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=radio
VENDOR=pixel-additional

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../.."

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
sed -i 's|vendor/pixel-additional/|vendor/pixel-additional/radio|g' "${PRODUCTMK}"
sed -i 's|device/pixel-additional//setup-makefiles-radio.sh|vendor/pixel-additional/setup-makefiles-radio.sh|g' "${ANDROIDBP}" "${ANDROIDMK}" "${BOARDMK}" "${PRODUCTMK}"

write_makefiles "${MY_DIR}/proprietary-files-radio.txt" true

# Finish
write_footers

# Radio/IMS
sed -i '/com.android.sdm.plugins.diagmon.xml/d' "${ANDROID_ROOT}/vendor/pixel-additional/common/common-vendor.mk"
sed -i '/com.google.euiccpixel.permissions.xml/d' "${ANDROID_ROOT}/vendor/pixel-additional/common/common-vendor.mk"
sed -i '/com.google.euiccpixel.xml/d' "${ANDROID_ROOT}/vendor/pixel-additional/common/common-vendor.mk"
sed -i '/com.shannon.imsservice.xml/d' "${ANDROID_ROOT}/vendor/pixel-additional/common/common-vendor.mk"
sed -i '/com.shannon.rcsservice.xml/d' "${ANDROID_ROOT}/vendor/pixel-additional/common/common-vendor.mk"
sed -i '/DiagMon/d' "${ANDROID_ROOT}/vendor/pixel-additional/common/common-vendor.mk"
sed -i '/EuiccGoogle/d' "${ANDROID_ROOT}/vendor/pixel-additional/common/common-vendor.mk"
sed -i '/ImsMediaService/d' "${ANDROID_ROOT}/vendor/pixel-additional/common/common-vendor.mk"
sed -i '/libmedia.so/d' "${ANDROID_ROOT}/vendor/pixel-additional/common/common-vendor.mk"
sed -i '/libmediaadaptor.so/d' "${ANDROID_ROOT}/vendor/pixel-additional/common/common-vendor.mk"
sed -i '/PixelQualifiedNetworksService/d' "${ANDROID_ROOT}/vendor/pixel-additional/common/common-vendor.mk"
sed -i '/ShannonIms/d' "${ANDROID_ROOT}/vendor/pixel-additional/common/common-vendor.mk"
sed -i '/ShannonRcs/d' "${ANDROID_ROOT}/vendor/pixel-additional/common/common-vendor.mk"
