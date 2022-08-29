# vendor_pixel-additional
Additional Pixel stuffs

## Note for Google Play system updates support
For now, You need to add workaround to build system
<br>Otherwise, prebuilt apex doesn't correctly work on your device
<br>Check out this hentaiOS' commit.

Corresponding build system commit: [build: Restore MODULE_BUILD_FROM_SOURCE check to ifdef](https://github.com/hentaiOS/platform_build/commit/eac77d2edead4e89b5d92a05a6a9363f13630d2d)

After that, You need to set TARGET_SHIP_PREBUILT_APEX to true in your device tree
<br>For example, in PixelExperience, you should add this flag to aosp_(device-code-name).mk

```TARGET_SHIP_PREBUILT_APEX := true```

And then include the config.mk's path to your device.mk

```$(call inherit-product-if-exists, vendor/pixel-additional/config.mk)```

## Note for including CarrierSettings
You need to set TARGET_INCLUDE_CARRIER_SETTINGS to true in your device tree
<br>For example, in PixelExperience, you should add this flag to aosp_(device-code-name).mk

```TARGET_INCLUDE_CARRIER_SETTINGS := true```

And then include the config.mk's path to your device.mk

```$(call inherit-product-if-exists, vendor/pixel-additional/config.mk)```
