TEXS := $(wildcard resume*.tex)
PDFS := $(TEXS:.tex=.pdf)

.PHONY: all pdf clean lint test

all: pdf

pdf: $(PDFS)

%.pdf: %.tex resume.sty latexmkrc
	latexmk -pdf -interaction=nonstopmode $<

clean:
	latexmk -C

lint:
	python3 scripts/lint_knowledge.py --strict

test: lint
	@command -v latexmk >/dev/null || { echo "latexmk not installed; install TeX Live and retry"; exit 1; }
	$(MAKE) pdf
