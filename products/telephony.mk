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

ifneq ($(WITH_GMS),false)

ifeq ($(TARGET_INCLUDE_CARRIER_SERVICES), true)
PRODUCT_PACKAGES += \
    CarrierServices
endif

ifeq ($(TARGET_INCLUDE_PIXEL_IMS), true)
PRODUCT_SOONG_NAMESPACES += \
    vendor/google/pixel-additional/radio

PRODUCT_PACKAGES += \
    PixelTelephonyOverlayAdditional

PRODUCT_COPY_FILES += \
    vendor/google/pixel-additional/radio/proprietary/product/etc/permissions/com.android.sdm.plugins.diagmon.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.android.sdm.plugins.diagmon.xml \
    vendor/google/pixel-additional/radio/proprietary/product/etc/sysconfig/allowlist_com.shannon.imsservice.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/allowlist_com.shannon.imsservice.xml \
    vendor/google/pixel-additional/radio/proprietary/system_ext/etc/permissions/com.shannon.imsservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.shannon.imsservice.xml \
    vendor/google/pixel-additional/radio/proprietary/system_ext/etc/permissions/com.shannon.rcsservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.shannon.rcsservice.xml

PRODUCT_PACKAGES += \
    libpixelimsmedia \
    libmediaadaptor \
    DiagMon \
    ImsMediaService \
    ShannonIms \
    ShannonRcs

$(call inherit-product, vendor/google/pixel-additional/radio/radio-vendor.mk)
endif

ifeq ($(TARGET_INCLUDE_PIXEL_EUICC), true)
PRODUCT_SOONG_NAMESPACES += \
    vendor/google/pixel-additional/radio

PRODUCT_COPY_FILES += \
    vendor/google/pixel-additional/radio/proprietary/system_ext/etc/permissions/com.google.euiccpixel.permissions.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.google.euiccpixel.permissions.xml \
    vendor/google/pixel-additional/radio/proprietary/system_ext/etc/permissions/com.google.euiccpixel.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.google.euiccpixel.xml

PRODUCT_PACKAGES += \
    EuiccGoogle

# Custom hidden api whitelist
PRODUCT_PACKAGES += \
    com.google.android.euicc_whitelist_custom.xml

$(call inherit-product, vendor/google/pixel-additional/radio/radio-vendor.mk)
endif

ifeq ($(TARGET_INCLUDE_CARRIER_SETTINGS), true)

TARGET_REQUIRES_APN_CONF := false

# Include Carrier Runtime Configuration
PRODUCT_PACKAGES += \
    CarrierSettingsConfigOverlay \
    CarrierSettingsOverlay \
    CarrierSettingsProviderOverlay \
    CarrierSettingsSystemUIOverlay

# Include common SIM configuration proprieties
PRODUCT_VENDOR_PROPERTIES += \
    keyguard.no_require_sim=true \
    ro.com.android.prov_mobiledata=false

$(call inherit-product, vendor/google/pixel-additional/common/common-vendor.mk)
endif

endif #WITH_GMS
