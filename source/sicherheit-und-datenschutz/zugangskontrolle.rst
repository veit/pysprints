================
Zugangskontrolle
================

Unbefugten ist die Nutzung von Datenverarbeitungssystemen, mit denen personenbezogene Daten verarbeitet oder genutzt werden, zu verwehren.

Der Zugang zu den Maschinen kann auf verschiedene Weise erfolgen: per SSH, Web-Interface etc. Dabei haben alle Management-Zugänge verschlüsselt zu erfolgen.

Die Nutzer-Identifikation wird ausschließlich über persönliche Nachweise (*Credentials*) durchgeführt sodass Aktionen immer auf eine bestimmte Person zurückgeführt werden können. Geteilte Berechtigungen sind nicht zulässig. 

Nutzer haben ihre Passwörter sicher aufzubewahren, sodass unauthorisierter physikalischer oder logischer Zugang zu Passwort-Speichern (z.B. Home-Verzeichnis des Laptops, Schlüssel- und Passwort-Verwaltungssoftware, Backups, USB-Sticks, Smartphones) nicht zu kompromitierten Passwörtern führen sollte. 

Maschinen können die Anmeldung als root-Nutzer erlauben, die jedoch ausschließlich verwendet werden sollen, falls die reguläre Nutzer-Authentifizierung nicht korrekt funktioniert. Solche Aktionen als root-Nutzer sind zu dokumentieren.

- Alle privilegierten Aktionen sollten sicher protokolliert werden. 
- SSH-Anmeldungen sollten mittels SSH-Keys erfolgen.
- Erfolgreiche SSH-Logins sollten protokolliert werden.

Netzwerk
========

Eine bessere Zugangskontrolle im Netzwerk kann gewährleistet werden durch die Einrichtung verschiedener VLANs, die durch eine Firewall im Gateway getrennt werden. Dabei werden die Netze im Wesentlichen danach unterschieden, wieviel Traffic in ihnen zu erwarten ist.

Frontend-Netzwerk
-----------------

Dieses Netzwerk ist für allgemeine Anfagen gedacht. Die Firewall erlaubt den Zugang zu allen Adressen in diesem Netzwerk.

Dabei sollten Zope-Server nicht in dieses Netzwerk gestellt werden sondern Web-Server wie nginx o.ä., die viel umfassendere Möglichkeiten der Zugangskontrolle gewährleisten, wie z.B. SSL-Termination (s.a. `SSL Server Test`_)

  .. _`SSL Server Test`: https://www.ssllabs.com/ssldb/index.html

Eine Beispielkonfiguration für SSL in der ``nginx.conf`` kann z.B. so aussehen::

 server {
         listen       <IPADDRESS>:443;
         server_name  <CERTIFICATE DOMAIN>;

         ssl                  on;
         ssl_certificate      /etc/ssl/<CERTIFICATE DOMAIN>.crt;
         ssl_certificate_key  /etc/ssl/<CERTIFICATE DOMAIN>.key;

         <remaining virtual host configuration>
 }

.. note::
   - Achten Sie auch darauf, dass der *private key* in ``/etc/ssl/``` nur vom nginx-Nutzer gelesen werden kann.
   - Stellen Sie sicher, dass die Domäne, auf die das Zertifikat ausgestellt wurde, mit dem Host-Namen übereinstimmt. Andernfalls werden Besucher durch ihre Browser gewarnt.

Server-Netzwerk
---------------

Dieses Netzwerk wird zur Kommuikation der Anwendungen untereinander verwendet, z.B. zur Kommunikation der ZEO-Clients mit dem ZEO-Server. Der Zugang zu diesem Netzwerk sollte begrenzt werden auf SSH und bestimmte Web-Services wie z.B. Web-Server-Statistiken.
 
Caching
```````
- Hierbei ist auf Cache-Keys, `Poisoning`_ bzw. Leaking zu achten
- Häufig kann im authentifizierten Zustand auch auf Caching verzichtet werden 

