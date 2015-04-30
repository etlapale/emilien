cuiloa
======
``cuiloa`` is C++ template library to manage multidimensional
arrays. It allows easy manipulation of arrays including slices, shared
views, I/O, or conversion to and from raw C arrays. It also implements
several algorithms such as multidimensional recursive filters.

.. code:: c++
	  
    // Create a 3D array of `int` elements
    cuiloa::Array<int,3> a(40,50,60);
    // 2D view of size 50×60, sharing the same elements
    auto b = a[1];
    // Blur the 2D image `b`
    deriche(b, 2.0);

``cuiloa`` is released under the `Apache License 2.0`_.

Documentation
-------------

- `Delayed arrays </code/cuiloa/delayed>`_
- `API documentation`_
- `Installation notes`_

Requirements
------------
Standard C++14 compiler and library, for instance through GCC_ or clang_.

Download
--------
`cuiloa-0.2.2.tar.xz </data/cuiloa/cuiloa-0.2.2.tar.xz>`_
(2014-10-01) Added ``Array::any`` and random number generation. HDF5 and
clang 3.5 support fixed.

`archives </data/cuiloa/>`_


.. _Apache License 2.0: /data/licenses/APACHE
.. _API documentation: /data/cuiloa/html
.. _clang: http://clang.llvm.org
.. _GCC: http://gcc.gnu.org
.. _Installation notes: /data/cuiloa/html/install.html
