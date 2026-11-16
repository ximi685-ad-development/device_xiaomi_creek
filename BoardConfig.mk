#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from xiaomi sm6225-common
include device/xiaomi/sm6225-common/BoardConfigCommon.mk

# Inherit from the proprietary version
include vendor/xiaomi/creek/BoardConfigVendor.mk

DEVICE_PATH := device/xiaomi/creek
KERNEL_PATH := $(DEVICE_PATH)-kernel

# Display
TARGET_SCREEN_DENSITY := 420

# Init
TARGET_RECOVERY_DEVICE_MODULES := init_creek

# Inherit from proprietary files for miuicamera
-include device/xiaomi/miuicamera-creek/BoardConfig.mk

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_dlkm system_ext vendor vendor_dlkm
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200

BOARD_DTB_OFFSET := 0x01f00000
BOARD_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000

# Kernel prebuilt
BOARD_USES_DT := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/dtbs
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbs/dtbo.img

TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_KERNEL_SOURCE := $(KERNEL_PATH)/kernel-headers
TARGET_NO_KERNEL_OVERRIDE := true
TARGET_PREBUILT_KERNEL := $(KERNEL_PATH)/kernel

PRODUCT_COPY_FILES += $(TARGET_PREBUILT_KERNEL):kernel

BOARD_VENDOR_KERNEL_MODULES := $(shell find $(KERNEL_PATH)/vendor_dlkm -name "*.ko")
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/vendor_dlkm/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE :=  $(KERNEL_PATH)/vendor_dlkm/modules.blocklist

BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(shell find $(KERNEL_PATH)/vendor_ramdisk -name "*.ko")
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat  $(KERNEL_PATH)/vendor_ramdisk/modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(KERNEL_PATH)/vendor_ramdisk/modules.blocklist

BOARD_SYSTEM_KERNEL_MODULES                        := $(shell find $(KERNEL_PATH)/system_dlkm -name "*.ko")
BOARD_SYSTEM_KERNEL_MODULES_LOAD                   := $(strip $(shell cat $(KERNEL_PATH)/system_dlkm/modules.load))
BOARD_SYSTEM_KERNEL_MODULES_BLOCKLIST_FILE         := $(KERNEL_PATH)/system_dlkm/modules.blocklist

BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/vendor_ramdisk/modules.load.recovery))

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/properties/vendor.prop
