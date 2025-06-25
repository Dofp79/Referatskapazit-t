Fibonacci_pro_Kapazitätstag = 
DIVIDE (
    SUM ( fact_UserStory[Fibonacci]),
    [Netto_Kapazitätstage]
)
// ---------------------------------------------------------------------
// Dokumentation
// Measure:    StoryPoints_pro_Kapazitätstag
// Typ:        Measure
// Tabelle:    Measure
// Projekt:    IT32_Kapa_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   25.06.2025
// Zweck:      Verhältnis von erledigten Story Points zu eingesetzten Kapazitätstagen
// Beschreibung:
//   - Gibt an, wie viele Story Points (Fibonacci) pro Kapazitätstag abgeschlossen wurden
//   - Basierend auf Story Points je User Story (z. B. aus fact_UserStory)
//   - Nutzt vorhandenes Maß Netto_Kapazitätstage
// Datenschutz:
//   - Keine personenbezogenen Daten verwendet
//   - Vollständig team- und objektbezogen
// ITIL 4 - Prinzipien:
//   - Fokussiere dich auf den Wert
//   - Arbeite iterativ mit Feedback
//   - Optimiere und automatisiere
// ---------------------------------------------------------------------

Geplanter_Kapazitätsbedarf_Tage = 
VAR SP_Summe = SUM ( fact_UserStory[Fibonacci] )
VAR Referenz_SP_pro_Tag = 5  // Achtung: Hier kann dein Referat später anpassen
RETURN
DIVIDE ( SP_Summe, Referenz_SP_pro_Tag )
// ---------------------------------------------------------------------
// Dokumentation
// Measure:    Geplanter_Kapazitätsbedarf_Tage
// Typ:        Measure
// Tabelle:    Measure
// Projekt:    IT32_Kapa_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   25.06.2025
// Zweck:      Ermittlung des Kapazitätsbedarfs auf Basis geschätzter Fibonacci-Punkte
// Beschreibung:
//   - Teilt die geplante Story Point Summe durch die teambezogene Effizienz (SP pro Tag)
//   - Ermöglicht strategische Kapazitätsplanung ohne Personenbezug
// (VAR Referenz_SP_pro_Tag = 5) Was bedeutet das?
// Hier gibst du an, wie effizient dein Team schätzt zu arbeiten:
// z. B. ein Team schafft 5 Fibonacci-Story Points pro Tag.
// Datenschutz:
//   - Keine personenbezogenen Daten enthalten
// ITIL 4 - Prinzipien:
//   - Fokussiere dich auf den Wert
//   - Optimiere und automatisiere
// ---------------------------------------------------------------------

Kapazitätsstunden_je_Story = 
CALCULATE (
    COUNTROWS ( dim_Zeit ),
    FILTER (
        dim_Zeit,
        dim_Zeit[Zeitstempel] >= SELECTEDVALUE(fact_UserStory[Anfang])
        && dim_Zeit[Zeitstempel] <= SELECTEDVALUE(fact_UserStory[Erledigt])
        && dim_Zeit[IstArbeitstag] = TRUE
        && dim_Zeit[Stunde] >= 8
        && dim_Zeit[Stunde] < 17
    )
)
// ---------------------------------------------------------------------
// Dokumentation
// Measure:    Kapazitätsstunden_je_Story
// Typ:        Measure
// Tabelle:    Measure
// Projekt:    IT32_Kapa_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   25.06.2025
// Zweck:      Ermittlung der realen Dauer (Kapazitätsstunden) je User Story
// Beschreibung:
//   - Berechnet netto die benötigte Zeit zwischen Anfang und Erledigt
//   - Berücksichtigt nur Werktage (Mo–Fr), 08:00–17:00
//   - Liefert die tatsächliche Kapazitätsbeanspruchung pro Vorgang
// Datenschutz:
//   - Keine personenbezogenen Spalten oder Auswertungen
// ITIL 4 - Prinzipien:
//   - Beginne dort, wo du stehst
//   - Fokussiere dich auf den Wert
//   - Halte es einfach und praktisch
// ---------------------------------------------------------------------

