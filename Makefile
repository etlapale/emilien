.PHONY: build rebuild sync

all: build

build: site
	./site build

rebuild: site
	./site rebuild

site: site.hs
	ghc $(.ALLSRC)

sync:
	chmod +x _site/*.html _site/*/*.html
	rsync -avz _site/ ovo:web
