#
# Copyright (C) 2011 The Android Open-Source Project
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
#

DEVICE_FOLDER := device/alcatel/cedar

# Hardware tunables
BOARD_HARDWARE_CLASS := $(DEVICE_FOLDER)/cmhw

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true

# Use the non-open-source parts, if they're present
#-include vendor/alcatel/cedar/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := omap4
#TARGET_BOARD_INFO_FILE := $(DEVICE_FOLDER)/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := cedar

# Processor
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon

# Kernel
BOARD_KERNEL_BASE := 0x80007FC0
# BOARD_KERNEL_CMDLINE :=

# Inline kernel building
#TARGET_KERNEL_CONFIG := cyanogenmod_tuna_defconfig
#TARGET_KERNEL_SOURCE := kernel/samsung/tuna

# Fall back to prebuilt kernel if the sources aren't present
# or inline kernel building is not supported
TARGET_PREBUILT_KERNEL := $(DEVICE_FOLDER)/kernel

# EGL
BOARD_EGL_CFG := $(DEVICE_FOLDER)/prebuilt/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true

BOARD_USE_TI_DUCATI_H264_PROFILE := true

# Include HDCP keys
BOARD_CREATE_CEDAR_HDCP_KEYS_SYMLINK := true

# Force the screenshot path to CPU consumer
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH

# set if the target supports FBIO_WAITFORVSYNC
TARGET_HAS_WAITFORVSYNC := true

# device-specific extensions to the updater binary
#TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_cedar
#TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_FOLDER)

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 314572800
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 419430400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6442450944
BOARD_FLASH_BLOCK_SIZE := 4096

# No sync framework for this device...
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

#TARGET_PROVIDES_INIT_RC := true
#TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# Wifi

USES_TI_MAC80211 := true

ifdef USES_TI_MAC80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_wl12xx
PRODUCT_WIRELESS_TOOLS           := true
BOARD_WLAN_DEVICE                := wl12xx_mac80211
BOARD_SOFTAP_DEVICE              := wl12xx_mac80211
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wl12xx_sdio.ko"
WIFI_DRIVER_MODULE_NAME          := "wl12xx_sdio"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/ti-connectivity/wl128x-fw.bin"
WIFI_FIRMWARE_LOADER             := ""
COMMON_GLOBAL_CFLAGS             += -DUSES_TI_MAC80211
endif

#BOARD_WLAN_DEVICE                := bcmdhd
#BOARD_WLAN_DEVICE_REV            := bcm4330_b2
#WPA_SUPPLICANT_VERSION           := VER_0_8_X
#BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
#BOARD_HOSTAPD_DRIVER             := NL80211
#BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
#WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
#WIFI_DRIVER_MODULE_PATH         := "/system/lib/modules/bcmdhd.ko"
#WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
#WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd_apsta.bin"
#WIFI_BAND                        := 802_11_ABG

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

#BOARD_HAVE_BLUETOOTH_BCM := true
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_FOLDER)/bluetooth

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

BOARD_HAL_STATIC_LIBRARIES := libdumpstate.cedar

# Security
BOARD_USES_SECURE_SERVICES := true

# SELinux
BOARD_SEPOLICY_DIRS += \
        $(DEVICE_FOLDER)/sepolicy

BOARD_SEPOLICY_UNION += \
        genfs_contexts \
        file_contexts

# Recovery
BOARD_UMS_LUNFILE               := "/sys/class/android_usb/f_mass_storage/lun/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun/file"
TARGET_RECOVERY_INITRC          := device/alcatel/cedar/recovery/init.rc
RECOVERY_FSTAB_VERSION          := 2
TARGET_RECOVERY_FSTAB           := $(DEVICE_FOLDER)/rootdir/fstab.cedar
TARGET_RECOVERY_PIXEL_FORMAT    := "BGRA_8888"
#TARGET_RECOVERY_UI_LIB         := librecovery_ui_cedar
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/alcatel/cedar/recovery/cedar_recovery_keys.c
BOARD_HAS_NO_SELECT_BUTTON      := true
BOARD_USE_CUSTOM_RECOVERY_FONT  := \"roboto_15x24.h\"
#BOARD_RECOVERY_SWIPE          := true