# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Platform Path
PLATFORM_COMMON_PATH := device/motorola/mt6879-common

# Platform
TARGET_KERNEL_VERSION := 5.10
PRODUCT_PLATFORM_MOT := true
TARGET_BOARD_PLATFORM := mt6879
PRODUCT_USES_MTK_HARDWARE := true

# A/B support
AB_OTA_UPDATER := true
PRODUCT_SHIPPING_API_LEVEL := 30

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system_ext \
    system \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot

# Dynamic Partitions
TARGET_USES_DYNAMIC_PARTITIONS := true

# Hardware
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.audio.primary=mediatek

# Power
PRODUCT_USES_PIXEL_POWER_HAL := true

# Recovery
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/init.recovery.mt6879.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6879.rc

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=10,10

$(call inherit-product, device/motorola/common/common.mk)
$(call inherit-product, vendor/motorola/mt6879-common/mt6879-common-vendor.mk)
