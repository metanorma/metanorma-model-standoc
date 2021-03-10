SRC := $(wildcard models/*.lutaml)
PNG := $(patsubst models/%.lutaml,images/%.png,$(SRC))

SHELL := /bin/bash

all: $(PNG)

images/%.png: models/%.lutaml
	lutaml -t png -o $@ $<

clean:
	rm -f $(PNG)

.PHONY: clean
