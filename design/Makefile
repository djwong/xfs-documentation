#
# design documentation build rules
#
SUBDIRS=XFS_Filesystem_Structure

# Never blow away subdirs
.PRECIOUS: $(SUBDIRS)
.PHONY: $(SUBDIRS)

DOCFILES=$(wildcard *.asciidoc)

HTML_TARGETS=$(addsuffix .html, $(basename $(DOCFILES)))
PDF_TARGETS=$(addsuffix .pdf, $(basename $(DOCFILES)))

%.html: %.asciidoc
	@echo "[html] $*"
	$(Q)a2x -f xhtml $<

%.pdf: %.asciidoc
	@echo "[pdf] $*"
	$(Q)a2x -f pdf $<

default: html pdf $(SUBDIRS)

$(SUBDIRS):
	@echo "Building $@"
	$(Q)$(MAKE) $(MAKEOPTS) -q -C $@ || $(MAKE) $(MAKEOPTS) -C $@

html: $(HTML_TARGETS)

pdf: $(PDF_TARGETS)

# manually construct build dependencies for target builds so that modification
# of individual files will trigger a rebuild of the document correctly.
$(PDF_TARGETS): $(DOCFILES)

$(HTML_TARGETS): $(DOCFILES)

clean: $(addsuffix -clean, $(SUBDIRS))
	$(Q)rm -f *.html *.pdf *.css

%-clean:
	@echo "Cleaning $*"
	$(Q)$(MAKE) $(MAKEOPTS) -C $* clean
