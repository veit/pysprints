============================
Aufsetzen eines PyPI-Mirrors
============================

:Authors: - Christian Theune
          - Jan Ulrich Hasecke
          - Martin v. Löwis
          - Thomas Lotze
          - Veit Schiele
:Date: 2011-04-06

Installationsvoraussetzungen
----------------------------

- SQLite mit *headers* und statischen Bibliotheken

  In Debian und ähnlichen Paketverwaltungen wird dies mit dem Paket ``libsqlite3-dev`` installiert.

- bzip2 mit statischen Bibliotheken und *include*-Dateien

  In Debian und ähnlichen Paketverwaltungen wird dies mit dem Paket ``libbz2-dev`` installiert.

- Python2.6 oder größer
- Webserver, z.B. Apache oder nginx

Installation der Skripte
------------------------

::

 easy_install pep381client

Dies installiert im ``bin``-Verzeichnis der Python-Installation die beiden folgenden Skripte:

pep381run
 aktualisiert die Pakete, Signaturen und Simple Pages auf dem Mirror.
processlogs
 erzeugt aus den Log-Dateien des Web-Servers eine tagesbezogene Downloadstatistik der Pakete.

Erstellung des Mirrors
----------------------

In unserem Beispiel wählen wir als Ort im Dateisystem ``/srv/pypi``::

 ./bin/pep381run /srv/pypi

Dies lädt alle Pakete, Signaturen und Simple Pages vom Master-PyPI ``pypi.python.org`` herunter (aktuell sind dies ca. 14 GB).

Aktualisierung des Mirrors
--------------------------

Dies kann als cronjob geschehen, z.B. mit::

 */15 *  *   *   *     /path/pep381client/pep381run -q /srv/pypi

Hiermit werden die Dateien alle 15 Minuten aktualisiert.

``-q``
 führt das Skript ohne Ausgabe aus.

Konfiguration des Web-Servers
-----------------------------

``/srv/pypi/web`` soll nun durch einen Web-Server ausgeliefert werden.

- Apache kann z.B. mit folgender Konfiguration betrieben werden::

   <VirtualHost *:80>
     ServerName mypypi.example.org
     DocumentRoot /srv/pypi/web
     AddOutputFilterByType DEFLATE text/html
   </VirtualHost>

  Der Wert von ``AddOutputFilterByType`` erlaubt dem Apache-Webserver, die Simple Pages komprimiert auszugeben.

- Für nginx kann die Konfiguration z.B. so aussehen::

    server {
        listen *:80;
        server_name mypi.example.org;
        root /srv/pypi/web;
        gzip on;
        gzip_min_length 1100;
    }
