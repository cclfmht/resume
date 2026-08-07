default: master/resume.tex
	@echo 'Build "system" version...'
	latexmk -g -pdf -usepretex="\def\system{}" --outdir="system" master/resume.tex > /dev/null
	@echo 'Build "backend" version...'
	latexmk -g -pdf -usepretex="\def\backend{}" --outdir="backend" master/resume.tex > /dev/null

clean:
	@-rm system/*
	@-rm backend/*
