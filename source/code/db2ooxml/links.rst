Hyperlinks
==========

Automatic link content generation is handled through the standard
``<xref/>``. When its ``linkend`` attribute is set to a known element
such as ``<section/>`` or ``<equation/>``, a link with the appropriate
text is generated. The following code

.. code-block :: xml

   A graphical representation of <xref linkend="gaussian"/> is
   shown in <xref linked="gauss-fig"/>.

might generate a text such as::

    A graphical representation of (8) is shown in Figure 7.

with the appropriate hyperlinks.

