USE [PostavkiTovar]
GO
--������� 1
SELECT DISTINCT Snum
FROM STD
WHERE Kolvo > ALL (
    SELECT Kolvo
    FROM STD
    WHERE Snum = 'S1'
);
GO
--������� 2
SELECT Snum
FROM S
WHERE Status < SOME (
    SELECT Status
    FROM S
    WHERE Snum = 'S1'
);
GO
--������� 3
CREATE TABLE Tovar_Temp (Tnum NVARCHAR(4) PRIMARY KEY,
             Tname NVARCHAR(50),
             Price DECIMAL(18,2),
             EdIzm NVARCHAR(50));
GO
INSERT INTO Tovar_Temp (Tnum, Tname, Price, EdIzm)
SELECT Tnum, Tname, Price, EdIzm
FROM T
WHERE Price > 1000 AND EdIzm = '�����';
GO
--������� 4
UPDATE T
SET Price = Price * 0.85
WHERE City = '������' AND EdIzm = '�����, 10 ��';
GO
--������� 5
DELETE FROM S
WHERE Status < '20';