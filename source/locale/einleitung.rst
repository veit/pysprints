==========
Einleitung
==========

Das `locale <http://docs.python.org/2/library/locale.html>`_-Modul ist ein
häufig missverstandenes Modul in Python. Es ermöglicht den Zugriff auf die
C-locale-Implementierungund und deren Funktionen. 

Dabei wird in C eine programmweite Eigenschaft gesetzt. Dies ermöglicht z.B.,
eine locale zu setzen, die dann von C-Programmen wie `Tk <http://www.tcl.tk/>`_
verwendet werden kann.

Das Python-locale-Modul ist jedoch nicht für häufige Änderungen der locale
geeignet da diese Änderungen sehr teuer sind und häufige Änderungen zu Core
Dumps führen können. Auch würde der Aufruf von ``setlocale()`` in einer
Subroutine immer zu einer einer Änderung des gesamten Programms mit allen
Threads führen. Weitere Informationen zur Verwendung des Python-locale-Modul
erhalten Sie in `22.2.1. Background, details, hints, tips and caveats
<http://docs.python.org/2/library/locale.html#background-details-hints-tips-and-caveats>`_.

Lokalisierung von Mehrbenutzeranwendungen
-----------------------------------------

Um für Mehrbenutzeranwendungen, deren User Interface für verschiedene Nutzer
unterschiedlich lokalisiert werden soll, grundlegende Daten und Funktionen
bereitzustellen, haben wir uns als Datengrundlage für `CLDR
<http://cldr.unicode.org/>`, das *Common Locale Data Repository* entschieden.
 
CLDR ist ein Projekt des Unicode Consortium, das Locale-Daten im XML-Format,
genauer in LDML (Locale Data Markup Language) liefert. Diese Daten werden aktuell
u.a. genutzt von:

- Apple (OS X, iOS, Safari, …)
- Google (Web Search, Chromw, Android, …)
- OpenOffice.org 
- IBM (DB2, Lotus, Websphere, AIX, …)

Dabei liefert CLDR u.a. folgende Übersetzungen:

- Sprachnamen
- Gebiets- und Ländernamen
- Währungen
- Wochentage, Monate, Ären und Tagesabschnitt in voller und abgekürzter Form 
- Zeitzonen und Beispielstädte für bestimmte Zeitzonen
- Kalenderfelder

Darüberhinaus sind in CLDR-Regeln definiert für:

- Formattierung von Zahlen
- Sortierung
- Transliteration (diese basiert häufig auf der BGN/PCGN-Umschrift)

Damit überlappt der Umfang von CLDR zum Teil mit den POSIX-Locales (ISO 15897).

.. note::

   Beginnend mit CLDR v21 werden mit CLDR jedoch nicht mehr auch die Quellen
   des POSIX-Formats ausgeliefert. Für die Generierung der POSIX-Locale werden
   jedoch weiterhin Werkzeuge vom CLDR-Konsortium bereitgestellt um POSIX-
   konforme Locales generieren zu können. Weitere Informationen hierzu erhalten
   Sie in `POSIX Data <http://cldr.unicode.org/index/downloads#POSIX_Data>`_.


