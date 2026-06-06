$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/xiaomi/annibale/device.mk)
CUSTOM_BUILD := annibale
$(call inherit-product, vendor/custom/config/common_full_phone.mk)
PRODUCT_NAME := aosp_annibale
PRODUCT_DEVICE := annibale
PRODUCT_BRAND := POCO
PRODUCT_MODEL := 2510DPC44G
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="annibale-user 16 BP2A.250605.031.A3 OS3.0.8.0.WPKMIXM release-keys" \
    BuildFingerprint="POCO/annibale_global/annibale:16/BP2A.250605.031.A3/OS3.0.8.0.WPKMIXM:user/release-keys"
