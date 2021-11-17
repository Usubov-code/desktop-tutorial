CREATE DATABASE FilmWebSite

USE FilmWebSite

CREATE TABLE GenresTable
(
Id INT IDENTITY PRIMARY KEY,
Name NVARCHAR(100) ,

)

USE FilmWebSite
CREATE TABLE MoviesTable
(
Id INT IDENTITY PRIMARY KEY,
Name NVARCHAR(100),
GenreId INT CONSTRAINT FK_MoviesTable_GenreId FOREIGN KEY (GenreId) REFERENCES GenresTable(Id),

)
USE FilmWebSite

CREATE TABLE ActorsTable
(
Id INT IDENTITY PRIMARY KEY,
Name NVARCHAR(100) NOT NULL,

)

USE FilmWebSite

CREATE TABLE MoviesAndActors
(
Id INT IDENTITY PRIMARY KEY,
MovieId INT CONSTRAINT FK_MoviesAndActors_MovieId FOREIGN KEY (MovieId) REFERENCES MoviesTable(Id),
ActorId INT CONSTRAINT FK_ActorsTABLE_ActorId FOREIGN KEY (ActorId) REFERENCES ActorsTable(Id),
)


ALTER TABLE ActorsTable
ADD Age  INT



INSERT INTO GenresTable
VALUES

('Horror'),
('Comedy'),
('Romantik'),
('Fantastik')

INSERT INTO MoviesTable
VALUES
('Open Water',1),
('Dead Pool',2),
('ASK101',3),
('The Avengers',4)

INSERT INTO ActorsTable
VALUES
('Robert De Niro',20),
('Jack Nicholson',50),
('Marlon Brando',80),
('Denzel Washington',25)

INSERT INTO MoviesAndActors
VALUES
(1,1),
(2,2),
(3,3),
(4,4)


SELECT COUNT (*) AS S,G.Name FROM MoviesTable AS M
 JOIN GenresTable AS G ON M.GenreId=G.Id 
 GROUP BY G.Name

SELECT * FROM ActorsTable WHERE Age > ( select AVG(Age) FROM ActorsTable)

SELECT * FROM  MoviesAndActors AS M
JOIN ActorsTable AS A ON M.ActorId=A.Id

SELECT * FROM ActorsTable AS A
JOIN MoviesAndActors AS M ON M.ActorId=A.Id
