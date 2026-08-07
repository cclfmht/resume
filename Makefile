OUTDIR=build

SOURCE=master/resume.tex
override BASENAME=$(basename $(notdir $(SOURCE)))

OPEN=system backend
override OPEN_PDFS=$(foreach open, $(OPEN), $(OUTDIR)/$(open)/$(BASENAME).pdf)

.PHONY: all system backend open clean

all: system backend

system $(OUTDIR)/system/$(BASENAME).pdf: $(SOURCE)
	@echo 'Building "system" version...'
	latexmk -g -pdf -usepretex="\def\system{}" --outdir="$(OUTDIR)/system" $^ > /dev/null

backend $(OUTDIR)/backend/$(BASENAME).pdf: $(SOURCE)
	@echo 'Building "backend" version...'
	latexmk -g -pdf -usepretex="\def\backend{}" --outdir="$(OUTDIR)/backend" $^ > /dev/null

open: $(OPEN_PDFS)
	$(foreach pdf, $^, open $(pdf);)

clean:
	@-rm -rf $(OUTDIR)
