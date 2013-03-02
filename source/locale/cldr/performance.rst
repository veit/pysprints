Performance
===========

Um einen ersten Eindruck über die zu erwartende Performance zu erhalten, haben
wir einige initiale Performance-Messungen durchgeführt. Dabei wurde die Frage
*»Welches ist der deutsche Name für GB?«* an die folgenden, auf CLDR-
basierenden Bibliotheken gestellt: 

`cldr-Low-Level-API <http://www.pysprints.de/locale/cldr/low-level-api.html>`_
 `timing.py <https://bitbucket.org/loewis/cldr/src/6c176614e5b8/timing.py?at=default>`_::

  python timing.py
  CLDR module
  initial lookup:   0.05714988
  further lookups:  0.00000073

`PyICU <https://pypi.python.org/pypi/PyICU>`_
 `timing-icu.py <https://bitbucket.org/loewis/cldr/src/6c176614e5b84a81417e7c8c5a038b7df1531d06/timing-icu.py?at=default>`_::

  python timing-icu.py
  PyICU
  initial lookup:   0.00950980
  further lookups:  0.00000437

`Babel <http://babel.edgewall.org/>`_
 `timing-babel.py <https://bitbucket.org/loewis/cldr/src/6c176614e5b84a81417e7c8c5a038b7df1531d06/timing-babel.py?at=default>`_::

  python timing-babel.py
  Babel
  initial lookup:   0.11439490
  further lookups:  0.00005031

