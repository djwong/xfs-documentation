#
# design documentation build rules
#
TARGET=xfs_performance_tuning

DOCFILES=$(wildcard *.asciidoc) \
	 docinfo.xml

HTML_TARGET=$(addsuffix .html, $(TARGET))
PDF_TARGET=$(addsuffix .pdf, $(TARGET))

default: html pdf

%.html: %.asciidoc
	@echo "[html] $*"
	$(Q)a2x -f xhtml -d book $<

%.pdf: %.asciidoc
	@echo "[pdf] $*"
	$(Q)a2x -f pdf -d book $<

html: $(HTML_TARGET)

pdf: $(PDF_TARGET)

# manually construct build dependencies for target builds so that modification
# of individual files will trigger a rebuild of the document correctly.
$(PDF_TARGET): $(DOCFILES)

$(HTML_TARGET): $(DOCFILES)

clean:
	$(Q)rm -f *.html *.pdf *.css

