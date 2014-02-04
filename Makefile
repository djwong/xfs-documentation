ifeq ("$(origin V)", "command line")
  BUILD_VERBOSE = $(V)
endif
ifndef BUILD_VERBOSE
  BUILD_VERBOSE = 0
endif

ifeq ($(BUILD_VERBOSE),1)
  Q =
else
  Q = @
endif

MAKEOPTS = --no-print-directory Q=$(Q)

SUBDIRS = design

# Never blow away subdirs
.PRECIOUS: $(SUBDIRS)
.PHONY: $(SUBDIRS)

$(SUBDIRS):
	@echo "Building $@"
	$(Q)$(MAKE) $(MAKEOPTS) -q -C $@ || $(MAKE) $(MAKEOPTS) -C $@

all: $(SUBDIRS)

clean: $(addsuffix -clean,$(SUBDIRS))

%-clean:
	@echo "Cleaning $*"
	$(Q)$(MAKE) $(MAKEOPTS) -C $* clean

