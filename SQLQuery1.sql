
CREATE DATABASE EmployeeDB;

USE EmployeeDB;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    DepartmentID INT,
    JoiningDate DATE
);


INSERT INTO Employees (EmployeeID, Name, Position, Salary, DepartmentID, JoiningDate)
VALUES
(1, 'Aman', 'Manager', 75000, 101, '2025-01-15'),
(2, 'Prankul', 'Developer', 47000, 102, '2025-05-20'),
(3, 'Rahul', 'Tester', 40000, 103, '2024-09-01'),
(4,'Temp',null,0,104,'2025-01-01');

UPDATE Employees
SET Salary = 48000
WHERE EmployeeID = 2;

Delete From Employees
where EmployeeID = 4;

Select * from Employees;

SELECT Name, Position,Salary
FROM Employees
WHERE Salary > 45000
ORDER BY Salary desc;

GRANT SELECT, INSERT, UPDATE, DELETE ON Employees TO root;

REVOKE SELECT, INSERT ON Employees FROM root;

INSERT INTO Employees (EmployeeID, Name, Position, Salary, DepartmentID, JoiningDate)
VALUES(4,'Temp','Intern',20000,104,'2025-01-01');


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    ManagerID INT
);


INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID)
VALUES
(101, 'Human Resources', 1),
(102, 'IT', NULL),
(103, 'Quality Assurance', NULL);




-- Inner Join:
SELECT *
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- 2. Left Join:
SELECT *
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- 3. Right Join:
SELECT *
FROM Employees e
RIGHT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- 4. Full Outer Join: Retrieve all employees and departments, whether they match or not
SELECT *
FROM Employees e
FULL OUTER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

--find employees who are Developers and their department names
SELECT e.EmployeeID, e.Name, e.Position, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Position = 'Developer';



