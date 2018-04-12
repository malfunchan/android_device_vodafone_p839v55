#
# Copyright 2017 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SRC_FILES := power.c
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_MODULE := power.qcom
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
