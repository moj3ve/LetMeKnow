include $(THEOS)/makefiles/common.mk

export ARCHS = arm64 arm64e
export TARGET = iphone:clang:12.1.2:12.0

TWEAK_NAME = LetMeKnow
$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_FRAMEWORKS = AudioToolbox
$(TWEAK_NAME)_PRIVATE_FRAMEWORKS = TelephonyUtilities
$(TWEAK_NAME)_CFLAGS = -Wno-deprecated-declarations

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += LetMeKnowPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk
