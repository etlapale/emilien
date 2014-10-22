Equations
=========
db2ooxml_ 

Equations (including inline equations) can either be typed directly as
MathML or as LaTeX. In the latter case, you must use a
``<mathphrase/>`` with its role set to ``latex`` for ``db2ooxml`` to
convert it first to MathML, then use the XSLT transformation to
OMML. This intermediate step requires latexml_, which can be extremely slow.

.. _db2ooxml: /code/db2ooxml
.. _latexml: http://dlmf.nist.gov/LaTeXML/
