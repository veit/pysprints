=========================
PyPI-Entwicklungsumgebung
=========================

:Authors: - Christian Theune
          - Jan Ulrich Hasecke
          - Martin v. Löwis
          - Thomas Lotze
          - Veit Schiele
:Date: 2011-04-06

Um den PyPI weiterzuentwickeln, können Sie die folgende Anleitung verwenden.

Anforderungen
-------------

Folgende Systempakete sollten installiert sein:

- Python2.6 oder größer
- swig
- SQLite mit *headers* und statischen Bibliotheken

  In Debian und ähnlichen Paketverwaltungen wird dies mit dem Paket ``libsqlite3-dev`` installiert.

- bzip2 mit statischen Bibliotheken und *include*-Dateien

  In Debian und ähnlichen Paketverwaltungen wird dies mit dem Paket ``libbz2-dev`` installiert.

Darüberhinaus werden folgende Python-Eggs benötigt:

- ``cElementTree``
- ``zope.interface``
- ``zope.pagetemplate``
- ``zope.tal``
- ``zope.tales``
- ``zope.i18nmessageid``
- ``docutils``
- ``M2Crypto``
- ``distutils2``

Sie können die Pakete einfach installieren mit EasyInstall::

 $ easy_install cElementTree
 $ easy_install zope.interface zope.pagetemplate zope.tal zope.tales zope.i18nmessageid
 $ easy_install docutils M2Crypto distutils2

Installation
------------

#. Erstellen Sie zunächst eine lokale Arbeitskopie vom PyPI::

    $ svn co https://svn.python.org/packages/trunk/ pypi-dev

#. Anschließend sollte die SQLite-Datenbank erstellt und  mit Beispieldaten gefüllt werden::

    $ cd pypi-dev/pypi
    $ python ./tools/mksqlite.py
    $ python ./tools/demodata.py


Konfiguration
-------------

#. Erstellen Sie eine Konfigurationsdatei::

    $ cp config.ini.template config.ini

#. Anschließend können Sie diese Konfigurationsdatei editieren::

    [database]
    driver = sqlite3
    name = packages.db
    user = pypi
    files_dir = /home/veit/pypi-dev/pypi/files
    docs_dir = /home/veit/pypi-dev/pypi/docs

    [webui]
    mailhost = localhost
    adminemail = postmaster@veit-schiele.de
    replyto = postmaster@veit-schiele.de
    url =  http://localhost:8000/pypi
    …

Starten
-------

Sie starten PyPI mit::

 $ python standalone.py

Anschließend können Sie die Website erreichen unter::

 http://localhost:8000/pypi

Zum Weiterlesen
---------------

- `README`_
- `CheeseShopDev`_

.. _`README`: https://svn.python.org/packages/trunk/pypi/README
.. _`CheeseShopDev`: http://wiki.python.org/moin/CheeseShopDev#DevelopmentEnvironmentHints
