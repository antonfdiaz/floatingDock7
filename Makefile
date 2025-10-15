TWEAK_NAME = floatingDock7
floatingDock7_FILES = Tweak.x
floatingDock7_CFLAGS = -fobjc-arc
floatingDock7_FRAMEWORKS = UIKit QuartzCore

TARGET := iphone:clang:7.1:7.1
ARCHS = armv7
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += floatingDock7Prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
