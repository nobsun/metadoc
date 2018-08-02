NAME	= test
STYL    = slide
BSTY    = Madrid
VIEWER  = qpdfview

all	: $(NAME).pdf

ifeq ($(STYL),slide)
%.pdf	: %.md Makefile slide.tex
	pandoc -f markdown -t beamer -V theme:$(BSTY) -H $(STYL).tex -o $@ --self-contained --pdf-engine=lualatex -s $< --filter=pandoc-filter-graphviz
else
%.pdf	: %.tex
	platex $(NAME)
	dvipdfmx $(NAME)
endif

$(STYL).tex	: $(STYL).pre
	-ln -s $< $@

clean	:
	-rm *~ *.nav *.out *.snm *.dvi *.aux *.log *.bbl *.blg *.toc *.ptb

extra-clean	: clean
	-rm *.pdf

preview	: $(NAME).pdf
	$(VIEWER) $< & disown
