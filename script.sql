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

--�������� � ���������� ������ �����

CREATE TABLE Artists (
    Id INT NOT NULL PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
) AS NODE;

INSERT INTO Artists VALUES
(1, '������� ��� ���'),
(2, '����� �������'),
(3, '���� ����'),
(4, '��������� ����'),
(5, '�������� �� �����'),
(6, '������ ����'),
(7, '���������'),
(8, '����� ����'),
(9, '��� ������'),
(10, '����� ����'),
(11, '������� ����'),
(12, '���� ������');


CREATE TABLE Exhibits (
    Id INT NOT NULL PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    Type NVARCHAR(50) NOT NULL
) AS NODE;

INSERT INTO Exhibits VALUES
(1, '������� ����', '�������'),
(2, '�������', '�������'),
(3, '�����������. ������ ������', '�������'),
(4, '����������� ������', '�������'),
(5, '���� ����', '�������'),
(6, '����', '�������'),
(7, '������ �����', '�������'),
(8, '������� ����������', '�������'),
(9, '������ � �����', '�������'),
(10, '����������� � ���������', '�������'),
(11, '������ �������', '�������'),
(12, '������� �������', '�������');


CREATE TABLE Exhibitions (
    Id INT PRIMARY KEY,
    Name NVARCHAR(100),
    Year INT
) AS NODE;

INSERT INTO Exhibitions VALUES
(1, '������� ��������������', 2023),
(2, '��������� ���������', 2024),
(3, '����� ��������', 2025),
(4, '��������� � ����������', 2022),
(5, '����������� � ��������', 2021),
(6, '�������� 20 ����', 2020),
(7, '����������� ��������', 2025),
(8, '���������� �����', 2023),
(9, '�� ����� ������������', 2024),
(10, '��������� ����', 2022),
(11, '������� ����� � ���������', 2023),
(12, '�������� ��������', 2021);


CREATE TABLE Museums (
    Id INT NOT NULL PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Country NVARCHAR(100) NOT NULL
) AS NODE;

INSERT INTO Museums VALUES
(1, '����� ����', '�������'),
(2, '�����', '�������'),
(3, '����', '�������'),
(4, '����� ������������ ���������', '���'),
(5, '������������ �������', '��������������'),
(6, '�������', '������'),
(7, '������� ������', '������'),
(8, '���� ������', '��������������'),
(9, '����� �����������', '����������'),
(10, '����������', '���'),
(11, '����� �����������', '�������'),
(12, '����� �������', '�������');

--�������� � ���������� ������ �����

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

--1. ����� ��� ���������, ��������� ��������� ��� �����

SELECT E.Title, E.Type
FROM Artists A,
     CREATED_BY C,
     Exhibits E
WHERE MATCH(A-(C)->E)
  AND A.Name = '������� ��� ���';

  --2. ����� ��� ��������, �� ������� ����������� �������� "���� ����"

  SELECT EX.Name, EX.Year
FROM Exhibits E,
     DISPLAYED_AT D,
     Exhibitions EX
WHERE MATCH(E-(D)->EX)
  AND E.Title = '���� ����';

  --3. ����� ��� �����, � ������� ����������� �������� "�������"

  SELECT M.Name, M.Country
FROM Exhibits E,
     DISPLAYED_AT D,
     Exhibitions EX,
     HOSTED_BY H,
     Museums M
WHERE MATCH(E-(D)->EX-(H)->M)
  AND E.Title = '�������';

  --4. ����� ���� ����������, ��� ������ ������������ � ����� "����"

  SELECT DISTINCT A.Name
FROM Artists A,
     CREATED_BY C,
     Exhibits E,
     DISPLAYED_AT D,
     Exhibitions EX,
     HOSTED_BY H,
     Museums M
WHERE MATCH(A-(C)->E-(D)->EX-(H)->M)
  AND M.Name = '����';

  --5. ����� ���� "�������� � �����", ��� ������������ �� ������

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
  AND A1.Name = '��������� ����';

  SELECT 
    E.Title AS ExhibitTitle,
    STRING_AGG(A.Name, ' -> ') WITHIN GROUP (GRAPH PATH) AS PathToArtists,
    LAST_VALUE(A.Name) WITHIN GROUP (GRAPH PATH) AS ArtistName
FROM Exhibits AS E,
     CREATED_BY FOR PATH AS cb,
     Artists FOR PATH AS A
WHERE MATCH(SHORTEST_PATH(E(-(cb)->A)+))
  AND E.Title = '������� ����';



	--��� Power bi

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
	
	
