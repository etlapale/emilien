Motion model source code
========================
Custom requirements
-------------------
C++ support in AUTO
~~~~~~~~~~~~~~~~~~~
For efficiency and integration with numerical software, we provide C++
versions of our model components. In order to be able to conduct a
continuation analysis of the model, for instance displaying its
bifurcations, we propose a modification of the classical software
AUTO_ that allows building and linking to C++ code.

`Documentation </posts/auto-c++>`__ |
`Download the patch </data/auto/auto-07p-0.9.1-c++_support.patch>`__

.. _AUTO: http://indy.cs.concordia.ca/auto/),

Cuiloa
~~~~~~
The C++ code relies on a multidimensional array library to facilitate the
implementation of the model in an efficient manner. This templatized library we
propose relies heavily on the latest C++ standards (C++11 and C++14), requiring
a modern compiler, such as GCC_ or clang_.

`Documentation </code/cuiloa>`__ |
`Download the tarball </data/cuiloa/cuiloa-0.2.1.tar.xz>`__

.. _GCC: http://gcc.gnu.org
.. _clang: http://clang.llvm.org

Flowy
~~~~~
Although we use standard HDF5_ files as storage format, which are
easily manipulable in a variety of programming languages, we provide a
standalone visualization tool to generate custom displays of the
multidimensional arrays. This software is a graphical user interface,
written in Python with the `GTK+`_ toolkit.

`Documentation </code/flowy.html>`__ |
`Download the tarball </data/flowy/flowy-0.1.0.tar.xz>`__

.. _GTK+: http://www.gtk.org
.. _HDF5: http://www.hdfgroup.org/HDF5/

External dependencies
---------------------
The C++ code requires a C++14 compatible compiler such as GCC_ or
clang_.  CMake_ is used as a build system to search for the
dependencies and generating system specific make files.

The Python code requires recent Python_ 2 and 3 compilers, as well as
the NumPy_ and SciPy_ libraries. The IPython_ shell is also required
to load and execute a few notebooks.

The HDF5_ library is required to load and store the model motion `data
formats </code/flowy#data-formats>`__.  For the C++ code, the
official library needs to be compiled with C++ support. For the Python
code, h5py_ is required.

The SUNDIALS_ differential equation solvers are required to run the
non-stochastic dynamics of the C++ models.

The graphical interface of flowy_ requires the `GTK+`_ library, in its
third major version, as well as its associated
`Python bindings <https://live.gnome.org/PyGObject>`__ (note that you
cannot use the older ``pygtk`` bindings).

.. _CMake: http://www.cmake.org
.. _flowy: /code/flowy
.. _h5py: http://www.h5py.org
.. _IPython: http://www.ipython.org
.. _NumPy: http://numpy.scipy.org
.. _Python: http:///www.python.org
.. _SciPy: http://www.scipy.org
.. _SUNDIALS: http://computation.llnl.gov/casc/sundials 

Model components
----------------

IPython notebooks
~~~~~~~~~~~~~~~~~
We provide some `IPython notebooks <https://ipython.atelo.org:47836/>`__
describing a few of the components in our model. Those can be run online.

More to be added.
