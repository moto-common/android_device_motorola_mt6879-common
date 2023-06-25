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

# Platform Path
PLATFORM_COMMON_PATH := device/motorola/mt6768-common

# Platform
TARGET_KERNEL_VERSION := 4.19
PRODUCT_PLATFORM_MOT := true
TARGET_BOARD_PLATFORM := mt6768
PRODUCT_USES_MTK_HARDWARE := true

# A/B support
AB_OTA_UPDATER := true
PRODUCT_SHIPPING_API_LEVEL := 29

AB_OTA_PARTITIONS += \
    boot \
    product \
    system_ext \
    system \
    vendor \
    vbmeta \
    vbmeta_system

# Dynamic Partitions
TARGET_USES_DYNAMIC_PARTITIONS := true

# Fingerprint
TARGET_USES_EGISTEC_FINGERPRINT := true
TARGET_USES_FPC_FINGERPRINT := true

# Gatekeeper
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gatekeeper.disable_spu=true

PRODUCT_USES_PIXEL_POWER_HAL := true

# Recovery
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/init.recovery.mt6768.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6768.rc

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=10,10 \
    ro.vendor.mtk_protocol1_rat_config=Lf/Lt/W/G

$(call inherit-product, device/motorola/common/common.mk)
$(call inherit-product, vendor/motorola/mt6768-common/mt6768-common-vendor.mk)
