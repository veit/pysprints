===============================================
Sicherheit und Datenschutz bei Zope-Anwendungen
===============================================

- Revview der ZMS-Sicherheitslücken
- Review der offenen Zope-Sicherheitslücken

- Empfehlung zur Nuutzung verschiedener Komponenten

  - Passwörter, verschlüsselte Speicherung

    - LDAPUserFolder

  - Cookie-Authentifizierung

  - Betrieb eines ZEO-Clusters

    - ZEO-Server-Login
    - Backup
    - Zugriffscontrolle
    - log von commits per client?

  - Logging

    - Tainted values
    - Passwörter
    - Richtlinien für Entwickler
    - Zentrales Logging 

- Abwägung Verfügbarkeit, SLA/Reaktionszeit, etc.

  - Softeare-Updates
  - Staging-Umgebung
  - Rolling restart

