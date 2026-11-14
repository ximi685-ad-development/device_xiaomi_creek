#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from xiaomi sm6225-common
$(call inherit-product, device/xiaomi/sm6225-common/common.mk)

# Inherit from the proprietary version
$(call inherit-product, vendor/xiaomi/creek/creek-vendor.mk)

# Call the MiuiCamera setup
$(call inherit-product-if-exists, device/xiaomi/miuicamera-creek/device.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-V2-ndk.vendor \
    android.hardware.biometrics.fingerprint@2.1.vendor \
    com.fingerprints.extension@1.0.vendor \
    vendor.xiaomi.hardware.fingerprintextension@1.0.vendor \
    libunwindstack.vendor:64

# Overlays
PRODUCT_PACKAGES += \
    ApertureResCreek \
    FrameworksResCreek \
    NotchBarKiller \
    SettingsProviderResCreek \
    SettingsResCreek \
    SystemUIResCreek \
    WifiResCreek

# Init
$(call soong_config_set,libinit,vendor_init_lib,//$(LOCAL_PATH):init_creek)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
