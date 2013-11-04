.PHONY: all clean check-size
SASSC=sass
SASSC_ARGS=--style compressed
PANDOC=pandoc
PANDOC_ARGS=--css=../styling.css -V lang=en -V highlighting-css= --mathjax \
            --smart --to=html5
TEST_MD=$(wildcard test_md/*.md)
TEST_HTML=$(patsubst test_md/%.md,test_html/%.html,$(TEST_MD))

all: styling.css $(TEST_HTML) check-size

styling.css: styling.sass
	$(SASSC) $(SASSC_ARGS) styling.sass styling.css

check-size: styling.css
	@echo "raw size:    $(shell stat -c%s styling.css) bytes"
	@echo "gziped size:" \
	      "$(shell gzip -c styling.css | wc -c | awk '{print $1;}') bytes"

define TEST_TARGET
$(patsubst test_md/%.md,test_html/%.html,$(1)): $(1)
	@mkdir -p test_html
	$(PANDOC) $(PANDOC_ARGS) $$< -o $$@
endef

$(foreach i,$(TEST_MD),$(eval $(call TEST_TARGET,$(i))))

clean:
	rm -rf styling.css test_html
