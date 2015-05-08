Code
====

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
- `plstim <http://plstim.atelo.org>`_ A Qt5 and OpenGL software to run visual
  psychophysics experiments.
  
Text processing
---------------
- :doc:`code/bibgen` A bibliography generator supporting several text
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
- :doc:`code/inksyntax` A source code syntax highlighter
  plugin for Inkscape.
- :doc:`code/jessyink2pdf` Converts JessyInk slides to
  PDF librsvg.

Those projects, and some others, can be found on the associated `Gitlab
instance`_.

.. _Gitlab instance: https://git.atelo.org/u/etlapale

.. toctree::
   :hidden:

   posts/auto-c++
   code/bibgen
   code/db2ooxml
   code/waf-ghc
   code/inksyntax
   code/jessyink2pdf
