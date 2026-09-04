-- =============================================
-- Mini Library Database – Beispieldaten
-- =============================================

INSERT INTO autoren (name, land) VALUES
('Hermann Hesse', 'Deutschland'),
('Agatha Christie', 'UK'),
('Haruki Murakami', 'Japan'),
('Isabel Allende', 'Chile');

INSERT INTO buecher (titel, autor_id, erscheinungsjahr, genre, verfuegbar) VALUES
('Der Steppenwolf', 1, 1927, 'Roman', 1),
('Siddhartha', 1, 1922, 'Roman', 1),
('Mord im Orient-Express', 2, 1934, 'Krimi', 1),
('Und dann gabs keines mehr', 2, 1939, 'Krimi', 0),
('Naokos Lächeln', 3, 1987, 'Roman', 1),
('Kafka am Strand', 3, 2002, 'Roman', 1),
('Das Geisterhaus', 4, 1982, 'Roman', 1);

INSERT INTO mitglieder (name, email, eintrittsdatum) VALUES
('Anna Vogel', 'anna.vogel@mail.de', '2023-01-15'),
('Ben Schuster', 'ben.schuster@mail.de', '2023-03-22'),
('Clara Neumann', 'clara.neumann@mail.de', '2024-06-10');

INSERT INTO ausleihen (buch_id, mitglied_id, ausleihdatum, rueckgabedatum) VALUES
(4, 1, '2024-11-01', NULL),          -- noch nicht zurückgegeben
(1, 2, '2024-10-05', '2024-10-20'),  -- bereits zurückgegeben
(3, 3, '2024-12-01', NULL);
