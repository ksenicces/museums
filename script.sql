USE Master;
GO
DROP DATABASE IF EXISTS MuseumExhibitions;
GO
CREATE DATABASE MuseumExhibitions;
GO

ALTER DATABASE MuseumExhibitions 
SET COMPATIBILITY_LEVEL = 160;
SET ANSI_NULLS ON;
SET ANSI_WARNINGS ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET ANSI_PADDING ON;
SET QUOTED_IDENTIFIER ON;
SET ARITHABORT ON;
SET NUMERIC_ROUNDABORT OFF;



USE MuseumExhibitions;
GO

--Создание и заполнение таблиц узлов

CREATE TABLE Artists (
    Id INT NOT NULL PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
) AS NODE;

INSERT INTO Artists VALUES
(1, 'Винсент Ван Гог'),
(2, 'Пабло Пикассо'),
(3, 'Клод Моне'),
(4, 'Сальвадор Дали'),
(5, 'Леонардо да Винчи'),
(6, 'Эдвард Мунк'),
(7, 'Рембрандт'),
(8, 'Эдгар Дега'),
(9, 'Пол Сезанн'),
(10, 'Фрида Кало'),
(11, 'Иероним Босх'),
(12, 'Анри Матисс');


CREATE TABLE Exhibits (
    Id INT NOT NULL PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    Type NVARCHAR(50) NOT NULL
) AS NODE;

INSERT INTO Exhibits VALUES
(1, 'Звёздная ночь', 'Картина'),
(2, 'Герника', 'Картина'),
(3, 'Впечатление. Восход солнца', 'Картина'),
(4, 'Постоянство памяти', 'Картина'),
(5, 'Мона Лиза', 'Картина'),
(6, 'Крик', 'Картина'),
(7, 'Ночной дозор', 'Картина'),
(8, 'Голубые танцовщицы', 'Картина'),
(9, 'Игроки в карты', 'Картина'),
(10, 'Автопортрет с обезьяной', 'Картина'),
(11, 'Черный квадрат', 'Картина'),
(12, 'Красная комната', 'Картина');


CREATE TABLE Exhibitions (
    Id INT PRIMARY KEY,
    Name NVARCHAR(100),
    Year INT
) AS NODE;

INSERT INTO Exhibitions VALUES
(1, 'Шедевры импрессионизма', 2023),
(2, 'Испанский модернизм', 2024),
(3, 'Гении живописи', 2025),
(4, 'Символизм и экспрессия', 2022),
(5, 'Возрождение и классика', 2021),
(6, 'Авангард 20 века', 2020),
(7, 'Французская живопись', 2025),
(8, 'Психология цвета', 2023),
(9, 'На грани гениальности', 2024),
(10, 'Художники мира', 2022),
(11, 'Женский образ в искусстве', 2023),
(12, 'Эволюция портрета', 2021);


CREATE TABLE Museums (
    Id INT NOT NULL PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Country NVARCHAR(100) NOT NULL
) AS NODE;

INSERT INTO Museums VALUES
(1, 'Музей Орсе', 'Франция'),
(2, 'Прадо', 'Испания'),
(3, 'Лувр', 'Франция'),
(4, 'Музей современного искусства', 'США'),
(5, 'Национальная галерея', 'Великобритания'),
(6, 'Эрмитаж', 'Россия'),
(7, 'Галерея Уффици', 'Италия'),
(8, 'Тейт Модерн', 'Великобритания'),
(9, 'Музей Рейксмюсеум', 'Нидерланды'),
(10, 'Гуггенхайм', 'США'),
(11, 'Музей Сурреализма', 'Испания'),
(12, 'Центр Помпиду', 'Франция');

--Создание и заполнение таблиц ребер

CREATE TABLE CREATED_BY AS EDGE;

INSERT INTO CREATED_BY ($from_id, $to_id) VALUES
((SELECT $node_id FROM Artists WHERE Id = 1), (SELECT $node_id FROM Exhibits WHERE Id = 1)), 
((SELECT $node_id FROM Artists WHERE Id = 2), (SELECT $node_id FROM Exhibits WHERE Id = 2)), 
((SELECT $node_id FROM Artists WHERE Id = 3), (SELECT $node_id FROM Exhibits WHERE Id = 3)), 
((SELECT $node_id FROM Artists WHERE Id = 4), (SELECT $node_id FROM Exhibits WHERE Id = 4)), 
((SELECT $node_id FROM Artists WHERE Id = 5), (SELECT $node_id FROM Exhibits WHERE Id = 5)), 
((SELECT $node_id FROM Artists WHERE Id = 6), (SELECT $node_id FROM Exhibits WHERE Id = 6)), 
((SELECT $node_id FROM Artists WHERE Id = 7), (SELECT $node_id FROM Exhibits WHERE Id = 7)), 
((SELECT $node_id FROM Artists WHERE Id = 8), (SELECT $node_id FROM Exhibits WHERE Id = 8)), 
((SELECT $node_id FROM Artists WHERE Id = 9), (SELECT $node_id FROM Exhibits WHERE Id = 9)), 
((SELECT $node_id FROM Artists WHERE Id = 10), (SELECT $node_id FROM Exhibits WHERE Id = 10)),
((SELECT $node_id FROM Artists WHERE Id = 11), (SELECT $node_id FROM Exhibits WHERE Id = 11)), 
((SELECT $node_id FROM Artists WHERE Id = 12), (SELECT $node_id FROM Exhibits WHERE Id = 12)); 


