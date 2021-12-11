# Target iOS 9+ Devices; use the iOS 13.3 SDK
TARGET = iphone:clang:13.7:9.0
SYSROOT = $(THEOS)/sdks/iPhoneOS13.7.sdk
export ARCHS = armv7 arm64 arm64e
THEOS_DEVICE_IP = 172.20.168.112

INSTALL_TARGET_PROCESSES = SpringBoard

FINALPACKAGE = 1
# DEBUG = 1
export ADDITIONAL_CFLAGS = -O3

include $(THEOS)/makefiles/common.mk


TWEAK_NAME = PassBy
PassBy_FILES = Tweak.xm

PassBy_FRAMEWORKS = UIKit
PassBy_PRIVATE_FRAMEWORKS = SpringBoard SpringBoardFoundation BluetoothManager BatteryCenter MobileWiFi

include $(THEOS_MAKE_PATH)/tweak.mk


after-install::
	install.exec "killall -9 SpringBoard"


SUBPROJECTS += passbyprefs
SUBPROJECTS += passbyflipswitch
include $(THEOS_MAKE_PATH)/aggregate.mk
