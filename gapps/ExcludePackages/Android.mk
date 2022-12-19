LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := ExcludePackages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES += \
	PixelSetupWizardStringsOverlay
ifeq ($(TARGET_INCLUDE_PIXEL_THEMES),true)
LOCAL_OVERRIDES_PACKAGES += \
	StatixThemePicker \
	StatiXOSWalls \
	ColorStub
endif
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
