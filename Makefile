.PHONY: build rebuild publish

all: build

build: site
	./site build

rebuild: site
	./site rebuild

site: site.hs
	ghc $<

publish:
	chmod +x _site/*.html _site/*/*.html
	rsync -avz _site/ ovo:web
