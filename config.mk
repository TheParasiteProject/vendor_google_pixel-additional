# Inherit from telephony config
$(call inherit-product, vendor/pixel-additional/products/telephony.mk)

# Inherit from apex config
$(call inherit-product, vendor/mainline_modules/config.mk)

# Inherit from gms config
$(call inherit-product, vendor/pixel-additional/products/gms.mk)
