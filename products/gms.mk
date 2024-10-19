#
# Copyright (C) 2018-2019 The Google Pixel3ROM Project
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
#
# Licensed under the Apache License, Version 2.0 (the License);
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an AS IS BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

# Camera from Google (CameraGo)
ifeq ($(TARGET_INCLUDE_CAMERA_GO),true)
PRODUCT_PACKAGES += \
    CameraGo \
    privapp-permissions-camera-go

PRODUCT_PACKAGES += \
    PixelLauncherCustomOverlayCameraGo \
    PixelConfigOverlayCameraGo \
    SystemUICustomOverlayCameraGo
endif

# Enable Android (Go Edition) device specific features
ifeq ($(TARGET_SUPPORTS_LILY_EXPERIENCE),true)
PRODUCT_PACKAGES += \
    lily_experience
endif

ifneq ($(WITH_GMS),false)

# Include TurboAdapter without Google Battery support
ifeq ($(TARGET_SUPPORTS_GOOGLE_BATTERY),false)
PRODUCT_PACKAGES += \
    TurboAdapter_NoBatt \
    libpowerstatshaldataprovider
endif #TARGET_SUPPORTS_GOOGLE_BATTERY

# Resize GBoard ime key height to TARGET_GBOARD_KEY_HEIGHT
# Value must be float e.g. 1.2
ifneq ($(TARGET_GBOARD_KEY_HEIGHT),)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.height_ratio=$(TARGET_GBOARD_KEY_HEIGHT)
endif

endif #WITH_GMS
