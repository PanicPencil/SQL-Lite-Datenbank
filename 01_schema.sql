-- =============================================
-- Mini Library Database – Schema
-- =============================================

DROP TABLE IF EXISTS ausleihen;
DROP TABLE IF EXISTS buecher;
DROP TABLE IF EXISTS autoren;
DROP TABLE IF EXISTS mitglieder;

-- Autoren
CREATE TABLE autoren (
    id     INTEGER PRIMARY KEY AUTOINCREMENT,
    name   TEXT NOT NULL,
    land   TEXT
);

-- Bücher (gehören zu einem Autor)
CREATE TABLE buecher (
    id                 INTEGER PRIMARY KEY AUTOINCREMENT,
    titel              TEXT NOT NULL,
    autor_id           INTEGER NOT NULL,
    erscheinungsjahr   INTEGER,
    genre              TEXT,
    verfuegbar         BOOLEAN NOT NULL DEFAULT 1,
    FOREIGN KEY (autor_id) REFERENCES autoren(id)
);

-- Mitglieder der Bibliothek
CREATE TABLE mitglieder (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    name         TEXT NOT NULL,
    email        TEXT UNIQUE,
    eintrittsdatum DATE
);

-- Ausleihen: verknüpft Bücher mit Mitgliedern (n:m-Beziehung)
CREATE TABLE ausleihen (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    buch_id       INTEGER NOT NULL,
    mitglied_id   INTEGER NOT NULL,
    ausleihdatum  DATE NOT NULL,
    rueckgabedatum DATE,
    FOREIGN KEY (buch_id) REFERENCES buecher(id),
    FOREIGN KEY (mitglied_id) REFERENCES mitglieder(id)
);
