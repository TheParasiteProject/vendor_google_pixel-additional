# Anything including updatable_apex.mk should have done so by now.
ifeq ($(TARGET_FLATTEN_APEX), false)
$(call inherit-product-if-exists, vendor/partner_modules/build/mainline_modules.mk)
else
$(call inherit-product-if-exists, vendor/partner_modules/build/mainline_modules_flatten_apex.mk)
endif
