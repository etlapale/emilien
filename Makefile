SRV=ovo:web

.PHONY: debug publish

debug:
	rsync -avz --exclude='*.pdf' build/html/ build/parts static/ $(SRV)/neo

publish:
	rsync -avz build/html/ build/parts static/ $(SRV)

