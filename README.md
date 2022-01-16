# vendor_pixel-additional
Additional Pixel stuffs

## Note for Google Play system updates support
You need to inherit updatable APEX in your device tree

Corresponding device tree commit: [Add updatable_apex.mk](https://github.com/CarbonROM/android_device_google_cuttlefish/commit/d8193f25b3041b9f19f3d2f9a4710f44717d3b68)

And then include the config.mk's path to your device.mk something like

```include vendor/pixel-additional/config.mk```
