.PHONY: build rebuild

all: rebuild

build: site
	./site build

rebuild: site
	./site rebuild

site: site.hs
	ghc $<

sync:
	chmod +x _site/*.html _site/*/*.html
	rsync -avz _site/ ovo:web
