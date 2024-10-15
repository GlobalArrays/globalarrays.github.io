GNU_FILES = $(shell find . -name '*.gnu')
PNG_FILES = $(subst gnu,png,$(GNU_FILES))

all: $(PNG_FILES)

$(PNG_FILES): %.png: %.gnu
	gnuplot $<
	convert $(subst gnu,eps,$<) $@
