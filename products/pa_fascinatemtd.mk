# Copyright (C) 2013 ParanoidAndroid Project
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

# Check for target product
ifeq (pa_fascinatemtd,$(TARGET_PRODUCT))

# Specify ro.pa.device
PA_DEVICE ?= fascinatemtd

# Declare use of and name of RIL_CLASS SamsungExynos3RIL or FascinateRIL
TARGET_PROVIDES_RIL_CLASS ?= FascinateRIL

# Use custom release tool
ifneq (true,$(SKIP))
    TARGET_CUSTOM_RELEASETOOL :=source vendor/pa/tools/squisher
endif

# Don't add charger to recovery
EXCLUDE_RECOVERY_CHARGER ?= true

# Market specific access
PRODUCT_GMS_CLIENTID_BASE ?= android-verizon

# Skip PA OTA
NO_OTA_BUILD ?= true

# Build SU
COMPILE_SU ?= false

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_hdpi

# Board provides own charger
BOARD_PROVIDE_CHARGER ?= false

# Provide init.rc
TARGET_PROVIDES_INIT_RC := false

# TWRP Recovery
TWRP_RECOVERY ?= false

# Include AOSPA common configuration
include vendor/pa/main.mk

# Inherit device configuration
$(call inherit-product, device/samsung/fascinatemtd/full_fascinatemtd.mk)

# Inherit telephony common stuff
$(call inherit-product, vendor/pa/configs/telephony.mk)

# CM Package Extras if exists
-include vendor/pa/configs/cm_packages.mk

# Use METADATA
USE_SET_METADATA := false

# Build kernel from sources
KERNEL_FROM_SOURCE ?= true

# Use of a custom kernel
CUSTOM_KERNEL ?= false

# Activate the use of various optimizations
ACTIVATE_OPTS ?= true

# Override AOSP build properties
PRODUCT_NAME := pa_fascinatemtd
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := fascinatemtd
PRODUCT_MODEL := SCH-I500
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SCH-I500 TARGET_DEVICE=SCH-I500 BUILD_FINGERPRINT=verizon/SCH-I500/SCH-I500:2.3.5/GINGERBREAD/EI20:user/release-keys PRIVATE_BUILD_DESC="SCH-I500-user 2.3.5 GINGERBREAD EI20 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-verizon

endif
