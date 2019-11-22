build: main.tex
	mkdir -p build
	xelatex -shell-escape -output-directory=build main.tex
	TEXMFOUTPUT="out:" bibtex build/main
	xelatex -shell-escape -output-directory=build main.tex
	xelatex -shell-escape -output-directory=build main.tex

clean:
	rm -rf build
