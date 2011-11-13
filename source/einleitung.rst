==========
Einleitung
==========

Themen
------

#. f.pypi.python.org
  - Dokumentation: PyPI-Mirror installieren
    - gzip-Support
#. Buildout
   #. Buildout auf Python 3
      - Welches ist der aktuelle Branch?
        python-3-2 <http://svn.zope.org/repos/main/zc.buildout/branches/python-3-2/>
      - Roadmap dokumentieren
   #. buildout von distribute und setuptools unabhängig machen
      - Bundling vs. Dependencies vs. forking
        - Dualität auflösen
	- Einfacheres Bootstrapping (leichtere Test- und Wartbarkeit)
      - Review und bewerten des index-Code von distutils2
        - Zukunftsfähigkeit von distutils2?
   # Mirroring-Protokoll für buildout
     - schnellsten Mirror bevorzugen s. distutils2
       - Kann distutils2 den schnellsten Mirror berechnen?
       - Berücksichtigt distutils2 die Systemkonfiguration oder nur Nutzerkonfiguration?
       - Keep alive?
	 - Spart handshake
       - Benchmark tool für Erfolg der Optimierung
	 Install von Plone-Egg von 7:46 (CPU 1:34) reduzieren auf 4:30
       - Tool für Messung mit statischer Konfiguration z.B. nach ``etc/pypirc``.
	 - Sanity check:
	   - gzip?
	   - aktuell?
	   - Antwortzeit für den timestamp?
	   - Schnelligkeit für Download der index-Seite?
    - Bis zu 4 parallele Downloads auf einen Mirror
     - autoconf wenn kein expliziter Mirror konfiguriert ist
       - Einige Mirror parallel antesten (nur timestamp), ersten der reagiert und ausreichend neu ist verwenden, nur wenn kein expliziter Mirror angegeben.
	- Lokales/Maschinen-spezifisches PyPI-Mirror-Konzept
	  - ``/etc/pypirc`` verweist auf ``index=http://foo.example.org/``, als Anforderung in Protokoll dokumentieren
     - Buildout soll gzip unterstützen
     - Parallele Downloads


#. pypi
  gzip-Unterstützung von simple pages

Ausblick
--------
- pypi auf sqlalchemy
- zest.releaser-Dokumentation für Python-Entwickler
  - PGP-Signaturen unterstützen
- Buildout ``site.py`` extrahieren
   s.a. python -S
- Privates Release-Management

