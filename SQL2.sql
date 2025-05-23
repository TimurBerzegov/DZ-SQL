--Задание 1
SELECT Sname 
FROM S 
WHERE Status BETWEEN 50 AND 100;
GO
--Задание 2
SELECT COUNT(*) AS MoscowSuppliers 
FROM S 
WHERE City = 'Москва';
GO
--Задание 3
SELECT SUM(T.Price * STD.Kolvo) AS TotalCost
FROM STD
JOIN T ON STD.Tnum = T.Tnum
WHERE STD.Dnum = 'D1';
GO
--Задание 4
SELECT S.Snum, S.Sname, AVG(T.Price * STD.Kolvo) AS AvgCost
FROM S
JOIN STD ON S.Snum = STD.Snum
JOIN T ON STD.Tnum = T.Tnum
GROUP BY S.Snum, S.Sname;
GO
--Задание 5
SELECT S.City FROM S
WHERE S.Snum IN (SELECT DISTINCT Snum FROM STD)
UNION
SELECT D.City FROM D
WHERE D.Dnum IN (SELECT DISTINCT Dnum FROM STD);