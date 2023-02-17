========
Buildout
========

#. Buildout auf Python 3
   - Welches ist der aktuelle Branch?
     branch python3.2
     Python3.0 und 3.1 werden ignoriert
     Failed Tests:
   - Roadmap dokumentieren
#. buildout von distribute und setuptools unabhängig machen
   - Bundling vs. Dependencies vs. forking
   - Review und bewerten des index-Code von distutils2
     - Stabilität von distutils2?
     - bootstrapping muss setuptools unterstützen
     - cherry-Picking mit ``site.py``
     - cherry-Picking mit lxml und mathplotlib
     - Bundling distutils2
     - Bootstrapping-Prozess sollte einfacher werden
#.  ``site.py`` in virtuelenv überführen

Bootstraping wird einfacher
- distutils2 hätte den Vorteil, Teil von Python 3.3 zu werden.
- site.py vs. virtuelenv
  - virtuelenv während des Bootstrapping installieren
- site.py vs. virtuelenv
  - virtuelenv während des Bootstrapping installieren
