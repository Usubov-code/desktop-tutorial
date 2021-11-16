CREATE DATABASE Market

USE Market

CREATE TABLE Brands
(
Id INT IDENTITY PRIMARY KEY ,
Name NVARCHAR(50) NOT NULL,
)

 INSERT INTO Brands (Name)
 VALUES ('Lays'),('Winston'),('Milla'),('Cola'),('Un'),('Ld')
 
 USE Market
 CREATE TABLE Products
 (
 Id INT IDENTITY PRIMARY KEY,
 Name NVARCHAR(100) NOT NULL,
 Price INT NOT NULL,
 BrandsId INT CONSTRAINT FK_Products_BrandsId FOREIGN KEY (BrandsId) REFERENCES Brands(Id)
 
)
INSERT INTO Products
VALUES
('ACI PAPRIKA',20,1),
('Boz' ,38,2),
('32 faizli',40,3),
('Zero',150,4),
('50 kq luq',100,5),
('kompakt',28,6)


SELECT * FROM Products WHERE (Price)>10
SELECT * FROM Products WHERE price < ( select  AVG(Price) from Products)

SELECT * FROM Brands WHERE Len(Name)>5
