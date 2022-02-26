# vendor_pixel-additional
Additional Pixel stuffs

## Note for Google Play system updates support
You need to inherit updatable APEX in your device tree

Corresponding device tree commit: [Add updatable_apex.mk](https://github.com/CarbonROM/android_device_google_cuttlefish/commit/d8193f25b3041b9f19f3d2f9a4710f44717d3b68)

And need to set TARGET_SUPPORTS_APEX_UPDATE to true in your device tree
<br>For example, in PixelExperience, you should add this flag to aosp_(device-code-name).mk

```TARGET_SUPPORTS_APEX_UPDATE := true```

And then include the config.mk's path to your device.mk

```$(call inherit-product-if-exists, vendor/pixel-additional/config.mk)```

## Note for including CarrierSettings
You need to set TARGET_INCLUDE_CARRIER_SETTINGS to true in your device tree
<br>For example, in PixelExperience, you should add this flag to aosp_(device-code-name).mk

```TARGET_INCLUDE_CARRIER_SETTINGS := true```

And then include the config.mk's path to your device.mk

```$(call inherit-product-if-exists, vendor/pixel-additional/config.mk)```
