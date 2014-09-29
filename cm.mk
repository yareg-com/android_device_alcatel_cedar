# Release name
PRODUCT_RELEASE_NAME := GN-GSM

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
#$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/alcatel/cedar/aosp_cedar.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := cedar
PRODUCT_NAME := cm_cedar
PRODUCT_BRAND := Alcatel
PRODUCT_MODEL := OT-986
PRODUCT_MANUFACTURER := TCL

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=yakju BUILD_FINGERPRINT="google/yakju/maguro:4.3/JWR66Y/776638:user/release-keys" PRIVATE_BUILD_DESC="yakju-user 4.3 JWR66Y 776638 release-keys"
