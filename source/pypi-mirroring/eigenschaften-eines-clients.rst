===========================
Eigenschaften eines Clients
===========================

:Authors: - Christian Theune
          - Jan Ulrich Hasecke
          - Martin v. Löwis
          - Thomas Lotze
          - Veit Schiele
:Date: 2011-04-06

Motivation
----------

Da PyPI häufig von Clients wie zc.buildout_, setuptools_ oder pip_
verwendet wird, sollten diese das Mirroring-Protokoll PEP381 unterstützen.

.. _zc.buildout: http://pypi.python.org/pypi/zc.buildout
.. _setuptools: http://pypi.python.org/pypi/setuptools
.. _pip: http://pypi.python.org/pypi/pip

Authentizität
-------------

Bei einem verteilten System sollten PyPI-Clients überprüfen können, ob
die gespiegelten Kopien der Pakete authentisch sind. Zudem sollten sie
auf die folgenden Bedrohungen vorbereitet sein:

#. Schädliche Pakete
#. Kompromittierung des Master-Index
#. Kompromittierung der Mirrors
#. Man-in-the-middle-Angriff zwischen Master-Index/Mirrors und PyPI-Clients 
 
Um auf das erste Szenario vorbereitet zu sein, können die Autoren ihr Paket mit
ihrem PGP-Schlüssel signieren, sodass die Nutzer zumindest überprüfen können, ob
das Paket von einem Autor kommt, dem sie vertrauen.

Die PyPI-Clients sollten in der Lage sein, zu überprüfen, ob die Pakete mit dem PGP-Schlüssel des angegebenen Autors signiert sind. 

Authentizität der Mirrors
-------------------------

Für das dritte und vierte Szenario ist den Clients folgendes Vorgehen zum Überprüfen der Pakete empfohlen:

#. Überprüfung der Simple Pages

   #. Herunterladen der Simple Page und Berechnen von deren SHA-1-Hash-Wert
   #. Herunterladen der korrespondierenden /serversig-Datei, die einen mit dem geheimen Schlüssel des Master-Index verschlüsselten Hash-Wert enthält (DSA-Signatur). 
   #. Entschlüsselung des Hashwerts mit dem öffentlichen Schlüssels des Master-Index und Vergleich der beiden Hash-Werte.

#. Überprüfung aller heruntergeladenen Dateien.

   #. Berechnen der MD-5-Hash-Werte aller Dateien, die von einem Mirror heruntergeladen werden.
   #. Vergleich der errechneten MD-5-Hash-Werte mit den Werten in den Simple Pages.

Eine Beispielimplementierung finden Sie in `verify.py`_

.. _`verify.py`: https://svn.python.org/packages/trunk/pypi/tools/verify.py

Diese Überprüfung ist jedoch nicht notwendig, wenn vom Master-PyPI heruntergeladen wird.


.. - Klienten müssen explizite Mirror-Unterstützung haben
    - Mirrors werden über DNS gefunden
    - ``last.pypi.python.org`` gibt den letzten öffentlichen Mirror an.
    - Download-Statistiken
    - Vertrauenswürdigkeit:
      - Ist das Paket auf dem Master wirklich vom Autor (PGP)
      - Stimmt die Signatur auf den Mirrors mit der Signatur auf dem master überein (DSA)
    - simple pages und Dateien werden gespiegelt, nicht die human readable Seiten.
    - Last modified- und local-stats-Dateien müssen ausgeliefert werden.
    - Soll: User agent-PyPI-Clients sollen sich ausweisen.
      - v.a. Mirrors sollen sich ausweisen

    Abgrenzung
    ----------
    - z3c.pypimirror
      - Delta-Protokoll nicht stabil
      - Kann unterbinden, dass Pakete gelöscht werden
      - Kann externe Downloads cachen
    - yopipy
      - Vermittelt zwischen Master und Mirror
    - EggBasket
      - Geeignet auch für private Releases

    Vorteile
    --------

    - Referenzieren auf die Standardimplementierung

