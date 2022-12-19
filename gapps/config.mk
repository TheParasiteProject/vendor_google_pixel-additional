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

PRODUCT_PACKAGES += \
    ExcludePackages

# Pixel Themes
ifeq ($(TARGET_INCLUDE_PIXEL_THEMES),true)
# Live Wallpapers
ifeq ($(TARGET_INCLUDE_LIVE_WALLPAPERS),true)
PRODUCT_PACKAGES += \
    PixelLiveWallpaperPrebuilt \
    MicropaperPrebuilt
endif

# product/app
PRODUCT_PACKAGES += \
    PixelThemesStub \
    PixelThemesStub2022_and_newer \
    PixelWallpapers2022 \

# system_ext/priv-app
PRODUCT_PACKAGES += \
    WallpaperPickerGoogleRelease
endif

# Call recording on Google Dialer
ifeq ($(TARGET_SUPPORTS_CALL_RECORDING),true)
PRODUCT_PACKAGES += \
    com.google.android.apps.dialer.call_recording_audio.features
endif

# Camera from Google (CameraGo)
ifeq ($(TARGET_INCLUDE_CAMERA_GO),true)
PRODUCT_PACKAGES += \
    CameraGo
endif

# Enable Android (Go Edition) device specific features
ifeq ($(TARGET_SUPPORTS_LILY_EXPERIENCE),true)
PRODUCT_PACKAGES += \
    lily_experience
endif

# Include additional gapps packages
ifeq ($(TARGET_INCLUDE_ADDITIONAL_GAPPS),true)
PRODUCT_PACKAGES += \
    Drive \
    TipsPrebuilt

PRODUCT_PACKAGES += \
    pixel_tips
endif
