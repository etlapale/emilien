db2ooxml
========
``db2ooxml`` converts DocBook_ articles to Office OpenXML documents,
that is Word 2007 docx files. The main goal is to get a clean Word
document, with simple styling, while supporting numerous DocBook
features such as:

- mathematics, inputted as LaTeX or MathML equations, and converted
  to Office MathML for native integration;
- figures;
- tables;
- numbered elements;
- automatic numbering;
- citations and bibliography support (through bibgen_);
- automatic text for hyperlinks.

The code consists of XSLT stylesheets converting from DocBook_ to
WordML, and a Python wrapper to process them and generate the final
document with embedded media.

Download
--------
`db2ooxml-0.1.tar.xz </data/db2ooxml/db2ooxml-0.1.tar.xz>`_
|
`archives </data/db2ooxml>`_

Usage
-----
You can specify resulting paper size passing ``--paper-size`` to the
``db2ooxml`` script. Select either ``letter`` or one of the ISO page
formats (``a4``, ``a5``, …).

When you specify a single dimension for images, for instance by

.. code:: xml

   <imagedata fileref="figures/model.png" width="4.5in"/>

the other dimension is computed to maintain the aspect ratio (requires PIL).

Equations (including inline equations) can either be typed directly as
MathML or as LaTeX. In the latter case, you must use a
``<mathphrase/>`` with its role set to ``latex`` for ``db2ooxml`` to
convert it first to MathML, then use the XSLT transformation to
OMML. This intermediate step requires latexml_.

Automatic link content generation is handled through the standard
``<xref/>``. When its ``linkend`` attribute is set to a known element
such as ``<section/>`` or ``<equation/>``, a link with the appropriate
text is generated. The following code

.. code:: xml

   A graphical representation of <xref linkend="gaussian"/> is
   shown in <xref linked="gauss-fig"/>.

might generate a text such as::

    A graphical representation of (8) is shown in Figure 7.

with the appropriate hyperlinks.

News
----
2014-09-23      Initial release under the `Apache License 2.0 </data/licenses/APACHE>`_.

.. _DocBook: http://www.docbook.org
.. _bibgen: /code/bibgen
.. _latexml: http://dlmf.nist.gov/LaTeXML/
