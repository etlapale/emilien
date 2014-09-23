SRV=ovo:web/neo

.PHONY: publish

publish:
	rsync -avz build/html/ build/parts static/ $(SRV)
