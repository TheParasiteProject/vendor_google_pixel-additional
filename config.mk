# Inherit from telephony config
$(call inherit-product, vendor/pixel-additional/configs/telephony.mk)

# Inherit from apex config
$(call inherit-product, vendor/pixel-additional/configs/apex.mk)

# Inherit from gapps config
$(call inherit-product, vendor/pixel-additional/gapps/config.mk)
