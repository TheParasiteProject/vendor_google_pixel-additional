# Optional Bluetooth
# TODO: Remove these after Bluetooth module is added to partner_modules

SOONG_CONFIG_NAMESPACES += bluetooth_module
SOONG_CONFIG_bluetooth_module += source_build
SOONG_CONFIG_bluetooth_module_source_build := true

MAINLINE_INCLUDE_BT_MODULE ?= false
ifeq ($(MAINLINE_INCLUDE_BT_MODULE),true)
SOONG_CONFIG_bluetooth_module_source_build := false
PRODUCT_PACKAGES += \
    MainlineBtModule
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/apex/com.google.android.btservices.apex
endif

ifeq (,$(findstring x86,$(TARGET_PRODUCT)))
# arm
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/framework/arm/%.art \
    system/framework/arm/%.oat \
    system/framework/arm/%.vdex \
    system/framework/arm64/%.art \
    system/framework/arm64/%.oat \
    system/framework/arm64/%.vdex \

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/framework/oat/arm/%.odex \
    system/framework/oat/arm/%.vdex \
    system/framework/oat/arm64/%.odex \
    system/framework/oat/arm64/%.vdex \

endif
