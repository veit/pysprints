==================
Offizieller Mirror
==================

Konfiguration des Web-Servers
-----------------------------

- Apache

  Um ein offizieller PyPI-Mirror zu werden, sollte in der Apache-Konfiguration ``ServerName`` und ``ServerAlias`` folgendermaßen geändert werden::
  
   <VirtualHost 192.0.2.1:80>
     ServerName X.pypi.python.org
     ServerAlias last.pypi.python.org
     CustomLog /var/log/apache2/pypi.log combined
     DocumentRoot /srv/pypi/web
     AddOutputFilterByType DEFLATE text/html
   </VirtualHost>

- Für nginx müsste die Konfiguration  so geändert werden::

   server {
       listen 192.0.2.1:80;
       server_name X.pyypi.python.org;
       root /srv/pypi/web;
       gzip on;
       gzip_min_length 1100;
   } 

Die Werte für ``X`` sind eine Sequenz ``a``, ``b``, ``c`` … wobei ``a.pypi.python.org`` der Master-PyPI ist und die Mirrors mit ``b`` beginnen. 

Der CNAME-Eintrag ``last.pypi.python.org`` verweist auf den letzten Host, der als Mirror hinzugefügt wurde. 

Die Mirrors sollten auf einem Host mit statischer IP-Adresse gebaut werden. Diese IP-Adresse sollte zusammen mit der E-Mail-Adresse auf der `Catalog-SIG`_-Mailingliste mitgeteilt werden. Anschließend wird Ihnen auch ein entsprechender Wert für ``ServerName`` mitgeteilt werden.

.. _`Catalog-SIG`: http://mail.python.org/mailman/listinfo/catalog-sig

Um dem PyPI-Master eine Download-Statistik zurückzuliefern, muss das ``processlog``-Skript regelmäßig aufgerufen werden, als cronjob z.B. mit::

 10 7  *   *   *     /path/pep381client/processlogs /srv/pypi /var/log/apache2/pypi.log{,.1}

Diese Statistik ist bereinigt von den IP-Adressen der Clients, die auf den Mirror zugegriffen haben.

