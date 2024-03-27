#
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifneq ($(TARGET_SHIP_GMS),false)
ifeq ($(TARGET_INCLUDE_CARRIER_SERVICES), true)
PRODUCT_PACKAGES += \
    CarrierServices
endif

ifeq ($(TARGET_INCLUDE_PIXEL_IMS), true)
PRODUCT_SOONG_NAMESPACES += \
    vendor/pixel-additional/radio

PRODUCT_PACKAGES += \
    PixelTelephonyOverlayAdditional

PRODUCT_COPY_FILES += \
    vendor/pixel-additional/radio/proprietary/product/etc/permissions/com.android.sdm.plugins.diagmon.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.android.sdm.plugins.diagmon.xml \
    vendor/pixel-additional/radio/proprietary/product/etc/sysconfig/allowlist_com.shannon.imsservice.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/allowlist_com.shannon.imsservice.xml \
    vendor/pixel-additional/radio/proprietary/system_ext/etc/permissions/com.shannon.imsservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.shannon.imsservice.xml \
    vendor/pixel-additional/radio/proprietary/system_ext/etc/permissions/com.shannon.rcsservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.shannon.rcsservice.xml \
    vendor/pixel-additional/radio/proprietary/system_ext/lib64/libimsmedia.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/libimsmedia.so \
    vendor/pixel-additional/radio/proprietary/system_ext/lib64/libmediaadaptor.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/libmediaadaptor.so

PRODUCT_PACKAGES += \
    DiagMon \
    ImsMediaService \
    ShannonIms \
    ShannonRcs

$(call inherit-product, vendor/pixel-additional/radio/radio-vendor.mk)
endif

ifeq ($(TARGET_INCLUDE_PIXEL_EUICC), true)
PRODUCT_SOONG_NAMESPACES += \
    vendor/pixel-additional/radio

PRODUCT_COPY_FILES += \
    vendor/pixel-additional/radio/proprietary/system_ext/etc/permissions/com.google.euiccpixel.permissions.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.google.euiccpixel.permissions.xml \
    vendor/pixel-additional/radio/proprietary/system_ext/etc/permissions/com.google.euiccpixel.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.google.euiccpixel.xml

PRODUCT_PACKAGES += \
    EuiccGoogle

$(call inherit-product, vendor/pixel-additional/radio/radio-vendor.mk)
endif

ifeq ($(TARGET_INCLUDE_CARRIER_SETTINGS), true)

TARGET_REQUIRES_APN_CONF := false

# Include Carrier Runtime Configuration
PRODUCT_PACKAGES += \
    CarrierSettingsConfigOverlay \
    CarrierSettingsOverlay \
    CarrierSettingsProviderOverlay \
    CarrierSettingsSystemUIOverlay

# Disable mobile data in roaming by default.
PRODUCT_VENDOR_PROPERTIES += \
    ro.com.android.dataroaming=false

$(call inherit-product, vendor/pixel-additional/common/common-vendor.mk)
endif
endif
