SRV=ovo:web

.PHONY: debug publish

debug:
	rsync -avz --exclude='*.pdf' build/ $(SRV)/neo

publish:
	rsync -avz build/ $(SRV)
