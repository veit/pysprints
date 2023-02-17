Alternativen
============

:Authors: - Christian Tissmer
          - Felix Schwarz
          - Martin v. Löwis
          - Veit Schiele
:Date: 2013-03-01

`ICU <http://www.icu-project.org>`_
 ICU ist die C++-Referenzimplementierung, die High-Level-Access zu den CLDR-
 Daten ermöglicht. Dabei werden die CLDR-Daten in einer Shared Library
 gespeichert.

 - Pro:

   - weit verbreitete und bewährte Bibliothek
   - effizienter RAM-Verbrauch da das Betriebssystem die ``libicudata.so``
     zwischen den Prozessen teilt.

 - Kontra:

   - stellt nicht die vollständigen CLDR-Daten bereit. So wird z.B. bis ICU 51
     ``orientation`` (``right-to-left``) nicht bereitgestellt.
   - Ändern der Daten ist schwierig da die ein Rebuild von ICU und ggf. auch
     Python erforderlich würde.
   - Ein Wrapper für alle Klassen würde einigen Aufwand bedeuten, zumindest
     wenn das API PEP-8-kompatibel sein soll.

`PyICU <https://pypi.python.org/pypi/PyICU>`_
 übernimmt die Beschränkungen von `ICU <http://site.icu-project.org/>`_.

 Darüberhinaus beschränkt PyICU die Verwendung noch weiter, da nur eine
 Untermenge von ICU implementiert wird und die Methodennamen nicht PEP-8-
 kompatibel sind.

Eigene ICU-Implementierung
 Hierbei sollten ggf. jedoch nur diejenigen Teile implementiert werden, die
 nicht bereits in Python vorhanden sind, also nicht

 - die Unicode-Database
 - reguläre Ausdrücke für Unicode-Strings

 - Pro:

   Erwartet werden

   - geringere Download- und Speichergröße
   - hohe Performance
   - geringer RAM-Verbrauch

 - Kontra:

   - Unvollständige CLDR-Daten
