SRV=ovo:web/neo

.PHONY: publish

publish:
	rsync -avz --exclude=*.pdf build/html/ build/parts static/ $(SRV)
