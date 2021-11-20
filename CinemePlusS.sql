CREATE DATABASE CinemaPlusS

USE CinemaPlusS



CREATE TABLE Movies
(
Id INT IDENTITY PRIMARY KEY,
Name NVARCHAR(50),
)

CREATE TABLE Languages
(
Id INT IDENTITY PRIMARY KEY,
Name NVARCHAR(50)
)
CREATE TABLE Branches
(
Id INT IDENTITY PRIMARY KEY ,
Name NVARCHAR(50)
)

CREATE TABLE Halls
(
Id INT IDENTITY PRIMARY KEY,
Name NVARCHAR(50),
BranchId INT CONSTRAINT FK_Halls_BranchId FOREIGN KEY (BranchId) REFERENCES Branches(Id)

)
CREATE TABLE MovieLanguages
(
Id INT IDENTITY PRIMARY KEY,
MovieId INT CONSTRAINT FK_MovieLanguages_MovieId FOREIGN KEY (MovieId) REFERENCES Movies(Id),
LanguageId INT CONSTRAINT FK_MovieLanguages_LanguageId FOREIGN KEY(LanguageId) REFERENCES Languages(Id)

)
CREATE TABLE Seanses
(
Id INT IDENTITY PRIMARY KEY,
MovieLanguageId INT CONSTRAINT FK_Seanses_MovieLanguageId FOREIGN KEY (MovieLanguageId) REFERENCES MovieLanguages(Id),
HallId INT CONSTRAINT FK_Seanses_HallId FOREIGN KEY (HallId) REFERENCES Halls(Id),
Time DATETIME2 ,
SubtitleLanguageId INT CONSTRAINT FK_Seanses_SubtitleLanguageId FOREIGN KEY (SubtitleLanguageId) REFERENCES Languages(Id),
Price DECIMAL
)

INSERT INTO Movies 
VALUES
('FriendZone'),
('SourceCode'),
('Limit')

INSERT INTO Languages
VALUES
('AZ'),
('TR'),
('EN')
INSERT INTO Branches
VALUES
('Genclik'),
('28May'),
('ParkBulvar')

INSERT INTO Halls
VALUES
('KapitalHall',1),
('LittleHall',2),
('BigHall',3)

INSERT INTO MovieLanguages (MovieId,LanguageId)
VALUES
(1,2),
(2,3),
(3,1)

INSERT INTO Seanses
VALUES
(1,1,'2021-12-25',1,10),
(2,2,'2021-12-20',2,15),
(3,3,'2021-12-30',3,30)

INSERT INTO Seanses
VALUES
(2,3,'2021-12-20',3,30)


SELECT * FROM Seanses WHERE TIME='2021-12-20'
USE CinemaPlusS
SELECT  *
FROM Seanses
JOIN Halls ON HallId=Halls.Id



USE CinemaPlusS
SELECT  Seanses.Id,Seanses.MovieLanguageId,Seanses.SubtitleLanguageId,Seanses.Time,Seanses.Price, Halls.Name  AS HallName,Branches.Name AS BranchesName
FROM Seanses
JOIN Halls ON Seanses.HallId=Halls.Id
JOIN Branches ON Seanses.HallId=Halls.BranchId




SELECT COUNT(Seanses.Id) AS HallSeansCount FROM Halls
JOIN Seanses ON Halls.Id=Seanses.HallId






SELECT * FROM Seanses WHERE TIME=GETDATE()

