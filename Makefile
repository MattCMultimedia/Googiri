# export TARGET=iphone:clang
export THEOS_DEVICE_IP=localhost
export THEOS_DEVICE_PORT=2222
ARCHS = armv7 arm64
include theos/makefiles/common.mk
TARGET := iphone:7.0:2.0

TWEAK_NAME = Googiri
Googiri_FILES = Tweak.xm
Googiri_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += googirisiriactivator
THEOS_BUILD_DIR = debs
SUBPROJECTS += googirisettings
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 backboardd"
