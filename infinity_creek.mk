#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from creek device
$(call inherit-product, device/xiaomi/creek/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

# Build flags
INFINITY_BUILD_TYPE := OFFICIAL
INFINITY_MAINTAINER := "Liekoo"
TARGET_HAS_UDFPS := false
WITH_GAPPS := true
TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_NAME := infinity_creek
PRODUCT_DEVICE := creek
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi 15 4G

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Xiaomi/creek_global/creek:14/UKQ1.230917.001/V816.0.6.0.UMGIDXM:user/release-keys
