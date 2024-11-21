
-- Tabele bazowe
CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    year_start INTEGER NOT NULL,
    year_end INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE season_team_stats (
    id SERIAL PRIMARY KEY,
    season_id INTEGER NOT NULL REFERENCES seasons(id) ON DELETE CASCADE,
    team_id INTEGER NOT NULL REFERENCES teams(id) ON DELETE CASCADE,
    matches_played INTEGER NOT NULL,
    wins INTEGER NOT NULL,
    draws INTEGER NOT NULL,
    losses INTEGER NOT NULL,
    goals_for INTEGER NOT NULL,
    goals_against INTEGER NOT NULL,
    goal_difference INTEGER NOT NULL,
    points INTEGER NOT NULL
);

-- Wprowadzenie sezonów
INSERT INTO seasons (year_start, year_end, name)
VALUES
    (2023, 2024, 'PKO BP Ekstraklasa 2023/2024'),
    (2022, 2023, 'PKO BP Ekstraklasa 2022/2023'),
    (2021, 2022, 'PKO BP Ekstraklasa 2021/2022'),
    (2020, 2021, 'PKO BP Ekstraklasa 2020/2021'),
    (2019, 2020, 'Ekstraklasa 2019/2020'),
    (2018, 2019, 'LOTTO Ekstraklasa 2018/2019'),
    (2017, 2018, 'LOTTO Ekstraklasa 2017/2018'),
    (2016, 2017, 'LOTTO Ekstraklasa 2016/2017'),
    (2015, 2016, 'Ekstraklasa 2015/2016'),
    (2014, 2015, 'Ekstraklasa 2014/2015'),
    (2013, 2014, 'Ekstraklasa 2013/2014'),
    (2012, 2013, 'Ekstraklasa 2012/2013'),
    (2011, 2012, 'T-Mobile Ekstraklasa 2011/2012'),
    (2010, 2011, 'Ekstraklasa 2010/2011');


-- Wprowadzenie drużyn
INSERT INTO teams (id, name)
VALUES
    (1, 'Jagiellonia Białystok'),
    (2, 'Śląsk Wrocław'),
    (3, 'Legia Warszawa'),
    (4, 'Pogoń Szczecin'),
    (5, 'Lech Poznań'),
    (6, 'Górnik Zabrze'),
    (7, 'Raków Częstochowa'),
    (8, 'Zagłębie Lubin'),
    (9, 'Widzew Łódź'),
    (10, 'Piast Gliwice'),
    (11, 'Stal Mielec'),
    (12, 'Puszcza Niepołomice'),
    (13, 'Cracovia'),
    (14, 'Korona Kielce'),
    (15, 'Radomiak Radom'),
    (16, 'Warta Poznań'),
    (17, 'Ruch Chorzów'),
    (18, 'ŁKS Łódź'),
    (19, 'Lechia Gdańsk'),
    (20, 'Miedź Legnica'),
    (21, 'Bruk-Bet Termalica Nieciecza'),
    (22, 'Wisła Kraków'),
    (23, 'Górnik Łęczna'),
    (24, 'Podbeskidzie Bielsko-Biała'),
    (25, 'Arka Gdynia'),
    (27, 'Zagłębie Sosnowiec'),
    (28, 'Sandecja Nowy Sącz'),
    (30, 'GKS Bełchatów'),
    (31, 'Zawisza Bydgoszcz'),
    (32, 'Polonia Warszawa'),
    (33, 'Polonia Bytom');

-- Wprowadzenie danych dla poszczególnych sezonów
-- Dane dla każdego sezonu w odpowiedniej strukturze

