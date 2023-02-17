==================
Trennungskontrolle
==================

:Authors: - Christian Theune
          - Hanno Schlichting
          - Jens Vagelpohl
          - Veit Schiele
:Date: 2011-08-15

Es ist zu gewährleisten, dass zu unterschiedlichen Zwecken erhobene Daten getrennt verarbeitet werden können.

Virtuelle Maschinen separieren die Verarbeitung der Daten und Speichernetzwerke separieren die persistent gespeicherten Daten.

Darüberhinaus werden Maschinen (virtuelle und physikalische) in zwei getrennten Access-Rings separiert:

- Ein Ring für Infrastrukturaufgaben, die Daten verschiedener Nutzer verarbeitet und zu denen nur Administratoren Zugang erhalten
- En Ring mit den Anwendungen der Nutzer.

  Innerhalb dieses Rings werden alle Ressourcen, die logisch zusammengehören (z.B. VMs, Storages etc.) und die dasselbe Set von Zugängen und Berechtigungen teilen, separiert.

ZEO
===

- Trennung der Anwendungen

  - Verschiedene Anwendungen sollten nicht nur durch verschiedene Mount-Points getrennt werden.

- Trennung der Daten innerhalb einer Anwendung.
