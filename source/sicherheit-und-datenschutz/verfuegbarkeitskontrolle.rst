=======================
Verfügbarkeitskontrolle
=======================

Es ist zu gewährleisten, dass personenbezogene Daten gegen zufällige Zerstörung oder Verlust geschützt sind.

Die Verfügbarkeit der Ressourcen ist im Allgemeinen durch den Betreiber des Rechenzentrums zu gewährleisten. 

Bei der Auswahl der Hardware sollten Standardkomponenten für erhöhte Verfügbarkeit verwendet werden, z.B.:

- RAID-Storages
- Redundante Netzteile
- Ersatzteile
- …

ZEO
===

Snapshot
 Bei den meisten Uptime-Anforderungen genügt es völlig, ggf. mit geringer Downtime aus einem Snapshot des Volume Managers einen ZEO-Server mit dem Backup der ZODB erneut aufzusetzen. Dies umgeht die enormen Aufwände, die für eine Replikation erforderlich wären.
Replikation
 Replikation ist über RelStorage und einer SQL-Datenbank, die Master-Master-Replikation unterstützt, möglich. Damit werden auch die BLOBS repliziert.
 
DRBD/Heartbeat
 Aufwändig aufzusetzen und wegen der Komplexität nur schwer zuverlässig zu betreiben.

Load-Balancing
 Fair balancing sollte zwischen den verschiedenen ZEO-Clients verteilen.

Verfügbarkeitsmessungen
=======================

Messungen sollten durchgeführt werden, mit denen die Verfügbarkeit belegt werden kann.

Backup-Plan
===========

Ein Backup-Plan sollte ggf. die Dienste schnell wieder verfügbar machen.

Disaster-Recovery-Plan
======================

Ein Disaster-Recovery-Plan sollte detailliert Ausfallszenarien, Vorsorgemaßnahmen und Verfügbarkeitsmessungen beschreiben.

Für jedes Szenario sollte angegeben werden

- welche Handlungen zur Prävention geeignet erscheinen?
- welche Handlungen zur Wiederherstellung geeignet erscheinen?
- welche Zeit bis zur Wiederherstellung benötigt wird und groß die maximal zulässige Ausfallzeit (Recovery Time Objective, RTO) sein darf?
- wie hoch der Datenverlust (Recovery Point Objective, RPO), also der Zeitraum zwischen zwei Datensicherungen sein darf?

Szenarien
---------

- Hardware-Fehler

  - Aktive Netzwerkkomponenten
  - VM-Server
  - Storage-Server
  - Server-Rack

- Höhere Gewalt

  - Stromausfall 
  - Unterbrochene Netzwerkverbindung

- Software-Fehler

  - Korruptes Dateisystem
  - Konfigurationsfehler
  - Fehler der Applikation

- Bedienfehler

  - Versehentliches Löschen von Dateien
  - Versehentliches Löschen von Verzeichnissen/Datenbanken

