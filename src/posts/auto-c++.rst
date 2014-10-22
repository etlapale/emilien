C++ support in AUTO
===================
:Date: 2014-08-29
:foobar: 23
:param i2: str

Hereafter you can find a patch
for `AUTO <http://indy.cs.concordia.ca/auto/>`_, adding support for
customized compilation, including C++ linking. The patch has
been tested with ``auto-07p-0.9.1``. You may use the following
commands to untar the original sources and apply the patch to them::

    $ tar xvf auto07p-0.9.1.tar.gz
    $ cd auto
    $ patch -p1 < ../auto-07p-0.9.1-c++_support.patch

Note that you can directly apply the patch to your installed source
code, if necessary, since the modified Python files are not influenced
by the compilation stage.

Once patched, AUTO will recognize model files ending with ``.cc``. You
will also be able to pass a new ``make_vars`` dictionary parameter while
loading the model.  To compile C++ code, you must specify the
associated C++ standard library, such as ``libstdc++`` on GCC, using the
``LDFLAGS`` variable. You will also be able to configure the other AUTO
variables influencing the compilation.

.. code:: python

    mvars = {'CXX':      'g++',
             'CXXFLAGS': '-std=c++1y',
             'OPT':      '-O3 -march=native',
             'LDFLAGS':  '-lstdc++'
            }
    model = load('bif-2d', make_vars=mvars)

The variables ``CC``, ``CXX`` and ``FC`` controls the invoked
compilers, ``FC`` also being used for the linking since AUTO is a
Fortran program, ``OPT``, ``CFLAGS``, ``CXXFLAGS`` and ``FFLAGS``
control the general optimization and language-specific flags.
``LDFLAGS`` are applied to the linking stage.

`Download the patch </data/auto/auto-07p-0.9.1-c++_support.patch>`_
