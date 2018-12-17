OS :=$(shell uname)
ifeq ($(OS), Darwin)
	OPEN := open
else
	OPEN := evince
endif

FILE := demo

all:
	make main
	make view
	make clean

main:
	latexmk -pv -xelatex -synctex=1 ${FILE}.tex >/dev/null 2>&1

view:
	${OPEN} ${FILE}.pdf >/dev/null 2>&1 &

clean:
	rm -f *.log *.aux *.dvi *.bbl *.blg *.out *.lof *-inc.eps *.synctex.gz *.toc *.lot *.fdb_latexmk *.fls *Notes.bib *.xdv
