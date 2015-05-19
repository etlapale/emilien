Connecting to QProcess::finished
================================
:Date: 2015-05-18

If you are trying to connect a C++11 closure to the finished_ signal
in QProcess_, you will most probably run into the standard error
message on overloaded Qt signals. Trying to compile:

.. code-block:: c++

   connect(some_process, &QProcess::finished,
     [](int,QProcess::ExitStatus){ /* […] */ });

will generate the following error::

  error: no matching function for call to
  ‘[…]::connect(QProcess*&, <unresolved overloaded function type>,
                […]::<lambda(int, QProcess::ExitStatus)>)’

with GCC and::
 
  error: no matching member function for call to 'connect'

with clang. The latter is quite concise but the former clearly shows
the overloading problem with ``unresolved overloaded function``.

Well, `the documentation`_ does not give any hint to an overloaded
signal, but a glance at the headers_ confirms it:

.. code-block:: c++
		
  void finished(int exitCode); // ### Qt 6: merge the two signals […]
  void finished(int exitCode, QProcess::ExitStatus exitStatus);

It seems we might see the problem solved in Qt 6. For the time being
you can solve this problem by making the overloaded member explicit:

.. code-block:: c++

   connect(some_process,
     static_cast<void(QProcess::*)(int,QProcess::ExitStatus)>(&QProcess::finished),
     [](int,QProcess::ExitStatus){ /* […] */ });

But, yes, it’s a tad verbose.
	  
.. _QProcess: http://doc.qt.io/qt-5/qprocess.html
.. _finished: http://doc.qt.io/qt-5/qprocess.html#finished
.. _the documentation: http://doc.qt.io/qt-5/qprocess.html#finished
.. _headers: http://code.qt.io/cgit/qt/qtbase.git/tree/src/corelib/io/qprocess.h#n227