CREATE TABLE DISPLAYED_AT AS EDGE;

INSERT INTO DISPLAYED_AT ($from_id, $to_id) VALUES
((SELECT $node_id FROM Exhibits WHERE Id = 1), (SELECT $node_id FROM Exhibitions WHERE Id = 3)),
((SELECT $node_id FROM Exhibits WHERE Id = 2), (SELECT $node_id FROM Exhibitions WHERE Id = 2)),
((SELECT $node_id FROM Exhibits WHERE Id = 3), (SELECT $node_id FROM Exhibitions WHERE Id = 1)),
((SELECT $node_id FROM Exhibits WHERE Id = 4), (SELECT $node_id FROM Exhibitions WHERE Id = 4)),
((SELECT $node_id FROM Exhibits WHERE Id = 5), (SELECT $node_id FROM Exhibitions WHERE Id = 5)),
((SELECT $node_id FROM Exhibits WHERE Id = 6), (SELECT $node_id FROM Exhibitions WHERE Id = 6)),
((SELECT $node_id FROM Exhibits WHERE Id = 7), (SELECT $node_id FROM Exhibitions WHERE Id = 10)),
((SELECT $node_id FROM Exhibits WHERE Id = 8), (SELECT $node_id FROM Exhibitions WHERE Id = 7)),
((SELECT $node_id FROM Exhibits WHERE Id = 9), (SELECT $node_id FROM Exhibitions WHERE Id = 8)),
((SELECT $node_id FROM Exhibits WHERE Id = 10), (SELECT $node_id FROM Exhibitions WHERE Id = 11)),
((SELECT $node_id FROM Exhibits WHERE Id = 11), (SELECT $node_id FROM Exhibitions WHERE Id = 9)),
((SELECT $node_id FROM Exhibits WHERE Id = 12), (SELECT $node_id FROM Exhibitions WHERE Id = 12));


CREATE TABLE HOSTED_BY AS EDGE;

INSERT INTO HOSTED_BY ($from_id, $to_id) VALUES
((SELECT $node_id FROM Exhibitions WHERE Id = 1), (SELECT $node_id FROM Museums WHERE Id = 1)), 
((SELECT $node_id FROM Exhibitions WHERE Id = 2), (SELECT $node_id FROM Museums WHERE Id = 2)), 
((SELECT $node_id FROM Exhibitions WHERE Id = 3), (SELECT $node_id FROM Museums WHERE Id = 3)), 
((SELECT $node_id FROM Exhibitions WHERE Id = 4), (SELECT $node_id FROM Museums WHERE Id = 4)), 
((SELECT $node_id FROM Exhibitions WHERE Id = 5), (SELECT $node_id FROM Museums WHERE Id = 5)), 
((SELECT $node_id FROM Exhibitions WHERE Id = 6), (SELECT $node_id FROM Museums WHERE Id = 6)), 
((SELECT $node_id FROM Exhibitions WHERE Id = 7), (SELECT $node_id FROM Museums WHERE Id = 7)), 
((SELECT $node_id FROM Exhibitions WHERE Id = 8), (SELECT $node_id FROM Museums WHERE Id = 8)), 
((SELECT $node_id FROM Exhibitions WHERE Id = 9), (SELECT $node_id FROM Museums WHERE Id = 9)), 
((SELECT $node_id FROM Exhibitions WHERE Id = 10), (SELECT $node_id FROM Museums WHERE Id = 10)), 
((SELECT $node_id FROM Exhibitions WHERE Id = 11), (SELECT $node_id FROM Museums WHERE Id = 11)), 
((SELECT $node_id FROM Exhibitions WHERE Id = 12), (SELECT $node_id FROM Museums WHERE Id = 12)); 


--Match

--1. Найти все экспонаты, созданные Винсентом Ван Гогом

SELECT E.Title, E.Type
FROM Artists A,
     CREATED_BY C,
     Exhibits E
