Bibliographic databases
=======================
Currently, BibTex_, JSON_ and Mendeley_ bibliographic databases are
supported by bibgen_.

Zotero_ support may be added in the future but is impeded by the fact
that Zotero locks its local sqlite database, only allowing cloudy
access to it. This could be bypassed, for instance by setting
toggling ``extensions.zotero.dbLockExclusive`` or by writting yet
another browser plugin to provide the missing API.

- BibTex_
- JSON_
- Mendeley_

.. _bibgen: /code/bibgen
.. _BibTeX: /code/bibgen/bibtex
.. _JSON: /code/bibgen/json
.. _Mendeley: /code/bibgen/mendeley
.. _Zotero: http://www.zotero.org
