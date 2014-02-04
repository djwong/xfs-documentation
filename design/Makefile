#
# design documentation build rules
#
DOCFILES=$(wildcard *.asciidoc)

HTML_TARGETS=$(addsuffix .html, $(basename $(DOCFILES)))
PDF_TARGETS=$(addsuffix .pdf, $(basename $(DOCFILES)))

%.html: %.asciidoc
	@echo "[html] $*"
	$(Q)a2x -f xhtml $<

%.pdf: %.asciidoc
	@echo "[pdf] $*"
	$(Q)a2x -f pdf $<

all: html pdf

html: $(HTML_TARGETS)

pdf: $(PDF_TARGETS)

clean:
	@rm -f *.html *.css
