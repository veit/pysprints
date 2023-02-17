================
Eingabekontrolle
================

:Authors: - Christian Theune
          - Hanno Schlichting
          - Jens Vagelpohl
          - Veit Schiele
:Date: 2011-08-15

Es ist zu gewährleisten, dass nachträglich überprüft und festgestellt werden kann, ob und von wem personenbezogene Daten in Datenverarbeitungssysteme eingegeben, verändert oder entfernt worden sind.

Dies ist üblicherweise von der Anwendung selbst zu gewährleisten. Lediglich in seltenen Ausnahmefällen kann auch für Administratoren zur Aufrechterhaltung des Betriebs und der Performance erforderlich sein, Daten einzugeben, zu verändern oder zu entfernen.

Log-Dateien
  Sofern personenbezogene Daten in Log-Dateien gespeichert werden, sollten diese nach der Log-Retention-Period entfernt sein

Siehe auch: `ttyrec: a tty recorder`_

.. _`ttyrec: a tty recorder`: http://0xcc.net/ttyrec/

Zope
====

Hier bietet Zope bereits einige Hilfestellungen um die Eingabekontrolle gewährleisten zu können:

- Die ZODB speichert bis zum Packen alle Transaktionen ab.

  Auf der Undo-Seite lassen sich zumindest folgende Angaben herauslesen:

  - Den Login-Namen des Ausführenden
  - den physikalischen Pfad des Objekts, das geändert wurde
  - die URL des Objekts,das geändert wurde
  - den Kommentar zu der Transaktion, die von der Anwendung bereitgestellt wird
  - die Uhrzeit der Transaktion

Anwendungen steht es frei, sämtliche in den Transaktionen gespeicherten Imformationen in anderer Form zur Verfügung zu stellen.
