# 📚 Mini Library Database (SQL Beginner Project)

Ein kleines SQL-Übungsprojekt: eine vereinfachte Bibliotheksverwaltung mit **Autoren**, **Büchern**, **Mitgliedern** und **Ausleihen**. Ideal, um die SQL-Grundlagen zu zeigen: Tabellen erstellen, Beziehungen (1:n und n:m), Abfragen mit `JOIN`, `GROUP BY`, `WHERE`, `UPDATE` und `INSERT`.

## 🗂️ Datenmodell

```
autoren (1) ───< (n) buecher (n) >─── ausleihen ───< (n) mitglieder
```

- **autoren** – Liste der Autor:innen
- **buecher** – Bücher, jeweils einem Autor zugeordnet
- **mitglieder** – Bibliotheksmitglieder
- **ausleihen** – Verknüpfungstabelle: welches Mitglied hat welches Buch wann ausgeliehen

## 📁 Projektstruktur

```
mini-library-sql/
├── README.md
├── library.db            # fertige SQLite-Datenbank (schema + Beispieldaten)
└── sql/
    ├── 01_schema.sql      # Tabellen erstellen
    ├── 02_seed.sql        # Beispieldaten einfügen
    └── 03_queries.sql     # Beispielabfragen (JOIN, GROUP BY, UPDATE, ...)
```

## 🚀 Ausprobieren

Voraussetzung: [SQLite](https://www.sqlite.org/download.html) (auf macOS/Linux meist vorinstalliert).

**Option A – die fertige Datenbank direkt öffnen:**
```bash
sqlite3 library.db
```

**Option B – Datenbank selbst von Grund auf neu erstellen:**
```bash
sqlite3 library.db < sql/01_schema.sql
sqlite3 library.db < sql/02_seed.sql
```

Danach Beispielabfragen ausführen:
```bash
sqlite3 library.db < sql/03_queries.sql
```

Oder interaktiv:
```bash
sqlite3 library.db
sqlite> SELECT * FROM buecher;
```

## 🧠 Was dieses Projekt zeigt

- `CREATE TABLE` mit `PRIMARY KEY` / `FOREIGN KEY`
- 1:n-Beziehung (Autor → Bücher) und n:m-Beziehung über eine Verknüpfungstabelle (Mitglieder ↔ Bücher via Ausleihen)
- `INSERT`, `UPDATE`, `DELETE`
- `JOIN` und `LEFT JOIN`
- `GROUP BY` mit `COUNT()`
- Filtern mit `WHERE`, `IS NULL`

## 💡 Mögliche Erweiterungen

- Spalte für Mahngebühren bei überfälligen Büchern
- View für "aktuell überfällige Ausleihen"
- Kleines Python/Flask-Frontend, das auf die DB zugreift

---
Erstellt als Lern-/Portfolio-Projekt.
