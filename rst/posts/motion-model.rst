---
title: Motion model source code
date: 2014-08-29
---

# Custom requirements

## C++ support in AUTO

For efficiency and integration with numerical software, we provide C++ versions
of our model components. In order to be able to conduct a continuation analysis
of the model, for instance displaying its bifurcations, we propose
a modification of the classical software [AUTO](http://indy.cs.concordia.ca/auto/),
that allows building and linking to C++ code.

[Documentation](../posts/auto-c++.html) |
[Download the patch](../data/auto/auto-07p-0.9.1-c++_support.patch)

## Cuiloa

The C++ code relies on a multidimensional array library to facilitate the
implementation of the model in an efficient manner. This templatized library we
propose relies heavily on the latest C++ standards (C++11 and C++14), requiring
a modern compiler, such as [GCC](http://gcc.gnu.org) or
[clang](http://clang.llvm.org).

[Documentation](../data/cuiloa/html/index.html) |
[Download the tarball](../data/cuiloa/cuiloa-0.2.1.tar.xz)

## Flowy

Although we use standard [HDF5](http://www.hdfgroup.org/HDF5/) files as storage
format, which are easily manipulable in a variety of programming languages, we
provide a standalone visualization tool to generate custom displays of the
multidimensional arrays. This software is a graphical user interface, written
in Python with the [GTK3](http://www.gtk.org) toolkit.

[Documentation](../posts/flowy.html) |
[Download the tarball](../data/flowy/flowy-0.1.0.tar.xz)

# External dependencies

The C++ code requires a C++14 compatible compiler such as
[GCC](http://gcc.gnu.org) or [clang](http://clang.llvm.org).
[CMake](http://www.cmake.org) is used as a build system to search for the
dependencies and generating system specific make files.

The Python code requires recent [Python](http:///www.python.org) 2 and 3
compilers, as well as the [NumPy](http://numpy.scipy.org) and
[SciPy](http://www.scipy.org) libraries. The [IPython](http://www.ipython.org)
shell is also required to load and execute a few notebooks.

The [HDF5](http://www.hdfgroup.org/HDF5/) library is required to load and store
the model motion [data formats](../posts/flowy.html#data-formats "Data format descriptions"). For the C++
code, the official library needs to be compiled with C++ support. For the
Python code, [h5py](http://www.h5py.org) is required.

The [SUNDIALS](http://computation.llnl.gov/casc/sundials "SUite of Nonlinear and DIfferential/ALgebraic equation Solvers") differential
equation solvers are required to run the dynamics of the C++ models.

The graphical interface of [flowy](../posts/flowy.html) requires the
[GTK+](http://www.gtk.org) library, in its third major version, as well as its
associated [Python bindings](https://live.gnome.org/PyGObject) (note that you
cannot use the older `pygtk` bindings).

# Model components

## IPython notebooks

We provide some [IPython notebooks](https://ipython.atelo.org:47836/)
describing a few of the components in our model. Those can be run online.
