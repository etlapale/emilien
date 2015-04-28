Plstim
######

Plstim is a Qt5_ and OpenGL program to create and run visual
psychophysics experiments.

Plstim allows users to describe experiments using a specific format in
the QML_ language (a JavaScript dialect used by Qt5_), and take care of
visual display, user interaction and data collection.

Experiments are defined as succession of states, or *pages*, during
which animated or static visual stimuli are displayed. Transition
between the pages are triggered by events, such as temporal timers,
eye movements or other inputs.

Experiments also maintain a list of subjects, with their associated
properties, and define the data to be recorded for each subject during
the experiment.

Screenshots
-----------
`Control interface </data/plstim/plstim-gui.png>`_

Download
--------

`plstim-0.1.tar.xz <http://emilien.tlapale.com/data/plstim/plstim-0.1.tar.xz>`_
(2015-04-25) Updated to work with Qt 5.4 on Linux.

`archives <http://emilien.tlapale.com/data/plstim/>`_

`Project website <http://git.atelo.org/etlapale/plstim>`_

.. _Qt5: http://qt.io
.. _QML: http://doc.qt.io/qt-5/qmlapplications.html
