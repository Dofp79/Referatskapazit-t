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
// Projekt:    IT_Kapa_1.0.0
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
