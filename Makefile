ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:16.0
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = iPadOSAnimationTweak
iPadOSAnimationTweak_FILES = Tweak.x
iPadOSAnimationTweak_FRAMEWORKS = UIKit CoreGraphics
iPadOSAnimationTweak_PRIVATE_FRAMEWORKS = SpringBoard SpringBoardFoundation

include $(THEOS)/makefiles/tweak.mk

after-install::
    install.exec "killall -9 SpringBoard"
​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​