WHERE MATCH(A-(C)->E)
  AND A.Name = 'Винсент Ван Гог';

  --2. Найти все выставки, на которых представлен экспонат "Мона Лиза"

  SELECT EX.Name, EX.Year
FROM Exhibits E,
     DISPLAYED_AT D,
     Exhibitions EX
WHERE MATCH(E-(D)->EX)
  AND E.Title = 'Мона Лиза';

  --3. Найти все музеи, в которых выставлялся экспонат "Герника"

  SELECT M.Name, M.Country
FROM Exhibits E,
     DISPLAYED_AT D,
     Exhibitions EX,
     HOSTED_BY H,
     Museums M
WHERE MATCH(E-(D)->EX-(H)->M)
  AND E.Title = 'Герника';

  --4. Найти всех художников, чьи работы выставлялись в музее "Лувр"

  SELECT DISTINCT A.Name
FROM Artists A,
     CREATED_BY C,
     Exhibits E,
     DISPLAYED_AT D,
     Exhibitions EX,
     HOSTED_BY H,
     Museums M
WHERE MATCH(A-(C)->E-(D)->EX-(H)->M)
  AND M.Name = 'Лувр';

  --5. Найти пары "Художник – Музей", где выставлялись их работы

  SELECT DISTINCT A.Name AS ArtistName, M.Name AS MuseumName
FROM Artists A,
     CREATED_BY C,
     Exhibits E,
     DISPLAYED_AT D,
     Exhibitions EX,
     HOSTED_BY H,
     Museums M
WHERE MATCH(A-(C)->E-(D)->EX-(H)->M);

--SHORTEST_PATH


	SELECT 
    A1.Name AS ArtistName,
    STRING_AGG(CONCAT(M.Name, ' (', M.Country, ')'), ' -> ') 
        WITHIN GROUP (GRAPH PATH) AS PathToMuseum,
    LAST_VALUE(M.Name) WITHIN GROUP (GRAPH PATH) AS MuseumName,
    LAST_VALUE(M.Country) WITHIN GROUP (GRAPH PATH) AS MuseumCountry
FROM Artists AS A1,
     CREATED_BY FOR PATH AS cb,
     Exhibits FOR PATH AS e,
     DISPLAYED_AT FOR PATH AS da,
     Exhibitions FOR PATH AS exh,
     HOSTED_BY FOR PATH AS hb,
     Museums FOR PATH AS M
WHERE MATCH(SHORTEST_PATH(A1(-(cb)->e-(da)->exh-(hb)->M)+))
  AND A1.Name = 'Сальвадор Дали';

  SELECT 
    E.Title AS ExhibitTitle,
    STRING_AGG(A.Name, ' -> ') WITHIN GROUP (GRAPH PATH) AS PathToArtists,
    LAST_VALUE(A.Name) WITHIN GROUP (GRAPH PATH) AS ArtistName
FROM Exhibits AS E,
     CREATED_BY FOR PATH AS cb,
     Artists FOR PATH AS A
WHERE MATCH(SHORTEST_PATH(E(-(cb)->A)+))
  AND E.Title = 'Звёздная ночь';



	--для Power bi

	USE MuseumExhibitions;
GO 

	SELECT 
    A.Id AS ArtistId,
    A.Name AS ArtistName,
    CONCAT(N'artist', A.Id) AS [ArtistImage],
    E.Id AS ExhibitId,
    E.Title AS ExhibitTitle,
    CONCAT(N'exhibit', E.Id) AS [ExhibitImage]
FROM 
    Artists AS A,
    CREATED_BY AS C,
    Exhibits AS E
WHERE 
    MATCH(A-(C)->E);

	USE MuseumExhibitions;
GO 
	SELECT 
    E.Id AS ExhibitId,
    E.Title AS ExhibitTitle,
    CONCAT(N'exhibit', E.Id) AS [ExhibitImage],
    EX.Id AS ExhibitionId,
    EX.Name AS ExhibitionName,
    CONCAT(N'exhibition', EX.Id) AS [ExhibitionImage]
FROM 
    Exhibits AS E,
    DISPLAYED_AT AS D,
    Exhibitions AS EX
WHERE 
    MATCH(E-(D)->EX);

	USE MuseumExhibitions;
GO 
SELECT 
    EX.Id AS ExhibitionId,
    EX.Name AS ExhibitionName,
    CONCAT(N'exhibition', EX.Id) AS [ExhibitionImage],
    M.Id AS MuseumId,
    M.Name AS MuseumName,
    CONCAT(N'museum', M.Id) AS [MuseumImage]
FROM 
    Exhibitions AS EX,
    HOSTED_BY AS H,
    Museums AS M
WHERE 
    MATCH(EX-(H)->M);
	
	
