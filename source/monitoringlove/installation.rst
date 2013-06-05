Installation
============

Scales
------

Installation
~~~~~~~~~~~~

 $ python2.7 virtualenv scales_env
 $ cd scales_env
 $ ./bin/easy_install scales
 $ ./bin/easy_install flask
 $ ./bin/python scales.py

Dabei ist ``scales.py`` ein Beispielskript::

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

Riemann
-------

Installation
~~~~~~~~~~~~

::

 wget http://aphyr.com/riemann/riemann-0.2.1.tar.bz2
 tar xvjf riemann-0.2.1.tar.bz2

Konfiguration
~~~~~~~~~~~~~

::

 $ cd riemann/etc
 $ vim riemann.config

Öffenen des Port 2003 für das graphite-Orotokoll::

 (let [host "127.0.0.1"]
 …
 (graphite-server :host host))

Installation des Riemann-Desktop-Package
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

 $ apt-get install ruby1.9.1-dev
 $ mkdir -p riemann-desktop/gems
 $ cd riemann-desktop
 $ gem install --install-dir ./gems/ riemann-client riemann-tools riemann-dash


