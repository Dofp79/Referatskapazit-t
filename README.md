# 🔷 Referatskapazität – Analysemodell für Sprint- & Teamkapazitäten in Power BI

Willkommen im Projekt **Referatskapazität**!  
Dieses Repository beinhaltet ein vollständig dokumentiertes Set von **Power BI Measures (DAX)** zur Analyse von Teamkapazitäten, Durchlaufzeiten und Auslastungen – basierend auf dem ITIL 4-Prinzip „Fokussiere dich auf den Wert“.

---

##  Ziel des Projekts

✔️ Messung der Relation zwischen Story Points und Kapazität   
✔️ Berechnung realer Arbeitstage & Stunden je User Story  
✔️ Berücksichtigung von Zeitstempeln, Arbeitszeiten und Feiertagen  
✔️ DSGVO-konform und teamorientiert – kein Personenbezug

---

##  Measures (DAX)

Die wichtigsten Measures (aus `Measure.ms`):

| Measure                        | Beschreibung |
|-------------------------------|--------------|
| `Fibonacci_pro_Kapazitätstag` | Liefert die durchschnittlichen Story Points je Tag |
| `Geplanter_Kapazitätsbedarf_Tage` | Ermittelt den prognostizierten Bedarf in Tagen |
| `Kapazitätsstunden_je_Story` | Zählt reale Arbeitsstunden pro Story (werktags, 8–17 Uhr) |
| `Kapazitätstage_je_Story`    | Wandelt Stunden in standardisierte 9h-Tage um |
| `Netto_Kapazitätsstunden`    | Gesamtverfügbarkeit im Zeitraum |
| `Netto_Kapazitätstage`       | Netto-Tage aus Netto-Stunden (à 9h) |
| `Measure` (Tabelle)          | Dummy-Tabelle zur Sammlung aller Kennzahlen |

Alle Measures sind ausführlich dokumentiert (Autor, Zweck, ITIL-Bezug, Datenschutz).

---

##  Architektur und Methodik

- Modell basiert auf den Tabellen:
  - `fact_UserStory` mit Spalten wie `Fibonacci`, `Anfang`, `Erledigt`
  - `dim_Zeit` (Zeitdimension mit Stunden & Feiertagen)
- Berechnungen berücksichtigen:
  - Arbeitszeitfenster: 08:00–17:00
  - Werktage (Mo–Fr)
  - Kein Personenbezug – 100 % objektbasiert

---

##  Datenschutz & ITIL 4 Compliance

✔️ Keine personenbezogenen Daten  
✔️ Mitbestimmungskonform & anonym  
✔️ Orientierung an ITIL 4-Prinzipien:
  - Fokussiere dich auf den Wert  
  - Arbeite iterativ mit Feedback  
  - Optimiere und automatisiere  
  - Halte es einfach und praktisch
    
---

##  Visualisierungsideen

-  **Kapazitätsampel** pro Sprint
-  **Bubble Chart**: Story Points vs. Dauer
-  **Gantt-Grafik** der Bearbeitungszeiträume
-  **Teamvergleich** auf Kapazitätstage-Basis

---

## 📫 Kontakt

Fragen oder Feedback?  
**Doniman F. Peña Parra**

- 🌐 [GPT-Link zur Projektunterstützung](https://chatgpt.com/g/g-68150f83fda081919d979c8418039ee5-dashboard-design)  
- 🔗 [LinkedIn](https://www.linkedin.com/in/doniman-francisco-pe%C3%B1a-parra-609263232/)  
- ✉️ [dofp79@hotmail.com](mailto:dofp79@hotmail.com)

---
