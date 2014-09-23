waf-ghc
=======
``waf-ghc`` allows compiling directly with the
`Glasgow Haskell Compiler <http://www.haskell.org/ghc/>`_ (GHC)
from the build framework `waf <https://code.google.com/p/waf/>`_,
without having to rely on Cabal. This allows easily integration
with the rest of the toolchain in multi-language projects.

Download
--------
`ghc.py </data/waf-ghc/ghc.py>`_

Install
-------
To use, just copy `ghc.py`_ in your project source directory, and make
it accessible to waf.

.. code:: python
	  
    def options(opt):
        opt.load('ghc', tooldir='share/waf-tools')

You can specify packages to be searched for, in order for their
compiler options to be added to specific use variables.

.. code:: python
	  
    def configure(conf):
      conf.ghc_pkgs = 'repa'
      conf.load('ghc')

Finally, build your objects or program in the familiar way. Make
sure to add the use variables for your Haskell packages, *and*
duplicate that list in the ``packages`` field. The former being used
by the standard linker, the latter by the Haskell compiler to build
the objects.

.. code:: python

    def build(bld):
      bld.program(source   = bld.path.ant_glob('src/*.cc src/*.hs'),
		  target   = myprogram,
		  ghcflags = ['-rtsopts', '-O2'],
		  uselib   = 'QT5QUICK REPA',
		  packages = 'repa')

Yeah, that’s three times the same variables inputted everywhere, so
you could enhance it for sure.

Have fun!

News
----
2014-03-19      Initial release under the `simplified BSD license </data/licenses/BSD>`_.