INSERT INTO season_team_stats (season_id, team_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
VALUES
    (1, 1, 34, 18, 9, 7, 77, 45, 32, 63), -- Jagiellonia Białystok
    (1, 2, 34, 18, 9, 7, 50, 31, 19, 63), -- Śląsk Wrocław
    (1, 3, 34, 16, 11, 7, 51, 39, 12, 59), -- Legia Warszawa
    (1, 4, 34, 16, 7, 11, 59, 38, 21, 55), -- Pogoń Szczecin
    (1, 5, 34, 14, 11, 9, 47, 41, 6, 53), -- Lech Poznań
    (1, 6, 34, 15, 8, 11, 45, 41, 4, 53), -- Górnik Zabrze
    (1, 7, 34, 14, 10, 10, 54, 39, 15, 52), -- Raków Częstochowa
    (1, 8, 34, 13, 8, 13, 43, 50, -7, 47), -- Zagłębie Lubin
    (1, 9, 34, 13, 7, 14, 45, 46, -1, 46), -- Widzew Łódź
    (1, 10, 34, 9, 16, 9, 38, 35, 3, 43), -- Piast Gliwice
    (1, 11, 34, 10, 11, 13, 42, 48, -6, 43), -- Stal Mielec
    (1, 12, 34, 9, 12, 13, 39, 49, -10, 39), -- Puszcza Niepołomice
    (1, 13, 34, 8, 15, 11, 45, 46, -1, 39), -- Cracovia
    (1, 14, 34, 10, 8, 16, 40, 44, -4, 38), -- Korona Kielce
    (1, 15, 34, 10, 8, 16, 41, 58, -17, 38), -- Radomiak Radom
    (1, 16, 34, 9, 10, 15, 35, 45, -10, 37), -- Warta Poznań
    (1, 17, 34, 8, 11, 15, 40, 55, -15, 35), -- Ruch Chorzów
    (1, 18, 34, 6, 6, 22, 34, 75, -41, 24); -- ŁKS Łódź

INSERT INTO season_team_stats (season_id, team_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
VALUES
    (2, 7, 34, 23, 6, 5, 63, 24, 39, 75), -- Raków Częstochowa
    (2, 3, 34, 19, 9, 6, 57, 37, 20, 66), -- Legia Warszawa
    (2, 5, 34, 17, 10, 7, 51, 29, 22, 61), -- Lech Poznań
    (2, 4, 34, 17, 9, 8, 57, 46, 11, 60), -- Pogoń Szczecin
    (2, 10, 34, 15, 8, 11, 40, 31, 9, 53), -- Piast Gliwice
    (2, 6, 34, 13, 9, 12, 45, 43, 2, 48), -- Górnik Zabrze
    (2, 13, 34, 12, 10, 12, 41, 35, 6, 46), -- Cracovia
    (2, 16, 34, 12, 9, 13, 37, 35, 2, 45), -- Warta Poznań
    (2, 8, 34, 12, 9, 13, 35, 44, -9, 45), -- Zagłębie Lubin
    (2, 15, 34, 12, 8, 14, 34, 41, -7, 44), -- Radomiak Radom
    (2, 11, 34, 11, 10, 13, 36, 40, -4, 43), -- Stal Mielec
    (2, 9, 34, 11, 8, 15, 38, 47, -9, 41), -- Widzew Łódź
    (2, 14, 34, 10, 8, 16, 39, 48, -9, 38), -- Korona Kielce
    (2, 1, 34, 9, 14, 11, 48, 49, -1, 41), -- Jagiellonia Białystok
    (2, 2, 34, 9, 14, 11, 35, 48, -13, 38), -- Śląsk Wrocław
    (2, 18, 34, 10, 7, 17, 41, 50, -9, 37), -- Wisła Płock
    (2, 19, 34, 7, 10, 17, 28, 56, -28, 31), -- Lechia Gdańsk
    (2, 20, 34, 4, 11, 19, 35, 55, -22, 23); -- Miedź Legnica

INSERT INTO season_team_stats (season_id, team_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
VALUES
    (3, 5, 34, 22, 8, 4, 67, 24, 43, 74), -- Lech Poznań
    (3, 7, 34, 20, 9, 5, 60, 30, 30, 69), -- Raków Częstochowa
    (3, 4, 34, 18, 11, 5, 63, 31, 32, 65), -- Pogoń Szczecin
    (3, 19, 34, 16, 9, 9, 52, 39, 13, 57), -- Lechia Gdańsk
    (3, 10, 34, 15, 9, 10, 45, 37, 8, 54), -- Piast Gliwice
    (3, 18, 34, 13, 9, 12, 48, 51, -3, 48), -- Wisła Płock
    (3, 15, 34, 11, 15, 8, 42, 40, 2, 48), -- Radomiak Radom
    (3, 6, 34, 13, 8, 13, 55, 55, 0, 47), -- Górnik Zabrze
    (3, 13, 34, 12, 10, 12, 40, 42, -2, 46), -- Cracovia
    (3, 3, 34, 13, 4, 17, 46, 48, -2, 43), -- Legia Warszawa
    (3, 16, 34, 11, 9, 14, 35, 38, -3, 42), -- Warta Poznań
    (3, 1, 34, 9, 13, 12, 39, 50, -11, 40), -- Jagiellonia Białystok
    (3, 8, 34, 11, 5, 18, 43, 59, -16, 38), -- Zagłębie Lubin
    (3, 11, 34, 9, 10, 15, 39, 52, -13, 37), -- Stal Mielec
    (3, 2, 34, 7, 14, 13, 42, 52, -10, 35), -- Śląsk Wrocław
    (3, 21, 34, 7, 11, 16, 36, 56, -20, 32), -- Bruk-Bet Termalica Nieciecza
    (3, 22, 34, 7, 10, 17, 37, 54, -17, 31), -- Wisła Kraków
    (3, 23, 34, 6, 10, 18, 29, 60, -31, 28); -- Górnik Łęczna

INSERT INTO season_team_stats (season_id, team_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
VALUES
    (4, 3, 30, 19, 7, 4, 48, 24, 24, 64), -- Legia Warszawa
    (4, 7, 30, 17, 8, 5, 46, 25, 21, 59), -- Raków Częstochowa
    (4, 4, 30, 15, 7, 8, 36, 23, 13, 52), -- Pogoń Szczecin
    (4, 2, 30, 11, 10, 9, 36, 32, 4, 43), -- Śląsk Wrocław
    (4, 16, 30, 13, 4, 13, 33, 32, 1, 43), -- Warta Poznań
    (4, 10, 30, 11, 9, 10, 39, 32, 7, 42), -- Piast Gliwice
    (4, 19, 30, 12, 6, 12, 40, 37, 3, 42), -- Lechia Gdańsk
    (4, 8, 30, 11, 8, 11, 38, 40, -2, 41), -- Zagłębie Lubin
    (4, 1, 30, 10, 7, 13, 39, 48, -9, 37), -- Jagiellonia Białystok
    (4, 6, 30, 10, 7, 13, 31, 33, -2, 37), -- Górnik Zabrze
    (4, 5, 30, 9, 10, 11, 39, 38, 1, 37), -- Lech Poznań
    (4, 18, 30, 8, 9, 13, 37, 44, -7, 33), -- Wisła Płock
    (4, 22, 30, 8, 9, 13, 39, 42, -3, 33), -- Wisła Kraków
    (4, 13, 30, 6, 13, 11, 28, 32, -4, 31), -- Cracovia
    (4, 11, 30, 6, 13, 11, 31, 47, -16, 31), -- Stal Mielec
    (4, 24, 30, 6, 7, 17, 29, 60, -31, 25); -- Podbeskidzie Bielsko-Biała


INSERT INTO season_team_stats (season_id, team_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
VALUES
    (5, 3, 30, 19, 3, 8, 63, 30, 33, 60), -- Legia Warszawa
    (5, 10, 30, 15, 8, 9, 36, 26, 10, 53), -- Piast Gliwice
    (5, 2, 30, 13, 10, 7, 42, 33, 9, 49), -- Śląsk Wrocław
    (5, 5, 30, 13, 10, 7, 55, 29, 26, 49), -- Lech Poznań
    (5, 13, 30, 14, 4, 12, 39, 29, 10, 46), -- Cracovia
    (5, 4, 30, 12, 9, 9, 29, 31, -2, 45), -- Pogoń Szczecin
    (5, 1, 30, 12, 8, 10, 41, 39, 2, 44), -- Jagiellonia Białystok
    (5, 19, 30, 11, 10, 9, 40, 42, -2, 43), -- Lechia Gdańsk
    (5, 6, 30, 10, 10, 10, 39, 38, 1, 41), -- Górnik Zabrze
    (5, 7, 30, 12, 5, 13, 38, 43, -5, 41), -- Raków Częstochowa
    (5, 8, 30, 10, 8, 12, 49, 46, 3, 38), -- Zagłębie Lubin
    (5, 18, 30, 10, 8, 12, 37, 50, -13, 38), -- Wisła Płock
    (5, 22, 30, 8, 7, 15, 37, 47, -10, 31), -- Wisła Kraków
    (5, 14, 30, 6, 5, 19, 28, 53, -25, 23), -- Korona Kielce
    (5, 25, 30, 7, 8, 15, 26, 45, -19, 29), -- Arka Gdynia
    (5, 18, 30, 6, 6, 18, 26, 53, -27, 24); -- ŁKS Łódź

INSERT INTO season_team_stats (season_id, team_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
VALUES
    (6, 19, 30, 17, 9, 4, 45, 25, 20, 60), -- Lechia Gdańsk
    (6, 3, 30, 18, 6, 6, 48, 31, 17, 60), -- Legia Warszawa
    (6, 10, 30, 15, 8, 7, 47, 31, 16, 53), -- Piast Gliwice
    (6, 13, 30, 14, 6, 10, 39, 34, 5, 48), -- Cracovia
    (6, 8, 30, 14, 5, 11, 48, 38, 10, 47), -- Zagłębie Lubin
    (6, 1, 30, 13, 8, 9, 45, 41, 4, 47), -- Jagiellonia Białystok
    (6, 4, 30, 12, 7, 11, 44, 42, 2, 43), -- Pogoń Szczecin
    (6, 5, 30, 13, 4, 13, 41, 40, 1, 43), -- Lech Poznań
    (6, 22, 30, 12, 6, 12, 55, 48, 7, 42), -- Wisła Kraków
    (6, 14, 30, 10, 10, 10, 35, 44, -9, 40), -- Korona Kielce
    (6, 20, 30, 8, 8, 14, 30, 52, -22, 32), -- Miedź Legnica
    (6, 6, 30, 7, 10, 13, 36, 49, -13, 31), -- Górnik Zabrze
    (6, 2, 30, 7, 10, 13, 35, 37, -2, 31), -- Śląsk Wrocław
    (6, 18, 30, 7, 9, 14, 40, 49, -9, 30), -- Wisła Płock
    (6, 25, 30, 6, 11, 13, 39, 45, -5, 29), -- Arka Gdynia
    (6, 27, 30, 6, 6, 18, 41, 63, -22, 24); -- Zagłębie Sosnowiec

INSERT INTO season_team_stats (season_id, team_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
VALUES
    (7, 5, 30, 15, 10, 5, 49, 23, 26, 55), -- Lech Poznań
    (7, 1, 30, 16, 6, 8, 45, 36, 9, 54), -- Jagiellonia Białystok
    (7, 3, 30, 17, 3, 10, 43, 31, 12, 54), -- Legia Warszawa
    (7, 18, 30, 15, 4, 11, 42, 35, 7, 49), -- Wisła Płock
    (7, 6, 30, 12, 11, 7, 56, 46, 10, 47), -- Górnik Zabrze
    (7, 14, 30, 11, 12, 7, 44, 37, 7, 45), -- Korona Kielce
    (7, 22, 30, 12, 8, 10, 41, 36, 5, 44), -- Wisła Kraków
    (7, 8, 30, 10, 13, 7, 39, 33, 6, 43), -- Zagłębie Lubin
    (7, 25, 30, 10, 10, 10, 38, 32, 6, 40), -- Arka Gdynia
    (7, 13, 30, 10, 9, 11, 40, 40, 0, 39), -- Cracovia
    (7, 2, 30, 7, 10, 13, 35, 48, -13, 31), -- Śląsk Wrocław
    (7, 4, 30, 7, 10, 13, 34, 48, -14, 31), -- Pogoń Szczecin
    (7, 10, 30, 8, 6, 16, 28, 38, -10, 30), -- Piast Gliwice
    (7, 19, 30, 8, 6, 16, 39, 51, -12, 30), -- Lechia Gdańsk
    (7, 21, 30, 7, 5, 18, 32, 52, -20, 26), -- Bruk-Bet Termalica Nieciecza
    (7, 28, 30, 4, 13, 13, 27, 46, -19, 25); -- Sandecja Nowy Sącz

INSERT INTO season_team_stats (season_id, team_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
VALUES
    (8, 1, 30, 18, 5, 7, 56, 31, 25, 59), -- Jagiellonia Białystok
    (8, 3, 30, 17, 7, 6, 58, 30, 28, 58), -- Legia Warszawa
    (8, 5, 30, 16, 7, 7, 50, 22, 28, 55), -- Lech Poznań
    (8, 19, 30, 16, 5, 9, 46, 37, 9, 53), -- Lechia Gdańsk
    (8, 22, 30, 13, 5, 12, 45, 46, -1, 44), -- Wisła Kraków
    (8, 4, 30, 10, 12, 8, 47, 40, 7, 42), -- Pogoń Szczecin
    (8, 21, 30, 10, 12, 8, 31, 38, -7, 42), -- Bruk-Bet Termalica Nieciecza
    (8, 14, 30, 12, 3, 15, 39, 55, -16, 39), -- Korona Kielce
    (8, 18, 30, 10, 9, 11, 42, 44, -2, 39), -- Wisła Płock
    (8, 8, 30, 10, 9, 11, 37, 36, 1, 39), -- Zagłębie Lubin
    (8, 2, 30, 10, 7, 13, 34, 45, -11, 37), -- Śląsk Wrocław
    (8, 25, 30, 8, 7, 15, 37, 50, -13, 31), -- Arka Gdynia
    (8, 13, 30, 8, 7, 15, 38, 43, -5, 31), -- Cracovia
    (8, 17, 30, 10, 4, 16, 37, 46, -9, 30), -- Ruch Chorzów
    (8, 10, 30, 7, 7, 16, 31, 49, -18, 28), -- Piast Gliwice
    (8, 23, 30, 7, 9, 14, 36, 52, -16, 30); -- Górnik Łęczna

INSERT INTO season_team_stats (season_id, team_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
VALUES
    (9, 3, 30, 17, 9, 4, 58, 28, 30, 60), -- Legia Warszawa
    (9, 10, 30, 17, 7, 6, 49, 36, 13, 58), -- Piast Gliwice
    (9, 4, 30, 10, 10, 6, 36, 30, 6, 46), -- Pogoń Szczecin
    (9, 8, 30, 12, 9, 9, 41, 37, 4, 45), -- Zagłębie Lubin
    (9, 13, 30, 12, 9, 9, 57, 42, 15, 45), -- Cracovia
    (9, 5, 30, 13, 4, 13, 37, 38, -1, 43), -- Lech Poznań
    (9, 19, 30, 10, 9, 11, 45, 37, 8, 38), -- Lechia Gdańsk
    (9, 17, 30, 10, 11, 9, 37, 46, -9, 38), -- Ruch Chorzów
    (9, 24, 30, 9, 11, 10, 37, 46, -9, 38), -- Podbeskidzie Bielsko-Biała
    (9, 14, 30, 9, 10, 11, 32, 37, -5, 37), -- Korona Kielce
    (9, 22, 30, 8, 13, 9, 45, 35, 10, 36), -- Wisła Kraków
    (9, 1, 30, 10, 5, 15, 37, 54, -17, 35), -- Jagiellonia Białystok
    (9, 2, 30, 8, 10, 12, 28, 37, -9, 34), -- Śląsk Wrocław
    (9, 21, 30, 8, 9, 13, 33, 43, -10, 34), -- Bruk-Bet Termalica Nieciecza
    (9, 23, 30, 8, 7, 15, 30, 43, -13, 31), -- Górnik Łęczna
    (9, 6, 30, 4, 14, 12, 33, 46, -13, 25); -- Górnik Zabrze

INSERT INTO season_team_stats (season_id, team_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
VALUES
    (10, 3, 30, 17, 5, 8, 57, 30, 27, 56), -- Legia Warszawa
    (10, 5, 30, 14, 12, 4, 52, 27, 25, 54), -- Lech Poznań
    (10, 1, 30, 14, 7, 9, 43, 35, 8, 49), -- Jagiellonia Białystok
    (10, 2, 30, 12, 10, 8, 43, 36, 7, 46), -- Śląsk Wrocław
    (10, 22, 30, 11, 10, 9, 47, 39, 8, 43), -- Wisła Kraków
    (10, 6, 30, 11, 10, 9, 43, 43, 0, 43), -- Górnik Zabrze
    (10, 4, 30, 11, 8, 11, 40, 38, 2, 41), -- Pogoń Szczecin
    (10, 19, 30, 11, 8, 11, 36, 37, -1, 41), -- Lechia Gdańsk
    (10, 14, 30, 10, 9, 11, 34, 42, -8, 39), -- Korona Kielce
    (10, 10, 30, 11, 6, 13, 38, 43, -5, 39), -- Piast Gliwice
    (10, 24, 30, 10, 9, 11, 40, 48, -8, 39), -- Podbeskidzie Bielsko-Biała
    (10, 13, 30, 10, 7, 13, 35, 41, -6, 37), -- Cracovia
    (10, 23, 30, 8, 10, 12, 31, 37, -6, 34), -- Górnik Łęczna
    (10, 17, 30, 8, 9, 13, 33, 38, -5, 33), -- Ruch Chorzów
    (10, 30, 30, 8, 7, 15, 24, 42, -18, 31), -- GKS Bełchatów
    (10, 31, 30, 8, 5, 17, 32, 52, -20, 29); -- Zawisza Bydgoszcz

INSERT INTO season_team_stats (season_id, team_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
VALUES
    (11, 3, 30, 20, 3, 7, 60, 30, 30, 63), -- Legia Warszawa
    (11, 5, 30, 15, 8, 7, 56, 34, 22, 53), -- Lech Poznań
    (11, 17, 30, 14, 8, 8, 40, 38, 2, 50), -- Ruch Chorzów
    (11, 4, 30, 11, 14, 5, 47, 38, 9, 47), -- Pogoń Szczecin
    (11, 22, 30, 12, 9, 9, 38, 30, 8, 45), -- Wisła Kraków
    (11, 31, 30, 11, 9, 10, 43, 37, 6, 42), -- Zawisza Bydgoszcz
    (11, 6, 30, 11, 9, 10, 42, 46, -4, 42), -- Górnik Zabrze
    (11, 19, 30, 10, 10, 10, 38, 37, 1, 40), -- Lechia Gdańsk
    (11, 13, 30, 11, 6, 13, 37, 43, -6, 39), -- Cracovia
    (11, 1, 30, 10, 9, 11, 46, 43, 3, 39), -- Jagiellonia Białystok
    (11, 14, 30, 9, 9, 11, 36, 41, -5, 37), -- Korona Kielce
    (11, 2, 30, 7, 13, 10, 38, 40, -2, 34), -- Śląsk Wrocław
    (11, 10, 30, 8, 10, 12, 29, 47, -18, 31), -- Piast Gliwice
    (11, 24, 30, 6, 13, 11, 27, 39, -12, 31), -- Podbeskidzie Bielsko-Biała
    (11, 8, 30, 7, 8, 15, 31, 40, -9, 29), -- Zagłębie Lubin
    (11, 9, 30, 5, 7, 18, 26, 51, -25, 22); -- Widzew Łódź

INSERT INTO season_team_stats (season_id, team_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
VALUES
    (12, 3, 30, 20, 7, 3, 59, 22, 37, 67), -- Legia Warszawa
    (12, 5, 30, 19, 4, 7, 46, 22, 24, 61), -- Lech Poznań
    (12, 2, 30, 13, 8, 9, 44, 42, 2, 47), -- Śląsk Wrocław
    (12, 10, 30, 13, 7, 10, 41, 41, 0, 46), -- Piast Gliwice
    (12, 6, 30, 12, 7, 11, 35, 31, 4, 43), -- Górnik Zabrze
    (12, 32, 30, 11, 9, 10, 45, 34, 11, 42), -- Polonia Warszawa
    (12, 22, 30, 10, 8, 12, 28, 35, -7, 38), -- Wisła Kraków
    (12, 19, 30, 10, 8, 12, 42, 43, -1, 38), -- Lechia Gdańsk
    (12, 8, 30, 11, 7, 12, 38, 37, 1, 37), -- Zagłębie Lubin
    (12, 1, 30, 8, 13, 9, 31, 45, -14, 37), -- Jagiellonia Białystok
    (12, 14, 30, 9, 9, 12, 32, 37, -5, 36), -- Korona Kielce
    (12, 4, 30, 10, 5, 15, 29, 39, -10, 35), -- Pogoń Szczecin
    (12, 9, 30, 8, 9, 13, 30, 41, -11, 33), -- Widzew Łódź
    (12, 24, 30, 6, 13, 11, 39, 43, -4, 31), -- Podbeskidzie Bielsko-Biała
    (12, 17, 30, 8, 7, 15, 35, 48, -13, 31), -- Ruch Chorzów
    (12, 30, 30, 7, 10, 13, 24, 38, -14, 31); -- GKS Bełchatów

INSERT INTO season_team_stats (season_id, team_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
VALUES
    (13, 2, 30, 17, 5, 8, 47, 31, 16, 56), -- Śląsk Wrocław
    (13, 17, 30, 16, 7, 7, 44, 28, 16, 55), -- Ruch Chorzów
    (13, 3, 30, 15, 8, 7, 42, 17, 25, 53), -- Legia Warszawa
    (13, 5, 30, 15, 7, 8, 42, 22, 20, 52), -- Lech Poznań
    (13, 14, 30, 13, 9, 8, 34, 29, 5, 48), -- Korona Kielce
    (13, 32, 30, 13, 6, 11, 33, 32, 1, 45), -- Polonia Warszawa
    (13, 22, 30, 12, 7, 11, 29, 26, 3, 43), -- Wisła Kraków
    (13, 6, 30, 11, 9, 10, 36, 30, 6, 42), -- Górnik Zabrze
    (13, 8, 30, 11, 7, 12, 36, 42, -6, 40), -- Zagłębie Lubin
    (13, 1, 30, 11, 6, 13, 35, 45, -10, 39), -- Jagiellonia Białystok
    (13, 9, 30, 9, 12, 9, 25, 26, -1, 39), -- Widzew Łódź
    (13, 24, 30, 9, 8, 13, 26, 39, -13, 35), -- Podbeskidzie Bielsko-Biała
    (13, 19, 30, 7, 10, 13, 21, 30, -9, 31), -- Lechia Gdańsk
    (13, 30, 30, 7, 10, 13, 34, 36, -2, 31), -- GKS Bełchatów
    (13, 18, 30, 5, 9, 16, 23, 53, -30, 24), -- ŁKS Łódź
    (13, 13, 30, 4, 10, 16, 20, 41, -21, 22); -- Cracovia

INSERT INTO season_team_stats (season_id, team_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
VALUES
    (14, 22, 30, 17, 5, 8, 44, 29, 15, 56), -- Wisła Kraków
    (14, 2, 30, 13, 10, 7, 46, 34, 12, 49), -- Śląsk Wrocław
    (14, 3, 30, 15, 4, 11, 45, 38, 7, 49), -- Legia Warszawa
    (14, 1, 30, 14, 6, 10, 38, 32, 6, 48), -- Jagiellonia Białystok
    (14, 5, 30, 13, 6, 11, 37, 23, 14, 45), -- Lech Poznań
    (14, 6, 30, 13, 6, 11, 36, 40, -4, 45), -- Górnik Zabrze
    (14, 32, 30, 12, 8, 10, 41, 26, 15, 44), -- Polonia Warszawa
    (14, 19, 30, 12, 7, 11, 37, 36, 1, 43), -- Lechia Gdańsk
    (14, 9, 30, 11, 10, 9, 41, 34, 7, 43), -- Widzew Łódź
    (14, 30, 30, 10, 10, 10, 31, 33, -2, 40), -- GKS Bełchatów
    (14, 8, 30, 10, 9, 11, 31, 38, -7, 39), -- Zagłębie Lubin
    (14, 17, 30, 10, 8, 12, 29, 32, -3, 38), -- Ruch Chorzów
    (14, 14, 30, 10, 7, 13, 34, 48, -14, 37), -- Korona Kielce
    (14, 13, 30, 8, 5, 17, 37, 47, -10, 29), -- Cracovia
    (14, 25, 30, 6, 10, 14, 22, 43, -21, 28), -- Arka Gdynia
    (14, 33, 30, 6, 9, 15, 29, 45, -16, 27); -- Polonia Bytom