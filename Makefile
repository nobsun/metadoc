NAME	= 01
STYL    = slide
BSTY    = Madrid
VIEWER  = acroread

all	: $(NAME).pdf

ifeq ($(STYL),slide)
%.pdf	: %.md Makefile
	pandoc -f markdown -t beamer -V theme:$(BSTY) -H slide.tex -o $@ --self-contained --latex-engine=lualatex -s $< --filter=pandoc-filter-graphviz
else
%.pdf	: %.tex
	platex $(NAME)
	dvipdfmx $(NAME)
endif

clean	:
	-rm *~ *.nav *.out *.snm *.dvi *.aux *.log *.bbl *.blg *.toc *.ptb *.pdf

preview	: $(NAME).pdf
	$(VIEWER) $< &
