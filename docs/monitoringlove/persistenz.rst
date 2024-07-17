==========
Persistenz
==========

:Authors: - Christian Theune
          - Jens Vagelpohl
          - Michael Hierweck
          - Veit Schiele
:Date: 2013-07-21

Einen guten Überblick über die verschiedenen Möglichkeiten beim Clustering gibt
der Artikel `Clustering Graphite <http://bitprophet.org/blog/2013/03/07/graphite/>`_.

- Die Riemann-Instanzen leiten die Events an ihren lokalen `carbon-relay
  <http://graphite.readthedocs.org/en/1.0/carbon-daemons.html#carbon-relay-py>`_
  weiter.
- Die carbon-relays nutzen den ``consistent hashing``-Modus über mehrere
  `carbon-cache <http://graphite.readthedocs.org/en/1.0/carbon-daemons.html#carbon-cache-py>`_
  -Backends hinweg.
- Wird für den oder die carbon-relays ``REPLICATION_FACTOR = 2`` gewählt, so
  gewährleistet diese Redundanz, dass keine Daten fehlen, auch wenn eine
  Riemann-Instanz ausfallen sollte.

Installation
============

`carbon <https://pypi.python.org/pypi/carbon>`_ lässt sich einfach in einem
*virtual environment* installieren::

 $ virtualenv carbon
 $ cd carbon
 $ ./bin/activate
 $ pip install carbon

Konfiguration
=============

``carbon.conf``
    Der ``[cache]``-Abschnitt teilt ``carbon-cache.py`` mit, welche Ports und
    Protokolle aktiv sind.

    Der ``[relay]``-Abschnitt definiert Host und Port sowie eine
    ``RELAY_METHOD``.

``storage-schemas.conf``
    Richtlinien für die Aufbewarhung der eingehenden Metriken basierend auf
    regulären Ausdrücken.