Kapazitätstage_je_Story = 
DIVIDE ( [Kapazitätsstunden_je_Story], 9 ) 
// ---------------------------------------------------------------------
// Dokumentation
// Measure:    Kapazitätstage_je_Story
// Typ:        Measure
// Tabelle:    Measure
// Projekt:    IT32_Kapa_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   25.06.2025
// Zweck:      Umrechnung der realen Kapazitätsstunden in Arbeitstage (à 9h)
// Beschreibung:
//   - Wandelt die berechneten Stunden in eine Tagesgröße um
//   - Dient der Visualisierung und Steuerung auf Tagesebene
// Datenschutz:
//   - Keine personenbezogenen Inhalte
// ITIL 4 - Prinzipien:
//   - Denk und arbeite ganzheitlich
//   - Optimiere und automatisiere
// ---------------------------------------------------------------------

Netto_Kapazitätsstunden = 
VAR Startzeit = MIN ( fact_UserStory[Anfang] )
VAR Endzeit   = MAX ( fact_UserStory[Erledigt] )

RETURN
CALCULATE (
    COUNTROWS ( dim_Zeit ),
    dim_Zeit[Zeitstempel] >= Startzeit,
    dim_Zeit[Zeitstempel] <= Endzeit,
    dim_Zeit[IstArbeitstag] = TRUE,
    dim_Zeit[Stunde] >= 8,
    dim_Zeit[Stunde] < 17
)
// ---------------------------------------------------------------------
// Dokumentation
// Measure:    Netto_Kapazitätsstunden
// Typ:        Measure
// Tabelle:    Measure
// Projekt:    IT32_Kapa_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   25.06.2025
// Zweck:      Berechnung der Netto-Kapazitätsstunden zwischen Anfang und Erledigt
// Beschreibung:
//   - Zählt verfügbare Kapazitätsstunden im Zeitraum (werktags, 08:00–17:00)
//   - Nutzt zwei aktive Beziehungen:
//       -> fact_UserStory[Anfang] -> dim_Zeit[Zeitstempel]
//       -> fact_UserStory[Erledigt] -> dim_Zeit_Ende[Zeitstempel]
//   - Nutzt dim_Zeit-Tabellen mit stündlicher Granularität
//   - Kein Bezug zu konkreten Personen – vollständig anonymisiert
// Datenschutz:
//   - DSGVO-konform und vom Personalrat freigabefähig
//   - Keine personenbezogenen Daten oder Rückschlüsse möglich
//   - Analyse erfolgt ausschließlich auf Team- und Objektebene
// ITIL 4 - Prinzipien:
//   - Fokussiere dich auf den Wert
//   - Denk und arbeite ganzheitlich
//   - Halte es einfach und praktisch
// ---------------------------------------------------------------------

Netto_Kapazitätstage = 
DIVIDE ( [Netto_Kapazitätsstunden], 9 )
// ---------------------------------------------------------------------
// Dokumentation
// Measure:    Netto_Kapazitätstage
// Typ:        Measure
// Tabelle:    Measure
// Projekt:    IT32_Kapa_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   25.06.2025
// Zweck:      Berechnung verfügbarer Kapazitätstage im Betrachtungszeitraum
// Beschreibung:
//   - Wandelt die Netto-Kapazitätsstunden in standardisierte Tage um (à 9h)
//   - Kein Personenbezug, keine Leistungsverfolgung
//   - Analyse auf Teamebene möglich (z. B. Sprint, Bereich)
// Datenschutz:
//   - Keine personenbezogenen Spalten oder Filter
//   - Vollständig DSGVO- und mitbestimmungskonform
// ITIL 4 - Prinzipien:
//   - Halte es einfach und praktisch
//   - Fokussiere dich auf den Wert
//   - Optimiere und automatisiere
// ---------------------------------------------------------------------
