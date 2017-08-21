NAME	= basename
STY     = slide
VIEWER  = qpdfview

all	: $(NAME).pdf

ifeq ($(STY),slide)
%.pdf	: %.md
	pandoc -f markdown+lhs -t beamer+lhs -V theme:Madrid -H slide.tex -o $@ --latex-engine=lualatex $<
else
%.pdf	: %.tex
	platex $(NAME)
	dvipdfmx $(NAME)
endif

clean	:
	-rm *~ *.nav *.out *.snm *.dvi *.aux *.log *.bbl *.blg *.toc *.ptb

view	: $(NAME).pdf
	$(VIEWER) $< &
