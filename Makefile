# Component settings
COMPONENT := parserutils
COMPONENT_VERSION := 0.0.1
# Default to a static library
COMPONENT_TYPE ?= lib-static

# Setup the tooling
include build/makefiles/Makefile.tools

TESTRUNNER := $(PERL) build/testtools/testrunner.pl

# Toolchain flags
WARNFLAGS := -Wall -Wundef -Wpointer-arith -Wcast-align \
	-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes \
	-Wmissing-declarations -Wnested-externs -Werror -pedantic
ifneq ($(GCCVER),2)
  WARNFLAGS := $(WARNFLAGS) -Wextra
endif

CFLAGS := $(CFLAGS) -D_BSD_SOURCE -I$(CURDIR)/include/ \
	-I$(CURDIR)/src $(WARNFLAGS) 
ifneq ($(GCCVER),2)
  CFLAGS := $(CFLAGS) -std=c99
else
  # __inline__ is a GCCism
  CFLAGS := $(CFLAGS) -Dinline="__inline__"
endif

include build/makefiles/Makefile.top

# Extra installation rules
Is := include/parserutils
I := /include/parserutils$(major-version)/parserutils
INSTALL_ITEMS := $(INSTALL_ITEMS) $(I):$(Is)/errors.h;$(Is)/functypes.h;$(Is)/parserutils.h;$(Is)/types.h

Is := include/parserutils/charset
I := /include/parserutils$(major-version)/parserutils/charset
INSTALL_ITEMS := $(INSTALL_ITEMS) $(I):$(Is)/codec.h;$(Is)/mibenum.h;$(Is)/utf16.h;$(Is)/utf8.h

Is := include/parserutils/input
I := /include/parserutils$(major-version)/parserutils/input
INSTALL_ITEMS := $(INSTALL_ITEMS) $(I):$(Is)/inputstream.h

Is := include/parserutils/utils
I := /include/parserutils$(major-version)/parserutils/utils
INSTALL_ITEMS := $(INSTALL_ITEMS) $(I):$(Is)/buffer.h;$(Is)/stack.h;$(Is)/vector.h

INSTALL_ITEMS := $(INSTALL_ITEMS) /lib/pkgconfig:lib$(COMPONENT).pc.in
INSTALL_ITEMS := $(INSTALL_ITEMS) /lib:$(OUTPUT)
