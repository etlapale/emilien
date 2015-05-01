Flowy — A motion field viewer
#############################

Description 
-----------
Flowy provides a motion field viewer for 2D spatial representations.

.. image:: flowy/flowy-1.png
   :scale: 50%

Dowload
-------
You can browse the releases_ web directory to get the latest version.

.. _releases: /data/flowy

Dependencies
------------
The `GTK+`_ library, in its third major version, as well as
its associated `Python bindings <https://live.gnome.org/PyGObject>`__
are required to run the software.

.. _GTK+: http://www.gtk.org

Data formats
------------
Compatible motion arrays are stored as HDF5 datasets containing simple
datasets of integer elements. Several formats are supported, each
allows an optional temporal domain, which must be in the first
dimension if present.

Optical flow
~~~~~~~~~~~~

Shape
  ``[time ×] 2 × height × width``

In the optical flow format, compatible datasets must have three or
four dimensions. The last three dimension respectively represent the
motion vector, the height and the width of the optical flow. The first
dimension should be equal to two, for the X and Y components of the
motion vectors.


Motion field
~~~~~~~~~~~~

Shape
  ``[time ×] vdim × height × width``

In the motion field format, the third to last dimension can be equal
to ``(N*2+1)²``, where ``N`` is an integer, to represent grid
velocities. Otherwise a specific velocity space must be given as
command line parameter, or be present in the dataset attributes.

Direction field
~~~~~~~~~~~~~~~

Shape
  ``[time ×] ndirs × height × width``

In the direction field format, ``ndirs`` directions are assumed to
regularly span the [0°,360°) range, unless a dataset attribute is
present in the HDF5 file.
