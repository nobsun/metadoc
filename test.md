---
title: Markdown文書からBeamerスライドへ
author: 名無権兵衛
date: \today
---

# 環境

- Ubuntu 18.04
- TeXLive 2018
- Pandoc 2.2.2.1
- grapviz 2.40
- pandoc-filter-graphviz

# Makefile

pandocコマンドは実際は改行なしで一行

　

##

``` makefile
 NAME = test

 all     : $(NAME).pdf

 %.pdf   : %.md Makefile
         pandoc -f markdown \
         -t beamer -V theme:Madrid -H slide.tex \
         -o $@ \
		 --self-containedl \
		 --pdf-engine=lualatex -s $< \
		 --filter=pandoc-filter-graphviz
```

# Graphviz を使う

``` graphviz
digraph sample {
  a -> b;
  a -> c;
}
```

##

``` dot
digraph sample {
  a -> b;
  a -> c;
}
```
