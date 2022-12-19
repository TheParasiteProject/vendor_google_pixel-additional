# Inherit from telephony config
$(call inherit-product, vendor/pixel-additional/configs/telephony.mk)

# Inherit from gapps config
$(call inherit-product, vendor/pixel-additional/gapps/config.mk)

ifeq ($(INCLUDE_PIXEL_LAUNCHER),true)
# Include Custom Theme Icons for Pixel Launcher if exists
$(call inherit-product-if-exists, packages/overlays/ThemeIcons/config.mk)
endif
