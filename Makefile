SRV=ovo:web

JQUERY_VERSION=2.1.3

.PHONY: build debug deps publish

build: deps
	./mksite.py

deps: static/js/jquery.min.js

static/js/jquery.min.js:
	if [ ! -e $@ ] ; then wget https://code.jquery.com/jquery-$(JQUERY_VERSION).min.js -O $@ ; fi

debug: build
	rsync -avz --exclude='*.pdf' build/ $(SRV)/neo

publish: build
	rsync -avz build/ $(SRV)
