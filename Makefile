SRV=ovo:web

.PHONY: publish

publish:
	rsync -avz build/html/ build/parts static/ $(SRV)
