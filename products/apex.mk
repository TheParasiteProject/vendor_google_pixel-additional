# Anything including updatable_apex.mk should have done so by now.
ifeq ($(TARGET_FLATTEN_APEX), false)

ifneq ($(MAINLINE_INCLUDE_UWB_MODULE), false)
MAINLINE_INCLUDE_UWB_MODULE := true
endif

ifneq ($(MAINLINE_INCLUDE_WIFI_MODULE), false)
MAINLINE_INCLUDE_WIFI_MODULE := true
endif

ifneq ($(MAINLINE_INCLUDE_BT_MODULE), false)
MAINLINE_INCLUDE_BT_MODULE := true
$(call inherit-product, vendor/pixel-additional/products/apex/mainline_bluetooth_module.mk)
endif

$(call inherit-product-if-exists, vendor/partner_modules/build/mainline_modules.mk)

ifeq ($(TARGET_SUPPORTS_NOW_PLAYING), true)
PRODUCT_PACKAGES += \
	ApexNowPlayingOverlay
else
PRODUCT_PACKAGES += \
	ApexOverlay
endif

# Overlay
PRODUCT_PACKAGES += \
	ApexSettingsOverlay \
	PixelDocumentsUIGoogleOverlayExtra \
	CaptivePortalLoginOverlayExtra \
	CellBroadcastReceiverOverlayExtra \
	CellBroadcastServiceOverlayExtra \
	GoogleConfigBluetoothOverlay \
	GoogleConfigOverlayExtra \
	GooglePermissionControllerOverlayExtra

else
$(call inherit-product-if-exists, vendor/partner_modules/build/mainline_modules_flatten_apex.mk)
endif
