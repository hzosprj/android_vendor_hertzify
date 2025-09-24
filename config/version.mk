# Copyright (C) 2025 HERTZIFY
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

ANDROID_VERSION := 16
CHERISH_VERSION := 1.0

HERTZIFY_BUILD_TYPE ?= UNOFFICIAL
HERTZIFY_MAINTAINER ?= UNKNOWN
HERTZIFY_DATE_YEAR := $(shell date -u +%Y)
HERTZIFY_DATE_MONTH := $(shell date -u +%m)
HERTZIFY_DATE_DAY := $(shell date -u +%d)
HERTZIFY_DATE_HOUR := $(shell date -u +%H)
HERTZIFY_DATE_MINUTE := $(shell date -u +%M)
HERTZIFY_BUILD_DATE := $(HERTZIFY_DATE_YEAR)$(HERTZIFY_DATE_MONTH)$(HERTZIFY_DATE_DAY)-$(HERTZIFY_DATE_HOUR)$(HERTZIFY_DATE_MINUTE)
TARGET_PRODUCT_SHORT := $(subst hertzify_,,$(HERTZIFY_BUILD))

# OFFICIAL_DEVICES
ifeq ($(HERTZIFY_BUILD_TYPE), OFFICIAL)
  LIST = $(shell cat vendor/hertzify/config/hertzify.devices)
    ifeq ($(filter $(HERTZIFY_BUILD), $(LIST)), $(HERTZIFY_BUILD))
      IS_OFFICIAL=true
      HERTZIFY_BUILD_TYPE := OFFICIAL
    endif
    ifneq ($(IS_OFFICIAL), true)
      HERTZIFY_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(HERTZIFY_BUILD)")
    endif
endif

HERTZIFY_VERSION := $(HERTZIFY_VERSION)-$(HERTZIFY_BUILD)-$(HERTZIFY_BUILD_DATE)-$(HERTZIFY_BUILD_TYPE)

HERTZIFY_MOD_VERSION :=$(ANDROID_VERSION)-$(HERTZIFY_VERSION)
HERTZIFY_DISPLAY_VERSION := HertzifyOS-$(HERTZIFY_VERSION)
HERTZIFY_DISPLAY_BUILDTYPE := $(HERTZIFY_BUILD_TYPE)
HERTZIFY_FINGERPRINT := HertzifyOS/$(HERTZIFY_MOD_VERSION)/$(TARGET_PRODUCT_SHORT)/$(HERTZIFY_BUILD_DATE)

# HertzifyOS System Version
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.hertzify.version=$(HERTZIFY_DISPLAY_VERSION) \
  ro.hertzify.build.status=$(HERTZIFY_BUILD_TYPE) \
  ro.modversion=$(HERTZIFY_MOD_VERSION) \
  ro.hertzify.build.date=$(HERTZIFY_BUILD_DATE) \
  ro.hertzify.buildtype=$(HERTZIFY_BUILD_TYPE) \
  ro.hertzify.fingerprint=$(HERTZIFY_FINGERPRINT) \
  ro.hertzify.device=$(HERTZIFY_BUILD) \
  org.hertzify.version=$(HERTZIFY_VERSION) \
  ro.hertzify.maintainer=$(HERTZIFY_MAINTAINER)