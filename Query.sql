--1--
SELECT * FROM Employees WHERE EmployeeID=8
--2--
SELECT FirstName, LastName FROM Employees 
WHERE City = 'London'
--3--
SELECT FirstName, LastName FROM Employees 
WHERE City = 'London'
--4--
SELECT FirstName, LastName, (YEAR(GETDATE()) - YEAR(BirthDate)) AS Age
FROM Employees
WHERE (YEAR(GETDATE()) - YEAR(BirthDate)) > 55
ORDER BY LastName
--5--
SELECT FirstName, LastName, 
	   FLOOR(DATEDIFF(DAY, BirthDate , GETDATE())/365.25) AS Age
FROM Employees
WHERE FLOOR(DATEDIFF(DAY, BirthDate , GETDATE())/365.25)>55
ORDER BY LastName
--6--
SELECT COUNT(EmployeeID) AS 'Number of employees from London' 
FROM Employees
WHERE City='London'
--7--
SELECT DISTINCT City
FROM Employees
	
SELECT
	MAX((YEAR(GETDATE()) - YEAR(BirthDate))) AS GratestAge,
	MIN((YEAR(GETDATE()) - YEAR(BirthDate))) AS SmallestAge,
	AVG((YEAR(GETDATE()) - YEAR(BirthDate))) AS AverageAge
FROM Employees
GROUP BY City
--8--
SELECT City, AVG(YEAR(GETDATE()) - YEAR(BirthDate)) AS Age 
FROM Employees
GROUP BY City
HAVING (AVG(YEAR(GETDATE()) - YEAR(BirthDate))>60)
--9--
SELECT 
	FirstName AS NAME,
	LastName AS SURNAME, 
	(YEAR(GETDATE()) - YEAR(BirthDate)) AS AGE
FROM Employees
WHERE (YEAR(GETDATE()) - YEAR(BirthDate)) IN
	(SELECT MAX(YEAR(GETDATE()) - YEAR(BirthDate))
	 FROM Employees 
	)
--10--	
SELECT LastName, FirstName, (YEAR(GETDATE()) - YEAR(BirthDate)) AS Age
FROM Employees
WHERE (YEAR(GETDATE()) - YEAR(BirthDate)) IN
	(
		SELECT TOP 3 (YEAR(GETDATE()) - YEAR(BirthDate))
		FROM Employees
	)
--11--	
SELECT DISTINCT City
FROM Employees
--12--
SELECT MONTH(BirthDate) AS 'Month Of Birth'
FROM Employees

SELECT FirstName, LastName, MONTH(BirthDate) AS 'Month Of Birth'
FROM Employees
WHERE MONTH(BirthDate) = MONTH(GETDATE())
--13--
SELECT DISTINCT e.FirstName, e.LastName, o.ShipCity
FROM Employees AS e, Orders AS o
WHERE e.EmployeeID = o.EmployeeID  AND o.ShipCity = 'Madrid'
--14--
SELECT FirstName, LastName, COUNT(OrderID) AS 'Number of orders'
FROM Employees LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
WHERE YEAR(OrderDate) = 1997
GROUP BY LastName, FirstName
--15--
SELECT FirstName, LastName, COUNT(OrderID) AS 'Number of orders'
FROM Employees LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
WHERE ShippedDate > RequiredDate AND YEAR(OrderDate) = 1997
GROUP BY LastName, FirstName
--16--
SELECT Customers.CustomerID as 'Customer', COUNT(OrderID) AS 'CountOrders'
FROM Orders FULL JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
WHERE Country = 'France'
GROUP BY Customers.CustomerID
--17--
SELECT ContactName, COUNT(OrderID) AS 'Orders'
FROM Customers JOIN Orders
  ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.Country = 'France'
GROUP BY Customers.ContactName
HAVING COUNT(OrderID)>1









	  
	  


	  


	  