.. _`Poisoning`: http://de.wikipedia.org/wiki/Cache_Poisoning

Load-Balancing
``````````````

`HAProxy`_ bietet sich wegen seiner einfachen Konfigurationsmöglichkeiten als Load-Balancer an. So erlaubt er z.B. einfaches `Throttling`_ und `Sandboxing`_. Eine Beispielkonfiguration kann folgendermaßen aussehen::

 frontend http
     bind 127.0.0.1:8002

     # Botlist
     acl bots hdr_reg(User-Agent) -i AdsBot-Google 
     acl bots hdr_reg(User-Agent) -i Crawler 
     acl bots hdr_reg(User-Agent) -i Googlebot 
     acl bots hdr_reg(User-Agent) -i Java 
     acl bots hdr_reg(User-Agent) -i msnbot 
     acl bots hdr_reg(User-Agent) -i msnbot-media 
     acl bots hdr_reg(User-Agent) -i Seekbot 
     acl bots hdr_reg(User-Agent) -i Slurp 
     acl bots hdr_reg(User-Agent) -i Teoma 
     acl bots hdr_reg(User-Agent) -i WebBot 
     acl bots hdr_reg(User-Agent) -i Yahoo 
     acl bots hdr_reg(User-Agent) -i YahooSeeker 

     # Blocklist
     acl  blocklist hdr_reg(User-Agent) -i autonomy:
     acl  blocklist hdr_reg(User-Agent) -i libwww-perl
     acl  blocklist hdr_reg(User-Agent) -i ^Wget/1.9.1$
     acl  blocklist hdr_reg(User-Agent) -i ^Wget/1.10.2$

     # Whitelist
     acl whitelist hdr_reg(User-Agent) -i ^User-Agent: Mozilla/4.0
     acl whitelist hdr_reg(User-Agent) -i ^Mozilla/4.0
     acl whitelist hdr_reg(User-Agent) -i ^Mozilla/5.0
     acl whitelist hdr_reg(User-Agent) -i ^Opera
     acl whitelist hdr_reg(User-Agent) -i Adobe Flash Player
     acl whitelist hdr_reg(User-Agent) -i ApacheBench
     acl whitelist hdr_reg(User-Agent) -i iPhone
     acl whitelist hdr_reg(User-Agent) -i Shockwave Flash

     # Cookie acl
     acl auth_user hdr_sub(Cookie) -i __ac

     acl URL_STATIC_RESOURCE path_end kss css png js gif jpg image image_hwmedium image_mini

     block if blocklist
     reqisetbe       ^[^\ ]*\ /admin/stats   stats

     use_backend lightweight if URL_STATIC_RESOURCE
     use_backend authors if auth_user
     use_backend bots if bots
     use_backend whitelist if whitelist

     default_backend greylist

 backend lightweight
     server web01    web02.example.net:8080 weight 1 check inter 15s rise 2 fall 1 maxconn 10
     server web02    web03.example.net:8080 weight 1 check inter 15s rise 2 fall 1 maxconn 10

 backend bots
     timeout connect 120000
     timeout server 120000
     server web03    web04.example.net:8080 weight 1 check inter 15s rise 2 fall 1 maxconn 1
     server web04    web05.example.net:8080 weight 1 check inter 15s rise 2 fall 1 maxconn 1

 backend whitelist
     server web05    web06.example.net:8080 weight 1 check inter 15s rise 2 fall 1 maxconn 1
     server web06    web07.example.net:8080 weight 1 check inter 15s rise 2 fall 1 maxconn 1
     server web07    web08.example.net:8080 weight 1 check inter 15s rise 2 fall 1 maxconn 1
     server web08    web09.example.net:8080 weight 1 check inter 15s rise 2 fall 1 maxconn 1

 backend greylist
     server web09    web15.example.net:8080 weight 1 check inter 15s rise 2 fall 1 maxconn 1
     server web10    web16.example.net:8080 weight 1 check inter 15s rise 2 fall 1 maxconn 1

 backend authors
     timeout server 360000
     server web11    web18.example.net:8080 weight 1 check inter 15s rise 2 fall 1 maxconn 1
     server web12    web19.example.net:8080 weight 1 check inter 15s rise 2 fall 1 maxconn 1

