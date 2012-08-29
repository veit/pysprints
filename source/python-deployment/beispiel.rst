Beispiel
========

Siehe auch `Service Deployment Cheicklist <http://gocept.net/doc/reference/processes/service-deployment-checklist.html>`_

Komponenten
-----------

1 Nginx
  |
1 haproxy
  |
N Django-Anwendung mit gunicorn    cron-jobs
  |                    |           |
1 memcached            PostgreSQL-DB

Empfohlener Zuschnitt
---------------------

- Production

  - 00  Frontend: nginx, haproxy
  - 01  Datenbank: memcache, postgresql
  - 02  cron-jobs
  - 10+ app-server

- Test

  - 00  Frontend: nginx, haproxy
  - 01  Datenbank: memcache, postgresql
  - 02   app-server cron-jobs 

``bin/batou-local``
 für lokales Deployment
``bin/batou-remote``
 für Deployment auf verschiedene Server
``bin/secretsedit``
 zum Bearbeiten der verschlüsselten Zugangsdaten

Voraussetzung von batou ist ein Mercurial-Projekt

`z3c.pypimirror <http://pypi.python.org/pypi/>`_ um zu gewährleisten,
dass exteren Abhängigkeiten auch später noch verfügbar sind.

Das ``manage.py``-Skript von Django nutzt jedoch immer ``/usr/bin/env python``. Wir benötigen jedoch unabhängige Angaben zur Umgebung. Daher erstellen wir eine Datei ``setings_general.py``.

::

    $ hg clone https://bitbucket.org/ctheune/sprintsite sprintsite
    $ cd sprintsite/
    $ python2.7.3 bootstrap.py 
    $ ./bin/buildout
    $ ./bin/batou-local dev-ctheune localhost
    Updating Supervisor > Buildout > File(buildout.cfg) > Content(buildout.cfg)
    Updating Supervisor > Buildout > Bootstrap
    Updating Supervisor > Buildout
    Updating Supervisor
    Updating Django > Buildout > VirtualEnv(2.7)
    Updating Django > Buildout > Bootstrap
    Updating Django > Buildout

