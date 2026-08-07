OUTDIR=build
SOURCE=master/resume.tex

.PHONY: all system backend open clean

all: system backend

system: $(SOURCE)
	@echo 'Building "system" version...'
	latexmk -g -pdf -usepretex="\def\system{}" --outdir="$(OUTDIR)/system" $^ > /dev/null

backend: $(SOURCE)
	@echo 'Building "backend" version...'
	latexmk -g -pdf -usepretex="\def\backend{}" --outdir="$(OUTDIR)/backend" $^ > /dev/null

# Open all rendered PDF files in the output directory
open:
	$(foreach rendered, $(wildcard $(OUTDIR)/*/*.pdf), open $(rendered);)

clean:
	@-rm -rf $(OUTDIR)
