CREATE DATABASE Kitabxana

USE Kitabxana


CREATE TABLE Authors
(
Id INT IDENTITY PRIMARY KEY,
Name NVARCHAR(100) NOT NULL,
Surname NVARCHAR(100)NOT NULL
)

USE Kitabxana
CREATE TABLE Books
(
Id INT IDENTITY PRIMARY KEY,
Name NVARCHAR(100) CHECK(LEN(Name)>2)NOT NULL,
AuthorId INT CONSTRAINT FK_BOOKS_AuthorId FOREIGN KEY (AuthorId) REFERENCES Authors(Id),
PageCount INT  NOT NULL
)


INSERT INTO Authors
VALUES
('ASEF','ZEYNALLI'),
('ABBAS','HESENOV'),
('AGA','MUSTAFAYEV'),
('SAMIR','IBRAHIMOV')

INSERT INTO Books
VALUES
('Qarli Gece',1,20),
('Yagisli Gun',2,25),
('WhereAreYou?',3,50),
('For CHRISTMAS',4,75)

CREATE VIEW VW_AllBooks
AS
SELECT Books.Id,Books.Name,Books.PageCount ,(A.Name+' '+A.Surname) AS FullName FROM Books
JOIN Authors AS A ON    A.Id = Books.AuthorId


SELECT * FROM VW_AllBooks



CREATE PROCEDURE USP_ALLBOOKS
@search NVARCHAR(35)
AS
SELECT * FROM VW_AllBooks
WHERE Name LIKE '%'+@search+'%'  OR FullName LIKE '%'+@search+'%' OR Id LIKE '%'+@search+'%' OR PageCount LIKE '%'+@search+'%'

EXEC USP_ALLBOOKS 'SAMIR'


CREATE PROCEDURE USP_UPDATE_BOOKS   
AS
UPDATE Books
SET Name='ELSHAD'
WHERE Books.Id=1

SELECT * FROM VW_AllBooks
EXEC USP_UPDATE_BOOKS


CREATE PROCEDURE USP_INSERT_BOOKS
AS
INSERT INTO Books
VALUES
('ALADDIN',2,20)

SELECT * FROM VW_AllBooks
EXEC USP_INSERT_BOOKS





CREATE PROCEDURE USP_DeleteProductsByName
@mimName NVARCHAR
AS
DELETE FROM Authors WHERE Name<@mimName
DELETE FROM Books WHERE Name<@mimName

SELECT * FROM VW_AllBooks
EXEC USP_DeleteProductsByName 'AGA MUSTAFAYEV'


CREATE VIEW VW_AUTHORS
AS
SELECT  B.PageCount AS BooksCount,MAX(B.PageCount) AS MaxPageCount ,(Authors.Name+' '+Authors.Surname) AS FullName FROM Authors
JOIN Books AS B ON B.AuthorId=Authors.Id


SELECT * FROM VW_AUTHORS

