Features
========

:Authors: - Christian Tissmer
          - Felix Schwarz
          - Martin v. Löwis
          - Veit Schiele
:Date: 2013-03-01

- ``cldr`` soll ein High-Level-API für die gebräuchlichsten Anfragen
  bereitstellen. Da es uns jedoch kaum möglich erscheint, **alle** möglichen
  Fälle abzudecken, wollen wir darüber hinaus ein `Low-Level-API
  <http://www.pysprints.de/locale/cldr/low-level-api.html>`_ bereitstellen,
  das den Zugriff auf das **gesamte** `Unicode Common Locale Data Repository
  <http://cldr.unicode.org/>`_ ermöglicht. Das Low-Level-API soll auch zum
  Parsen der LDML-Daten verwendet werden können, wenn sich das High-Level-API  
  als ungenügend erweisen sollte. So wird sich z.B. über das High-Level-API
  nicht die folgende Frage beantworten lassen *»Welches ist die minimale Anzahl
  von Tagen, damit eine Woche als erste Woche im Jahr gezählt wird?«* Das Low-
  Level-API wird sich dennoch verwenden lassen ohne dass die Notwendigkeit
  besteht, die LDML-Daten erneut zu parsen.
   
- Das Python-cldr-Modul wird das eigenständige Aktualisieren und Ändern des
  CLDR-Repository  erlauben. Damit sollen u.a. die folgenden Szenarien
  unterstützt werden:

  - Schnelles Beheben von Fehlern im Repository.

    So ist z.B. in ``/locales/core/common/main/de.xml`` kein Unterschied
    zwischen Name und Abkürzung einer Ära in der deutschen Lokalisierung
    angegeben::

     <eraNames>
         <era type="0">v. Chr.</era>
         <era type="1">n. Chr.</era>
     </eraNames>
     <eraAbbr>
         <era type="0">v. Chr.</era>
         <era type="1">n. Chr.</era>
     </eraAbbr>

    Und in ``colCaseLevel`` werden für die Typen ``yes`` und ``no`` dieselben
    Werte ausgegeben::

     <types>
         …
         <type type="no" key="colCaseLevel" draft="contributed">Nach Groß-/Kleinschreibung sortieren</type>
         …
         <type type="yes" key="colCaseLevel" draft="contributed">Nach Groß-/Kleinschreibung sortieren</type>
         …
     </types>

    Diese Beispiele machen die Notwendigkeit deutlich, solche Fehler ggf.
    schnell beheben zu können.

    Hierfür werden Anwender den Pfad zu den zu verwendenden CLDR-Daten angeben
    können. Somit wird verhindert, dass hierfür das systemweite Python geändert
    werden muss wodurch die Änderungen auch auf restricted Hosts möglich ist.

