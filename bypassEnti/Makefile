TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = bypassEnti

bypassEnti_FILES = bypassEnti.m
bypassEnti_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/library.mk
