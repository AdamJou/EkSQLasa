
# EkSQLasa

## Opis
Projekt umożliwia przeglądanie tabel ligowych polskiej Ekstraklasy (od sezonu 2010/2011) oraz wykonywanie zapytań SQL na tabelach z danymi z poszczególnych sezonów.

## Wymagania
- Docker
- Docker Compose

## Instalacja i uruchomienie

1. Sklonuj repozytorium:
   ```bash
   git clone https://github.com/AdamJou/EkSQLasa.git
   ```

2. Uruchom Docker Compose:
   ```bash
   docker-compose up --build
   ```

3. Aplikacja będzie dostępna na:
   - [http://localhost:5000/](http://localhost:5000/) — Tabele Ligowe.
   - [http://localhost:5000/query](http://localhost:5000/query) — Zapytania SQL.
     

# Struktura Tabel w Projekcie Ekstraklasa

## Tabela `seasons`
Tabela przechowuje informacje o sezonach rozgrywek.
- `id` (SERIAL PRIMARY KEY): Unikalny identyfikator sezonu.
- `year_start` (INTEGER): Rok rozpoczęcia sezonu.
- `year_end` (INTEGER): Rok zakończenia sezonu.
- `name` (VARCHAR): Nazwa sezonu (np. "PKO BP Ekstraklasa 2023/2024").

## Tabela `teams`
Tabela zawiera listę drużyn uczestniczących w rozgrywkach.
- `id` (SERIAL PRIMARY KEY): Unikalny identyfikator drużyny.
- `name` (VARCHAR): Nazwa drużyny (np. "Legia Warszawa").

## Tabela `season_team_stats`
Tabela przechowuje statystyki drużyn w danym sezonie.
- `id` (SERIAL PRIMARY KEY): Unikalny identyfikator rekordu.
- `season_id` (INTEGER): Identyfikator sezonu (`seasons.id`).
- `team_id` (INTEGER): Identyfikator drużyny (`teams.id`).
- `matches_played` (INTEGER): Liczba rozegranych meczów.
- `wins` (INTEGER): Liczba zwycięstw.
- `draws` (INTEGER): Liczba remisów.
- `losses` (INTEGER): Liczba porażek.
- `goals_for` (INTEGER): Liczba strzelonych bramek.
- `goals_against` (INTEGER): Liczba straconych bramek.
- `goal_difference` (INTEGER): Różnica bramek.
- `points` (INTEGER): Liczba punktów zdobytych przez drużynę.

