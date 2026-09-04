-- =============================================
-- Mini Library Database – Beispielabfragen
-- =============================================

-- 1) Alle Bücher mit Autorenname (JOIN)
SELECT b.titel, a.name AS autor, b.erscheinungsjahr
FROM buecher b
JOIN autoren a ON b.autor_id = a.id
ORDER BY b.erscheinungsjahr;

-- 2) Alle aktuell verfügbaren Bücher
SELECT titel, genre
FROM buecher
WHERE verfuegbar = 1;

-- 3) Alle Bücher, die gerade ausgeliehen sind (nicht zurückgegeben)
SELECT b.titel, m.name AS mitglied, au.ausleihdatum
FROM ausleihen au
JOIN buecher b ON au.buch_id = b.id
JOIN mitglieder m ON au.mitglied_id = m.id
WHERE au.rueckgabedatum IS NULL;

-- 4) Anzahl Bücher pro Autor (GROUP BY)
SELECT a.name AS autor, COUNT(*) AS anzahl_buecher
FROM buecher b
JOIN autoren a ON b.autor_id = a.id
GROUP BY a.name
ORDER BY anzahl_buecher DESC;

-- 5) Bücher nach Genre gruppieren
SELECT genre, COUNT(*) AS anzahl
FROM buecher
GROUP BY genre;

-- 6) Mitglieder, die noch nie ein Buch ausgeliehen haben (LEFT JOIN)
SELECT m.name
FROM mitglieder m
LEFT JOIN ausleihen au ON m.id = au.mitglied_id
WHERE au.id IS NULL;

-- 7) Ein Buch als zurückgegeben markieren (UPDATE)
UPDATE ausleihen
SET rueckgabedatum = DATE('now')
WHERE id = 1;

UPDATE buecher
SET verfuegbar = 1
WHERE id = (SELECT buch_id FROM ausleihen WHERE id = 1);

-- 8) Neues Buch hinzufügen (INSERT)
INSERT INTO buecher (titel, autor_id, erscheinungsjahr, genre, verfuegbar)
VALUES ('Neues Buch', 1, 2024, 'Roman', 1);

-- 9) Ein Buch löschen (DELETE)
-- DELETE FROM buecher WHERE id = 8;
