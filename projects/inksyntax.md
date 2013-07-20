---
title: InkSyntax – Syntax highlighter plugin for Inkscape
---

InkSyntax is a source code syntax highlighter plugin for
[Inkscape](http://www.inkscape.org). It can call
[pygments](http://www.pygments.org/) or
[highlight](http://www.andre-simon.de/doku/highlight/en/highlight.html) to
parse and colorise the code.

## Download

[inksyntax-0.1.2.tar.xz](../data/inksyntax/inksyntax-0.1.2.tar.xz)
|
[archives](../data/inksyntax)

## Install

To use Inkscape, copy the two extension files, `inksyntax.inx` and
`inksyntax.py` into your Inkscape extensions directory
(`~/.config/inkscape/extensions` on Linux), and (re)start Inkscape. The plugin
should be accessible through the menu in *Extensions*/*Text*/*InkSyntax*.

Some clues in case it does not work:

- Make sure that the `inksyntax.py` file is executable (this was not the case
  in old releases).

- Make sure you have installed the Python library [lxml](http://lxml.de),
  otherwise you will get an error message asking for its installation. The
  package is named `python-lxml` on Debian variants, or `lxml`
  in `easy_install`.

- If you get an error like *RuntimeError: No source highlighter found!*, it
  mean that neither [pygments](http://www.pygments.org/) nor
  [highlight](http://www.andre-simon.de/doku/highlight/en/highlight.html)
  could be found. Packages are named `python-pygments` and `highlight` on
  Debian variants.

## News
`2013-07-19`      InkSyntax 0.1.2 was updated to work with later highlight
versions. InkSyntax is now licensed under the
[simplified BSD license](../data/inksyntax/COPYING), and hosted on
a [new website](http://xico.atelo.org/projects/inksyntax.html).

`2009-09-29`      InkSyntax 0.1.1 adds re-editability and line numbering.
