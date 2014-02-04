#
# design documentation build rules
#
DOCFILES=$(wildcard *.asciidoc)

HTML_TARGETS=$(addsuffix .html, $(basename $(DOCFILES)))

# just use asciidoc defaults right now to get us up and running.
# We'll want to move to a2x to generate the output in future so we can add
# things like table of contents and format directly into pdf, etc.
%.html: %.asciidoc
	@echo "[html] $*"
	$(Q)asciidoc $<

all: html

html: $(HTML_TARGETS)

clean:
	@rm -f *.html
