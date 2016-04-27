Code
====

My public projects are available on Github_, but some of them
are also described here:

Numerics
--------
- `Necomi <http://necomi.atelo.org>`_ A C++ template library for
  multidimensional arrays. It allows easy manipulation of slices,
  shared views, I/O, and provides multiple numerical functions.
- :doc:`posts/auto-c++`
  A small patch for the numerical continuation software AUTO,
  that allows building and linking to C++ code.

Science
-------
- :doc:`plstim/doc/source/index` A Qt5 and OpenGL software to run visual
  psychophysics experiments.

wblanes
~~~~~~~
A western blot image analyzer for
quantification of possibly overlapping bands.

.. image:: images/wblanes-fit.png
   :scale: 33%

:doc:`Documentation <wblanes/doc/source/index>` ·
`Repository <https://git.atelo.org/etlapale/wblanes>`__
	       
Text processing
---------------
- :doc:`bibgen/doc/source/index` A bibliography generator supporting several text
  document formats (including DocBook) and multiple biliography
  databases (such as BibTeX, JSON, or Mendeley).
- :doc:`/code/db2ooxml` DocBook to Office OpenXML (Word 2007 .docx)
  converter with support for equations, bibliographies,
  changes/revisions, figures, and much more.


Development
-----------
- :doc:`code/waf-ghc` Allows compiling with the Glasgow Haskell
  Compiler in waf.

Graphics
--------

InkSyntax
~~~~~~~~~

A source code syntax highlighter plugin for Inkscape.

.. image:: images/inksyntax.png
   :scale: 33%

:doc:`Documentation <inksyntax/doc/source/index>` ·
`Repository <https://git.atelo.org/etlapale/inksyntax>`__
     
- :doc:`code/jessyink2pdf` Converts JessyInk slides to
  PDF with librsvg.


  
Github_
  
.. _Github: https://github.com/etlapale

.. toctree::
   :hidden:

   posts/auto-c++
   plstim/doc/source/index
   wblanes/doc/source/index
   bibgen/doc/source/index
   inksyntax/doc/source/index
   code/db2ooxml
   code/waf-ghc
   code/jessyink2pdf
