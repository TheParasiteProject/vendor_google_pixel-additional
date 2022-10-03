# vendor_pixel-additional
Additional Pixel stuffs

## Note for Google Play system updates support
You need to set TARGET_SHIP_PREBUILT_APEX to true in your device tree
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
