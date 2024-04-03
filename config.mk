# Inherit from telephony config
$(call inherit-product, vendor/google/pixel-additional/products/telephony.mk)

# Inherit from apex config
$(call inherit-product, vendor/google/mainline_modules/config.mk)

# Inherit from gms config
$(call inherit-product, vendor/google/pixel-additional/products/gms.mk)
