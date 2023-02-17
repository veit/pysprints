========
Konzepte
========

:Authors: - Christian Theune
          - Jens Vagelpohl
          - Michael Hierweck
          - Stephan Diehl
          - Veit Schiele
:Date: 2012-05-23

.. glossary::

   Metakonfiguration
    Diese Konfiguration definiert **nicht** die Komponenten im Einzelnen
    (Modelling in depth) sondern einen gemeinsamen Service.
   *Modelling in depth*
    Jede Komponente kann mit einem pasenden Werkzeug, z.B. zc.buildout konfiguriert werden.
   Service
    Ein Service setzt sich zusammen aus mehreren Komponenten, die auf verschiedene Hosts verteilt sein können.
   Komponente
    Für Komponenten stehen zumindest folgende Methoden zur Verfügung:

    - Konfigurieren
    - Überprüfen
    - Aktualisieren

Grundideen
----------

Betrieb und Deployment sind anspruchsvolle Aufgaben, die über Erfolg und
Misserfolg eines Projekts mit entscheiden – informiert Euch, erstellt ein
Konzept und lasst Euch beraten.

Python-Webanwendungen haben ein paar Besonderheiten, die man beachten sollte.
Aber: Keine substantielle Python-Webanwendung wird in einer reinen
Python-Umgebung vollständig sein und andere Komponenten wie Webserver,
Datenbanken etc. … benötigen.

Hier sind einige Prinzipien, die dein Leben leichter machen
werden:

* Separation of concerns
* Sparsamkeit
* Infrastruktur/Plattform als Voraussetzung
* Verständlichkeit
* Wiederholbarkeit
* Vorhersagbarkeit
* Debugbarkeit/Testbarkeit/Beobachtbarkeit/Nachvollziehbarkeit
* Robustheit
* Portabilität
* Isolation
* Kompetenz-Zuschnitt und Schnittstellen zwischen: Infrastruktur/Plattform vs. Service-Deployment ala DevOps
* Ziele vor Maßnahmen

h2. Konzeption

  Zeitplan fuer Live-gang

  service-user, keine root-installation

        separates verzeichnis im home fuer den service (um user-dotfiles und
        die service-dateien zu trennen)

  multi-host:
    - absichern, dass gleicher versionsstand benutzt wird

    - kohärenz und kohesion:

      - einzelne teilkomponenten nach gemeinsamkeiten zusammenfassen
      - nach unabhängigkeit trennen um verteilung und skalierung über mehrere
        hosts zu unterstützen

  sla

    -> redundanzkonzepte?

    -> support und bereitschaft

   ressourcenauswahl:

     - io (netz, disk)
     - disk (größe)
     - cpu (anzahl)
     - speicher (größe)

     tendenz: 1 VM = 1 CPU = 1 Dienst, denn das maximiert fuer diesen dienst
     die verfügbare disk, speicher und IO

     kandidaten für mehr cpus: mail-server, postgresql, java im allgemeinen

     kandidaten für viel ram: datenbanken

  performance-anforderungen an dienst

  platznutzung der datenbanken und teilkomponenten?

  reproduzierbarkeit

  entwicklung / testing / production gemeinsam zu behandeln

  auswahl OS-komponenten und eigen-installation:

      OS-Pakete / Komponente

        - schnittstelle os-pakete, individualinstallation

            lxml + libxml, pil

        - welche komponenten betriebssystemweit?

            - ist die komponente breit einsetzbar oder variiert sie (version,
              konfiguration) so stark, dass eine installation/konfiguration auf system-ebene keinen sinn macht?

            - ist die abhaengigkeit zu aenderungen auf betriebssystem-ebene instabil?
              z.b. wie werden notwendige rebuilds behandelt?

            - komponenten, die privilegierte aktionen brauchen (<1024 ports, ...)

        - spezifische komponentenauswahl


    lastverteilung



h2. Technischer Ablauf

  keinen rein python-spezifischen mechanismus, da "everything in python"
  (analog zu "java als plattform") nicht wahr ist

    h3. Software assembly

    - eigener komponenten auf zielmaschinen

    - Gescheites Python / Isolation
        virtualenv --no-site-packages
        "userspace" python?
            -> nope, ist nur 1 sys.path pro (unix-)user

    - tools fuer reproduzierbarkeit bzgl. python: zc.buildout, pip?

    h3. Laufzeitkonfiguration

    - eigener komponenten auf zielmaschinen
    - der betriebssystemweiten komponenten
    - prozesse an/abschalten/reload
    - ordering!
    - geheime konfigurationsparameter auf maschinen abladen
        - passwoerter, ssh-keys, zertifikate
    - tools fuer reproduzierbarkeit bzgl. python: zc.buildout, pip?
    - dienste an/abschalten/neustarten
        - sinnvolle reihenfolge, auch host-uebergreifend
        - rolling restart/update
    - koordinierte deployments um downtime zu minimieren

    h3. Daten-Management

    - datenbanken migrieren
    - caches (bewusst erhalten oder bewusst löschen)
    - koordinierung mit laufzeit-konfiguration?
