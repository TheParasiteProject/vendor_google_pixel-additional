# vendor_google_pixel-additional
Additional Pixel stuffs

## Note for including CarrierSettings
You need to set `TARGET_INCLUDE_CARRIER_SETTINGS` to `true` in your device tree
<br>For example, if [PixelExperience](https://github.com/PixelExperience), you should add this flag to `aosp_(device-code-name).mk`

```M
TARGET_INCLUDE_CARRIER_SETTINGS := true
```

And then include the `config.mk`'s path to your `device.mk`

```M
$(call inherit-product-if-exists, vendor/google/pixel-additional/config.mk)
```

## Note for including more telephony components

* `TARGET_INCLUDE_PIXEL_IMS`: Pixel IMS
* `TARGET_INCLUDE_PIXEL_EUICC`: Pixel eUICC
* `TARGET_INCLUDE_CARRIER_SERVICES`: Google Carrier Services

## Note for including additional GApps and customizations

This repo also includes several additional GApps packages, such as 
* `TARGET_INCLUDE_CAMERA_GO`: Camera from Google (Formerly, Camera Go or GCam Go)
* `TARGET_SUPPORTS_LILY_EXPERIENCE`: Enabling Android (Go Edition) device specific features
* `TARGET_SUPPORTS_GOOGLE_BATTERY`: Build TurboAdapter with dummy GoogleBatteryService wheh flag is false
* `TARGET_GBOARD_KEY_HEIGHT`: Resize GBoard ime key height to `TARGET_GBOARD_KEY_HEIGHT` (Must be float. e.g. 1.2)
