LOCAL_DIR := $(GET_LOCAL_DIR)

ARCH    := arm
# Cann't use cortex-a5 as its not supported by gcc 4.4.0
ARM_CPU := cortex-a8
CPU     := generic

DEFINES += ARM_CPU_CORE_A5

MMC_SLOT := 3
DEFINES += WITH_CPU_EARLY_INIT=1 MMC_SLOT=$(MMC_SLOT)

INCLUDES += -I$(LOCAL_DIR)/include

MODULES += dev/fbcon

OBJS += \
	$(LOCAL_DIR)/arch_init.o \
	$(LOCAL_DIR)/platform.o \
	$(LOCAL_DIR)/interrupts.o \
	$(LOCAL_DIR)/gpio.o \
	$(LOCAL_DIR)/acpuclock.o

LINKER_SCRIPT += $(BUILDDIR)/system-onesegment.ld

include platform/msm_shared/rules.mk