.. _`HAProxy`: http://haproxy.1wt.eu/
.. _`Throttling`: http://de.wikipedia.org/wiki/Throttling
.. _`Sandboxing`: http://en.wikipedia.org/wiki/Sandbox_(computer_security)

Zope
````

Zope unterstützt die Anendung bei der Identifizeirung/Authentifizierung der Nutzer mit:

`HTTP-Authentifizierung`_
 Dieses standardisierte Verfahren wird nur noch selten verwendet, da sich die Eingabefelder für Benutzername und Passwort kaum gestalten und nicht einfach in die eigene Webseite einbinden lassen.
Cookie-basierte HTTP-Authentifizierung
 Hierbei sollte folgendes beachtet werden:

 - HttpOnly-Cookies werden von den meisten Browsern unterstützt und beschränkt die Verwendung auf die Übertragung von HTTP- und HTTPS-Requests. 
 - Secure-Cookies werden von Browsern nur verwendet, sofern eine HTTPS-Verbindung zum Web-Server besteht. Damit wird gewährleistet, dass die Cookie-Daten nur verschlüsselt übertragen werden können. 
 
.. _`HTTP-Authentifizierung`: http://de.wikipedia.org/wiki/HTTP-Authentifizierung

Session-Daten
 Sofern zur Authentifizeriung von Sessions ein Hash-Wert aus *userid* und *secret* verwendet wird, bietet dies folgende Vorteile:

 - die Passwörter werden nicht bei jeder Anfrage erneut versendet
 - Es wird nicht bei jeder Anfrage in die ZODB geschrieben
 - Bestehende Authentication-Cookies können invalidiert werden indem das *secret* geändert wird
 - Sofern eine +timeout property* angegeben wurde, sind die Cookies nur für einen bestimmten Zeitraum gültig

 Es gibt jedoch auch zwei Nachteile:

 - Die Authentifizierung bleibt gültig auch wenn sich das Passwort des Nutzers geändert hat. Damit wird es schwierig, einzelne Nutzer auszusperren.
 - Der Web-Browser des Nutzers muss Cookies erlauben.

 Weitere Informationen erhalten Sie in `plone.session`_ 

.. _`plone.session`: http://pypi.python.org/pypi/plone.session

Nutzer-Datenbanken
 Bei der Speicherung der Nutzerdaten, entweder lokal im ACL-Users-Folder, im LDAP-Server etc. ist darauf zu achten, dass nicht die Passwörter selbst sondern nur deren Hash-Werte gespeichert werden.
Externe Anbieter
 Über `OpenID`_, `Shibboleth`_ etc. können externe Anbieter die Authentifizerung von Nutzern übernehmen.

.. _`OpenID`: http://de.wikipedia.org/wiki/Open_ID
.. _`Shibboleth`: http://de.wikipedia.org/wiki/Shibboleth_(Internet)

Speichernetzwerk
----------------

Das Netzwerk wird verwendet für SAN-Traffic und ist nur zugänglich für Storage-Server und *ring 0*-Maschinen, also nicht für virtuelle Maschinen. Das Netzwerk sollte private IPv4-Adressen nutzen und nicht von außen erreichbar sein.
 
Management-Netzwerk
-------------------

Das Netzwerk wird verwendet für den Zugang zu IPMI-Controllern (*Intelligent Platform Management Interface-Controller*), Switches etc. Es verwendet private IPv4-Adressen die von außen nicht erreichbar sind. 

Dateisystem
===========

Dateien im Dateisystem wie Log-Dateien etc. sind durch entsprechende Rechte auf Dateisystemebene zu schützen.

