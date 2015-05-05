Usage
=====
:doc:`../db2ooxml` comes with a Python wrapper which generates the final docx
documents. A straightforward invocation such as:

.. code-block:: console

    $ db2ooxml myfile.xml

will convert the DocBook document in ``myfile.xml`` into an OpenOffice
XML document named ``myfile.docx``.

To get a more details on possible invocation options use ``db2ooxml --help``.
The most common options are:

``--force``
  to overwrite an existing ``.docx`` document

``--output``
  to manually specify the destination file

``--paper-size FORMAT``
  to specify a paper size for the document, where ``FORMAT`` is a
  standard document size such as ``A4``, ``A5``, or ``letter``.
