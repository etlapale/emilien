Delayed arrays
==============
cuiloa_ 0.3 added support for delayed arrays to avoid allocation of
temporary ones and multiple loops while creating complex array
expressions. A typical delayed expression would look like:

.. code:: c++

  // Delayed operators
  using namespace cuiloa::delayed;
  // Create a regular 2D array
  Array<int,2> a(3000,4000); a.fill(8);
  // Create a regular 1D array
  Array<int,1> b(4000); b.fill(7);
  // Replace a row of the first array
  a[1] = b*b + b;

Intermediate delayed array are created in the last line, making
it somewhat equivalent to ``DelayedArray(DelayedArray(b*b)+b)``. No
actual allocation of a filled array takes place until the call to
``operator=``. Similarly, a single loop is required to process
the full expression, compared to the 3 loops necessary to initialize
each array without delayed ones.

Our delayed arrays are a form of `expression templates`_, with a
flexible evaluation which can include C++11 lambda functions. Thanks
to the compiler optimization, see `Loop merging`_, it is also quite
similar to the map fusion of the Haskell Repa_ library.

Loop merging
------------
A typical compiler will optimize out delayed operations such that a
single loop is generated. For instance with the following code:

.. code:: c++

  Array<double,1> res(1024);
  Array<double,1> b(1024);
  res = b*b + b*b;

can generate the following single assembly loop which includes the
two multiplications, with ``vmulsd``, and the addition, with ``vaddsd``.

.. code:: gas
	  
  402750:   mov    %ebx,%r8d
  402753:   mov    0x18(%rsp),%rdi
  402758:   vmovsd (%rdi,%r8,8),%xmm0
  40275e:   mov    %rsi,%rdi
  402761:   mov    %ebp,%esi
  402763:   mov    0x10(%rsp),%rax
  402768:   vmulsd (%rax,%rsi,8),%xmm0,%xmm0
  40276d:   mov    %ecx,%esi
  40276f:   mov    0x8(%rsp),%rax
  402774:   vmovsd (%rax,%rsi,8),%xmm1
  402779:   mov    %edx,%esi
  40277b:   mov    (%rsp),%rax
  40277f:   vmulsd (%rax,%rsi,8),%xmm1,%xmm1
  402784:   mov    %r14d,%esi
  402787:   vaddsd %xmm1,%xmm0,%xmm0
  40278b:   vmovsd %xmm0,(%rdi,%rsi,8)
  402790:   mov    %rdi,%rsi
  402793:   add    %r11,%r14
  402796:   add    %r9d,%edx
  402799:   add    %r13d,%ecx
  40279c:   add    %r12d,%ebp
  40279f:   add    %r15d,%ebx
  4027a2:   dec    %r10d
  4027a5:   jne    402750 <main+0x320>

where ``%r10`` contains the number of elements in this contiguous
array, and compiled with clang 3.5.

.. _cuiloa: /code/cuiloa
.. _expression templates: http://en.wikipedia.org/wiki/Expression_templates
.. _Repa: http://repa.ouroborus.net
