SASSC=sass
PANDOC=pandoc
TEST_MD=$(wildcard test_md/*.md)

all: clean compile test

compile:
	$(SASSC) -t compressed styling.sass styling.css

test: compile
	mkdir -p test_html
	$(foreach i,$(TEST_MD),\
		$(PANDOC) $(i) -o $(patsubst test_md/%.md,test_html/%.html,$(i)) \
		          --standalone -t html5 --mathjax -c ../styling.css ;\
	)

clean:
	rm -rf test_html
	rm -f styling.css
