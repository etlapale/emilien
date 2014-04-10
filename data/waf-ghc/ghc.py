# -*- coding: utf-8; -*-

'''
Waf tool for the Glasgow Haskell Compiler.

It allows integration of Haskell code in a classical C/C++ pipeline. For
instance, using the Haskell repa library in a Qt5 application::

  def build (bld):
    bld.program (source    = bld.path.ant_glob ('src/*.cc src/*.hs')
                 target    = myprogram,
                 ghcflags  = ['-O2', '-fllvm', '-optc-O3'],
                 uselib    = 'QT5QUICK REPA',
                 packages  = 'repa')

For now, specifying the packages to be searched for in the configure
is required to get the correct uselibs::

  def configure (conf):
    conf.ghc_pkgs = 'ghc ghc-paths'
    conf.load ('ghc')

.. codeauthor:: Xīcò <xico@atelo.org>
'''

import os
import os.path
from os.path import basename, dirname, splitext

from waflib import Utils
from waflib.Configure import conf
from waflib.Task import Task, update_outputs
from waflib.TaskGen import extension, feature, taskgen_method


def configure (conf):
  conf.find_ghc_binaries ()
  conf.find_ghc_packages ()

@conf
def find_ghc_binaries (self):
  self.find_program ('ghc', var='GHC')
  self.find_program ('ghc-pkg', var='GHCPKG')

@conf
def find_ghc_packages (self):
  # List of packages to be searched for
  if not hasattr (self, 'ghc_pkgs'):
    self.ghc_pkgs = 'base'
  self.ghc_pkgs = Utils.to_list (self.ghc_pkgs)
  # Dump the full package database
  # TODO We somehow need to avoid doing that, takes too much time
  pkgDump = ghcPkgDump (self)
  # Find each package
  for pkg in self.ghc_pkgs:
    # Uselib variable for this GHC package
    uselib = pkg.upper ().replace ('-', '_')
    # Run ghc-pkg to get package information
    pkgfound = addGhcPkg (self, pkg, uselib, pkgDump)
    self.msg ('Checking for %s' % pkg, pkgfound,
              'GREEN' if pkgfound else 'YELLOW')

def addGhcPkg (self, pkg, uselib, dump):
  env = self.env
  # Check if we have a package id
  if pkg in dump:
    pkginfo = dump[pkg]
  # Search for a package by name
  else:
    for info in dump.itervalues ():
      if info['name'] == pkg:
        pkginfo = info
        break
    else:
      return False
  # Link flags, includes and libraries
  env.append_unique ('LINKFLAGS_'+uselib, pkginfo['ld-options'])
  libdirs = pkginfo['library-dirs']
  env.append_unique ('LIBPATH_'+uselib, libdirs)
  includes = pkginfo['include-dirs']
  env.append_unique ('INCLUDES_'+uselib, includes)
  for lib in pkginfo['hs-libraries'].split () \
           + pkginfo['extra-libraries'].split ():
    # TODO Shared libraries require a -ghc-version suffix
    lst = env['LIB_'+uselib]
    if lib in lst:
      lst.remove (lib)
    lst.append (lib)
    env['LIB_'+uselib] = lst
  # Recursively add dependencies
  for dep in pkginfo['depends'].split ():
    if not addGhcPkg (self, dep, uselib, dump):
      return False
  return True

def ghcPkgDump (self):
  '''
  Load the full package database in memory.
  '''
  out = self.cmd_and_log (self.env.GHCPKG + ['dump'])
  dump = {}

  # Parse the ghc-pkg fields (YAML)
  pkginfo = {}
  for line in out.split ('\n'):
    # Package separator, starts a new package
    if line == '---':
      if 'id' in pkginfo:
        dump[pkginfo['id']] = pkginfo
      pkginfo = {}
    # Field continuation
    if line.startswith (' '):
      pkginfo[key] += line
    # Beginning of field
    else:
      pos = line.find (':')
      if pos > 0:
        key = line[:pos]
        if key in pkginfo:
          pkginfo[key] += line[pos+2:]
        else:
          pkginfo[key] = line[pos+2:]
  return dump

class ghc (Task):
  ext_out = ['.h']
  def run (self):
    # Build the command line
    outputdir = self.inputs[0].parent.get_bld ().abspath ()
    cmd = self.env.GHC + self.env.GHCFLAGS \
        + ['-v0', '-outputdir', outputdir, self.inputs[0].abspath ()]
    # Run the command
    ret = self.exec_command (cmd)
    if ret: return ret
    # Rename the object file
    os.rename (self.inputs[0].get_bld ().change_ext ('.o').abspath (),
               self.outputs[0].abspath ())
    return 0

@extension ('.hs')
def hs_hook (self, node):
  def addflags(flags):
    self.env.append_value ('GHCFLAGS', flags)
  # Instantiate a ghc task
  task = self.create_compiled_task ('ghc', node)
  # Standard outputs for object building
  outputs = [node.get_bld ().change_ext ('.hi')]
  # A stub header is generated for FFI
  if 'ffi' in self.features:
    outputs.append (node.get_bld ().change_ext ('_stub.h'))
  task.set_outputs (outputs)
  # Add given flags
  self.ghcflags = Utils.to_list (getattr (self, 'ghcflags', []))
  for flag in self.ghcflags:
    addflags (flag)
  # Add the package flags
  self.packages = Utils.to_list (getattr (self, 'packages', []))
  for pkg in self.packages:
    addflags ('-package')
    addflags (pkg)

@feature ('ffi')
def ghc_ffi (self):
  pass
