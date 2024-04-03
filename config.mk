# Inherit from telephony config
$(call inherit-product, vendor/google/pixel-additional/products/telephony.mk)

ifneq ($(TARGET_SHIP_GMS),false)
# Inherit from apex config
$(call inherit-product, vendor/google/mainline_modules/config.mk)
endif

# Inherit from gms config
$(call inherit-product, vendor/google/pixel-additional/products/gms.mk)
