# vendor_pixel-additional
Additional Pixel stuffs

## INFO
After you're cloning this repo into your rom,
<br>when the ```. build/envsetup.sh``` command executed,
<br>this repo's [vendorsetup.sh](https://github.com/TheParasiteProject/vendor_pixel-additional/blob/thirteen-plus/vendorsetup.sh) will automatically sync required fork repos of [StatiXOS](https://github.com/StatiXOS)' [GitLab](https://gitlab.com/statixos)
<br>after coping [pixel-additional.xml](https://github.com/TheParasiteProject/vendor_pixel-additional/blob/thirteen-plus/pixel-additional.xml) under `.repo/local_manifests`
<br>and remove the packages that conflicted.
<br>Check out those files for more informations.

## Note for Google Play system updates support

# Reminder
You should fix VINTF entry missing errors, dlopen failures before you proceed.
<br>Otherwise, Google Play system updates will rollbacks all updates.
<br>Mostly, rollbacking occurs if you missed adding [VINTF](https://source.android.com/docs/core/architecture/vintf) entries in [Frameworks Compatibility Matrix](https://source.android.com/docs/core/architecture/vintf/comp-matrices) or Device Manifest (or both)
<br>that is not marked as optional or important to operate on your system,
<br>or dlopen failed due to missing blobs/symbols.

# Add support for Google Play system updates
You need to set `TARGET_FLATTEN_APEX` to `false` in your device tree
<br>For example, in [PixelExperience](https://github.com/PixelExperience), you should add this flag to `aosp_(device-code-name).mk`

```M
TARGET_FLATTEN_APEX := false
```

And then include the `config.mk`'s path to your `device.mk`

```M
$(call inherit-product-if-exists, vendor/pixel-additional/config.mk)
```

Also, you can possible to build non-updatable flattened APEX too.
<br>Since [StatiXOS](https://github.com/StatiXOS)' [partner modules](https://gitlab.com/statixos/android_vendor_partner_modules) supports it.
<br>For that, set `TARGET_FLATTEN_APEX` to `true` instead.

```M
TARGET_FLATTEN_APEX := true
```

In the case that flattened APEX still not correctly built (e.g. building unbundled apps),
<br>try set `OVERRIDE_TARGET_FLATTEN_APEX` to `true` alongside with `TARGET_FLATTEN_APEX`.
<br>Tip: You can check whether APEX is flattened or not by checking `ro.apex.updatable`.

```M
OVERRIDE_TARGET_FLATTEN_APEX := true
TARGET_FLATTEN_APEX := true
```

If you're device supports Now Playing feature, please set below flag,
<br>so that you can support both Google Play system updates and Now Playing feature.

```M
TARGET_SUPPORTS_NOW_PLAYING := true
```

## Note for including CarrierSettings
You need to set `TARGET_INCLUDE_CARRIER_SETTINGS` to `true` in your device tree
<br>For example, if [PixelExperience](https://github.com/PixelExperience), you should add this flag to `aosp_(device-code-name).mk`

```M
TARGET_INCLUDE_CARRIER_SETTINGS := true
```

And then include the `config.mk`'s path to your `device.mk`

```M
$(call inherit-product-if-exists, vendor/pixel-additional/config.mk)
```

## Note for including additional GApps and customizations
This repo also includes several additional GApps packages, such as 
* `TARGET_INCLUDE_CAMERA_GO`: Camera from Google (Formerly, Camera Go or GCam Go)
* `TARGET_SUPPORTS_LILY_EXPERIENCE`: Enabling Android (Go Edition) device specific features
* `TARGET_NOT_SUPPORTS_GOOGLE_BATTERY`: Build TurboAdapter with dummy GoogleBatteryService
* `TARGET_GBOARD_KEY_HEIGHT`: Resize GBoard ime key height to TARGET_GBOARD_KEY_HEIGHT (Must be float. e.g. 1.2)

## Credits
* [hentaiOS](https://github.com/hentaiOS)
* [StatiX](https://github.com/StatiXOS)
* [PixelExperience](https://github.com/PixelExperience)
* [Jarl-Penguin](https://github.com/JarlPenguin)
