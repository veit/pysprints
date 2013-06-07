Erfassung
=========

Statistiken
-----------

- `collectd – The system statistics collection daemon <http://collectd.org/>`_
- `statsD – a network daemon listens for statistics <https://github.com/etsy/statsd/>`_

Events
------

`Scales <https://github.com/Cue/scales>`_
`````````````````````````````````````````

Installation
::::::::::::

::

 $ python2.7 virtualenv scales_env
 $ cd scales_env
 $ ./bin/easy_install scales
 $ ./bin/easy_install flask


Beispiel
::::::::

Ein Beispielskript für scales kann z.B. folgendermaßen aussehen::

 from greplin import scales

 STATS = scales.collection('/web',
             scales.IntStat('errors'),
             scales.IntStat('success'))

 # In a request handler

 STATS.success += 1
 import logging
 logging.basicConfig(level=0)

 import greplin.scales.flaskhandler as statserver
 statserver.serveInBackground(8765, serverName='something-server-42')
 from greplin.scales import graphite
 pusher = graphite.GraphitePeriodicPusher('127.0.0.1', 2003, period=1)
 pusher.allow('*')
 pusher.start()

 import random
 import time
 while True:
     time.sleep(1)
     STATS.success = random.randint(1,10)
     print STATS.success

Das Skript kann anschließend folgendermaßen aufgerufen werden::

 $ ./bin/python scales.py

