SRC := $(wildcard models/*.wsd)
PNG := $(patsubst models/%.wsd,images/%.png,$(SRC))

FORMATS := png

SHELL := /bin/bash

_OUT_FILES := $(foreach FORMAT,$(FORMATS),$(shell echo $(FORMAT) | tr '[:lower:]' '[:upper:]'))
OUT_FILES  := $(foreach F,$(_OUT_FILES),$($F))

all: $(OUT_FILES)

images/%.png: models/%.wsd
	plantuml -tpng -o ../images/ $<

define FORMAT_TASKS
OUT_FILES-$(FORMAT) := $($(shell echo $(FORMAT) | tr '[:lower:]' '[:upper:]'))

open-$(FORMAT):
	open $$(OUT_FILES-$(FORMAT))

clean-$(FORMAT):
	rm -f $$(OUT_FILES-$(FORMAT))

$(FORMAT): clean-$(FORMAT) $$(OUT_FILES-$(FORMAT))

.PHONY: $(FORMAT) clean-$(FORMAT) open-$(FORMAT)

endef

$(foreach FORMAT,$(FORMATS),$(eval $(FORMAT_TASKS)))

clean:
	rm -rf $(OUT_FILES)
