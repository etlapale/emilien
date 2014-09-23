bibgen
======

``bibgen`` is a Python script that creates a DocBook bibliography filled
from the ``<citation>`` entries in the document and an external bibliography
database.

The program uses `citeproc-py <https://github.com/brechtm/citeproc-py>`_
to generate citation texts and cooked bibliography entries following
the rules of `CSL <http://citationstyles.org/>`_ stylesheets. Thousands
of CSL stylsheets are already downloadable, for instance through the
`Zotero style repository <https://zotero.org/styles>`_.

Usage
-----

To have ``bibgen`` generate a bibliography, insert one or multiple
``<citation/>`` elements in your document, with text matching the citation
key of your bibliography database. Add a ``<bibliography/>`` node to be
filled. Then run the script to generate a new document containing the
filled bibliography and citation texts::

    $ bibgen --mendeley -o docs-with-bib.xml doc.xml

This will replace citations such as

.. code:: xml

    <citation>Adelson1985</citation>, a motion detector […]
    multi-scale models <citation>Bayerl2004;Tlapale2011</citation>

by

.. code:: xml

    <citation>(<link linkend="bib-adelson1985">Adelson &amp;
    Bergen 1985</link>)</citation>, a motion detector […]
    multi-scale models
    <citation>(<link linkend="bib-bayerl2004">Bayerl &amp;
	Neumann 2004</link>; <link linkend="bib-tlapale2011">Tlapale
	et al. 2011</link>)</citation>

and fill the ``<bibliography/>`` node with cooked ``<bibliomixed/>``
elements.

Mendeley, BibTeX and JSON bibliography databases are supported, though
the BibTeX support in `citeproc-py`_ might be tricky.

Use the ``--help`` command line argument for more options.

Download
--------

`bibgen-0.1.tar.xz </data/bibgen/bibgen-0.1.tar.xz>`_

News
----

2014-09-17      Initial release under the `Apache License 2.0 </data/licenses/APACHE>`_.
