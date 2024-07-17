=======================================
Eigenschaften eines offiziellen Mirrors
=======================================

:Authors: - Christian Theune
          - Jan Ulrich Hasecke
          - Martin v. Löwis
          - Thomas Lotze
          - Veit Schiele
:Date: 2011-04-06

:pep:`381` beschreibt die Mirroring-Infrastruktur für den Python Package Index
`PyPI`_.

.. _`PyPI`: http://pypi.python.org/

Motivation
----------

Im PyPI werden mehr als 14.000 Pakete gehostet, wobei Systeme wie `EasyInstall`_ und `zc.buildout`_ PyPI intensiv nutzen.

.. _`EasyInstall`: http://peak.telecommunity.com/DevCenter/EasyInstall
.. _`zc.buildout`: http://pypi.python.org/pypi/zc.buildout

Wird PyPI regelmäßig verwendet, konnte dieser zum *single point of failure* werden. Um eine zuverlässige Infrastruktur für Mirrors bereitstellen zu können, beschreibt die PEP 381

- die Liste der Mirrors und die Registrierung am PyPI
- die Seiten, die ein öffentlicher Mirror bereitstellen sollte; diese Seiten werden vom PyPI verwendet um die Download-Statistiken und das Datum der letzten Aktualisierung zu erhalten.

- wie die Mirrors sich mit dem PyPI synchronisieren können
- welchen Mechanismus PyPI-Clients, wie z.B. EasyInstall oder zc.buildout, beim Ausfall des PyPI oder eines Mirrors verwenden können.

Liste der Mirrors und deren Registrierung
-----------------------------------------

Falls Sie einen offiziellen PypPI-Mirror betreiben wollen, beantragen Sie dies bitte auf der `catalog-SIG`_-Mailingliste. Sofern Ihr Mirror standardkonform ist, wird er manuell in die Liste der `PyPI-Mirrors`_ eingefügt. Einen Überblick über alle offiziellen Mirrors, deren Standort, letzte Aktualisierung und Antwortzeiten erhalten Sie in `PyPI Mirror Status`_.

.. _`catalog-SIG`: http://mail.python.org/mailman/listinfo/catalog-sig
.. _`PyPI-Mirrors`: http://pypi.python.org/mirrors
.. _`PyPI Mirror Status`: http://www.pypi-mirrors.org/

- Dabei folgen die Host-Namen der Form::

   X.pypi.python.org

  Die Werte für ``X`` kommen aus der Abfolge ``a``, ``b``, ``c``, …, ``aa``, ``ab``, … wobei ``a.pypi.python.org`` der Master-Server ist und der erste Mirror mit ``b`` beginnt.

- Ein CNAME-Eintrag für ``last.pypi.python.org`` erzeugt einen Alias für den letzten eingetragenen Mirror.

- Mirror sollten eine feste IP-Adresse haben. Geplante Änderungen in der IP-Adresse sollten auf der `catalog-SIG`_-Mailingliste bekanntgegeben werden.

Statistiken
-----------

PyPI bietet Download-Statistiken in `/stats/`_ an. Diese Statistiken werden täglich vom PyPI neu berechnet unter Einbeziehung aller Statistiken, die von den Mirrors bereitgestellt werden.

.. _`/stats/`: http://a.pypi.python.org/stats/

Authentizität der Mirrors
-------------------------

Bei einem verteilten System wollen PyPI-Clients überprüfen können, ob die
gespiegelten Kopien der Pakete authentisch sind. Dabei beschreibt die
:pep:`381`-Spezifikation, wie die Authentizität des Mirrors überprüft werden
kann. Hierzu wird im Master-Index ein DSA-Schlüssel unter der URL ``/serverkey``
bereitgestellt.

Einmal im Jahr sollen die Schlüssel durch neue ersetzt werden. Die Mirrors müssten die neuen ``/serversig``-Seiten dann erneut abrufen. Aktuell unterstützt der pep381client noch nicht den automatischen Abruf neuer Schlüssel.

Seitenstruktur des Mirrors
--------------------------

`simple`_
 Rest-Version des Package Index, wodurch jede Ressource eine URL erhält, auf die mit HTTP zugegriffen werden kann.

 Hier wird auch auf Pakete verweisen, die nicht im PyPI selbst gehostet werden.

`packages`_
 Paketdistributionen, die im PyPI gehostet werden, sortiert nach Python-Versionen und Anfangsbuchstaben
``serversig``
 Signaturen für die Simple Pages

``last-modified``
 Jeder öffentliche Mirror muss mit ``/last-modified`` eine URL mit einer Textdatei bereitstellen, die das Datum der letzten Aktualisierung in GMT-Zeit im Format `ISO 8601`_ enthält.
``local-stats``
 Jeder Mirror soll die Anzahl der Downloads ausgeben. Diese Angabe wird von PyPI verwendet um die Gesamtzahl aller Downloads anzuzeigen.

 Diese Statistik wird als CSV-Datei mit einer Kopfzeile bereitgestellt. Im Einzelnen werden folgende Felder verwendet:

 package
  Die distutils-ID des Pakets
 filename
  Der Dateiname der heruntergeladenen Datei
 useragent
  Der Client, der das Paket heruntergeladen hat.
 count
  Die Anzahl der Downloads.

 Hier ein Auszug aus einer solchen Datei::

  "package","filename","useragent","count"
  zc.buildout-1.1.1.tar.gz,Python-urllib/2.5 distribute/0.6.10,1
  zc.buildout,zc.buildout-1.1.1.tar.gz,Python-urllib/2.6 distribute/0.6.10,1
  zc.buildout,zc.buildout-1.1.1.tar.gz,setuptools/0.6c11,3
  zc.buildout,zc.buildout-1.1.1.tar.gz,setuptools/0.6c9,2
  …

 Die Zählung beginnt mit dem Tag, an dem der Mirror öffentlich zur Verfügung gestellt wird. Dabei wird für jeden Tag eine neue Datei bereitgestellt, die im bzip2-Format komprimiert wird und nach dem jeweiligen Tag benannt wird, also z.B. ``2011-04-06.bz2`` für den 6. April 2011.

 Diese Dateien werden in einem Ordner ``/local-stats/days/`` bereitgestellt.


.. _`simple`: https://pypi.org/simple/
.. _`packages`: https://pypi.python.org/packages//
.. _`ISO 8601`: https://de.wikipedia.org/wiki/ISO_8601
