override VERSIONS=system backend tsmc

SOURCE=master/resume.tex
override BASENAME=$(basename $(notdir $(SOURCE)))

OUTDIR=build

OPEN=$(VERSIONS)
override OPEN_PDFS=$(foreach open, $(OPEN), $(OUTDIR)/$(open)/$(BASENAME).pdf)

.PHONY: all open clean versions $(VERSIONS)

all: $(VERSIONS)

# Generate build rules for all versions
override define VERSION_BUILD_RULE
$(1) $(OUTDIR)/$(1)/$(BASENAME).pdf: $(SOURCE)
	@echo 'Building "$(1)" version...'
	latexmk -g -pdf -usepretex="\def\$(1){}" --outdir="$(OUTDIR)/$(1)" $(SOURCE) > /dev/null

endef
$(foreach version, $(VERSIONS), $(eval $(call VERSION_BUILD_RULE,$(version))))

open: $(SOURCE) $(OPEN_PDFS)
	@$(foreach pdf, $(OPEN_PDFS), open $(pdf);)

versions:
	@$(foreach version, $(VERSIONS), echo $(version);)

clean:
	@-rm -rf $(OUTDIR)
