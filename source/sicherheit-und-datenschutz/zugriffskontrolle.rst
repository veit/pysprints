=================
Zugriffskontrolle
=================

Es ist zu gewährleisten, dass die zur Benutzung eines Datenverarbeitungssystems Berechtigten ausschließlich auf die ihrer Zugriffsberechtigung unterliegenden Daten zugreifen können und personenbezogene Daten bei der Verarbeitung, Nutzung und nach der Speicherung nicht unbefugt gelesen, kopiert, verändert oder entfernt werden können.

Das Berechtigungskonzept sollte unterscheiden zwischen den Aufgaben zur Instandhaltung der Anwendungen und pivilegierten Aufgaben zur Aktualisierung und Konfiguration des Betriebssystems. 

Sollte ein Anwendungsentwickler zur Lösung eines Problems privilegierten Zugang benötigen, kann dies z.B. in einer Multiuser-Session mit GNU Screen zusammen mit einem Administrator durchgeführt werden. 

Anwendungsentwickler können ggf. mit Ihrem individuellen Zugang zu Service-Nutzer-Zugängen und Datenbank-Administrationszugängen wechseln. Alle Berechtigungen werden explizit und nachvollziehbaar gesetzt. Ein Zugang für eine Gruppe von Personen wird nicht gewährt um eine Nachverfolgbarkeit der Transaktionen gewährleisten zu können.

Weitere Einschränkungen werden von ZEO nicht vorgenommen.
 
ZEO
===

ZEO-Authentifizierung
---------------------

Siehe `plone.recipe.zeoserver: Authentication
<https://pypi.python.org/pypi/plone.recipe.zeoserver#authentication>`_ und `plone.recipe.zope2instance
ZEO authentication <https://pypi.python.org/pypi/plone.recipe.zope2instance#zeo-authentication>`_:

``pack-user``
 Falls der ZEO-Server Authentifizierung verwendet, kann hier der Nutzer eingetragen werden, mit dem
 das ``zeopack``-Skript aufgerufen werden soll.
``pack-password``
 Das Passwort für den ``pack-user``.
``zeo-username``
 ermöglicht ZEO-Authentifizierung
``zeo-password``
 Erforderliches Passwort für ``zeo-username``

- Auf einem Host kann damit das Schreiben in die *falsche* ZODB verhindert werden.
- Die Kommunikation zwischen ZEO-Clients und -Servern sollte in einem separatem Netz erfolgen.

Logs
----

- Logs können personenbezogene Daten enthalten, so enthält z.B. das Trace Log sämtliche Funktionsaufrufe mit Parametern

  Maßnahmen:

  - Weder per Mail sollten entsprechende Log-Einträge verschickt werden oder unverschlüsselt auf Monitoring-Server übertragen werden.
  - Die Ausgabe des Monitoring-Server sollte an bestimmtes Netz gebunden werden.

Zope
====

- Security-Policies sollten nur in Ausnahmefällen in der zope.conf geändert werden.
- Oftmals kann die Rechteänderung über Workflow-Stadien geändert werden. 
- Proxy-Rollen sollten nur in Ausnahmefällen eingesetzt werden
- Normale Nutzer sollten getrennt sein von admin-Accounts
- Niemand sollte im täglichen Betrieb mit Management-Rechten arbeiten. Ggf. sollten für eine Person zwei Accounts eingerichtet werden.
- Admin hat die Aufgabe, die Nutzer und Gruppen den entsprechenden Rollen zuzuweisen. Dabei sollten die Nutzer nur die Rechte erhalten, die auch tatsächlich benötigt werden.

