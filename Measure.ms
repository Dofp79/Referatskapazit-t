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
