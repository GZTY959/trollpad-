ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:16.0
INSTALL_TARGET_PROCESSES = SpringBoard

THEOS_PACKAGE_SCHEME = rootless # 指定无根越狱模式

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = iPadOSAnimation
iPadOSAnimation_FILES = Tweak.xm TPPrefsObserver.m
iPadOSAnimation_FRAMEWORKS = Foundation UIKit
iPadOSAnimation_PRIVATE_FRAMEWORKS = SpringBoard

include $(THEOS)/makefiles/tweak.mk
​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​
