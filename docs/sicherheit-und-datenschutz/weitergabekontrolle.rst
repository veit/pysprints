===================
Weitergabekontrolle
===================

:Authors: - Christian Theune
          - Hanno Schlichting
          - Jens Vagelpohl
          - Veit Schiele
:Date: 2011-08-15

Es ist zu gewährleisten, dass personenbezogene Daten bei der elektronischen Übertragung oder während ihres Transports oder ihrer Speicherung auf Datenträger nicht unbefugt gelesen, kopiert, verändert oder entfernt werden können und dass überprüft und festgestellt werden kann, an welche Stellen eine Übermittlung personenbezogener Daten durch Einrichtungen zur Datenübertragung vorgesehen ist.

Alle personenbezogenen Daten werden ausschließlich in einem authentifizierten und verschlüsselten Kommunikationskanal übertragen. Hierzu gehören auch

- Anwendungsdaten, die von oder zu einem Nutzer per SCP/SFTP transferiert werden.
- Der Transfer von persistenten Daten, die auf einem Storage-Server gespeichert sind, ist zwar aus Performance-Gründen unverschlüsselt, aber Storage- und Application-Server kommunizieren miteinander in einem privaten Netzwerk.
- Sicherungskopien werden zu Backup-Servern über einen verschlüsselten Kanal oder über ein privates Netzwerk übertragen.
- Daten, die zur Laufzeit eines Systems generiert werden, können ebenfalls personenbezogene Daten enthalten, werden nur in Ausnahmefällen transferiert. Werden jedoch z.B. Log-Dateien zu einem zentralen Log-Server übertragen, so hat dies verschlüsselt zu erfolgen.
- Besonders bei Web-Analyse-Werkzeugen ist zu gewährleisten, dass die Datenschutzrichtlinien eingehalten werden, auch wenn die Daten an externe Dienste übertragen werden.

ZEO
===

ZEO-Server
  IP und Port sollen angeben, auf der der ZEO-Server auf Anfragen antworten soll.

Migration der Datenbank, Übertragen eines Snapshots zu lokalen Debugging-Zwecken
 Die zu migrierenden Daten sollten verschlüsselt übertragen und abgelegt werden.

Backup
 Backup-Server sollte in eigenem VLAN stehen, zu dem nur Nutzer mit privilegierten Rechten Zugang haben.

 Off-site Backups sollten entweder verschlüsselt auf ein Medium übertragen werden, das ähnlich geschützt ist wie das Medium, auf dem die ZODB gespeichert ist. Falls nicht, sollte die ZODB vor der Weitergabe verschlüsselt sein.

Zentrales Logging
 Log-retention gewährleistet, dass mitgelogte personenbezogene Daten zumindest nach einer bestimmten Zeit gelöscht werden. Sofern von den Log-Dateien ebenfalls ein Backup erstellt wird, verlängert sich die Speicherung ggf. personenbezogener Daten um die Anzahl der Tage, die diese Backups aufbewahrt werden.
