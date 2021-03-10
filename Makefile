SRC := $(wildcard views/*.lutaml)
PNG := $(patsubst views/%.lutaml,images/%.png,$(SRC))

SHELL := /bin/bash

all: $(PNG)

images/%.png: views/%.lutaml
	lutaml -t png -o $@ $<

clean:
	rm -f $(PNG)

.PHONY: clean
