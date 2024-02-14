# Inherit from telephony config
$(call inherit-product, vendor/pixel-additional/products/telephony.mk)

ifneq ($(TARGET_SHIP_GMS),false)
# Inherit from apex config
$(call inherit-product, vendor/mainline_modules/config.mk)
endif

# Inherit from gms config
$(call inherit-product, vendor/pixel-additional/products/gms.mk)
