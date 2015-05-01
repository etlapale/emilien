Revisions
=========
db2ooxml_ supports revisions and revision flags for <phrase_/>
elements. Those revisions will be displayed as changes in the
generated OpenXML documents, with an optional author and date given by
the matching revision history. To mark certain portions of paragraphs
as modified, insert an inner ``<phrase/>`` element, and set its
revisionflag_ attribute:

.. code:: xml

   <para>… <phrase revisionflag="deleted">of the input
   to the decision process,
   such as MT activity for direction discrimination models
   <citation>Mazurek2003</citation></phrase> …</para>

where ``revisionflag`` can be either ``deleted`` or ``added``.
If you want to specify an author and/or a date for the revision, you
have to insert a revision history in a parent, for instance in the
root <info_/> element:

.. code:: xml

   <article xmlns="http://docbook.org/ns/docbook" version="5.0">
     <info>
       <revhistory>
         <revision>
           <revnumber>10.20</revnumber>
	   <date>2014-10-20</date>
           <authorinitials>É.T.</authorinitials>
          </revision>
          …
        </revhistory>

You can then refer to a specific revision by setting the revision_
attribute of the ``<phrase/>`` element to match the value set in a
corresponding <revnumber_/>.

.. code:: xml

   <para>… <phrase revisionflag="deleted" revision="10.20">of the input

.. _info: http://docbook.org/tdg51/en/html/info.html
.. _phrase: http://docbook.org/tdg51/en/html/phrase.html
.. _revnumber: http://docbook.org/tdg51/en/html/revnumber.html
.. _db2ooxml: /code/db2ooxml
.. _revision: http://www.docbook.org/tdg51/en/html/ref-elements.html#common.attributes
.. _revisionflag: http://www.docbook.org/tdg51/en/html/ref-elements.html#common.attributes
