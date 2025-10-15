TARGET := iphone:clang:7.1:7.1

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = floatingDock7Prefs

floatingDock7Prefs_FILES = FD7RootListController.m
floatingDock7Prefs_FRAMEWORKS = UIKit
floatingDock7Prefs_PRIVATE_FRAMEWORKS = Preferences
floatingDock7Prefs_INSTALL_PATH = /Library/PreferenceBundles
floatingDock7Prefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
