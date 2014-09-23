SRV=ovo:web/neo

.PHONY: publish publish_fragments publish_static

publish: publish_static publish_html publish_fragments

publish_html:
	rsync -avz build/html/ $(SRV)

publish_fragments:
	rsync -avz build/parts $(SRV)

publish_static:
	rsync -avz static/ $(SRV)
