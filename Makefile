TWEAK_NAME = statusText
statusText_FILES = Tweak.x
statusText_CFLAGS = -fobjc-arc
statusText_FRAMEWORKS = UIKit QuartzCore

TARGET := iphone:clang:7.1:7.1
ARCHS = armv7
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
