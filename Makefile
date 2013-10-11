all: html

# The presentation source goes into one file. Name it here.
FILENAME ?= index

# For HTML slideshows, Pandoc supports s5, slidy, slideous, dzslides,
# and revealjs
SLIDESHOW_BACKEND ?= slidy

# For PDF output, Pandoc currently supports only beamer
PDF_BACKEND ?= beamer

# Generate an HTML slideshow from the corresponding .md file, using
# the configured slideshow backend. Use the --standalone and
# --self-contained options for an HTML file that uses data URI and
# thus doesn't require any external resources.
%.html: %.md
	pandoc --standalone --self-contained -f markdown -t $(SLIDESHOW_BACKEND) $< -o $@ 

# Generate an PDF from the corresponding .md file, using Beamer.
%.pdf: %.md
	pandoc -f markdown -t $(PDF_BACKEND) $< -o $@ 

html: $(FILENAME).html

pdf: $(FILENAME).pdf

clean:
	rm -f $(FILENAME).html $(FILENAME).pdf

.PHONY: all html pdf clean