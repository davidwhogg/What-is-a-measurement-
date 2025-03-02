all: main.pdf

%.aux: %.tex
	pdflatex $*

%.pdf: %.aux measurement.bib
	bibtex $*
	pdflatex $*
	bash -c " ( grep Rerun $*.log && pdflatex $* ) || echo noRerun "
	bash -c " ( grep Rerun $*.log && pdflatex $* ) || echo noRerun "
