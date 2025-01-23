use Joins;


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Designation VARCHAR(50),
    Salary INT,
    HireDate DATE,
    Email VARCHAR(100)
);

INSERT INTO Employees VALUES
(1, 'Aman Rana', 101, 'Manager', 90000, '2018-01-15', 'aman.rana@company.com'),
(2, 'Prankul', 102, 'Accountant', 60000, '2019-03-22', 'prankul@company.com'),
(3, 'Rahul', 101, 'Analyst', 70000, '2021-07-18', 'rahul@company.com'),
(4, 'Vikas', 103, 'Developer', 80000, '2020-05-10', 'vikas@company.com'),
(5, 'Tanish', NULL, 'Intern', 30000, '2023-02-14', 'tanish@company.com'),
(6, 'Sahil', 102, 'Clerk', 50000, '2020-06-30', 'sahil@company.com'),
(7, 'Rishav', 104, 'Designer', 65000, '2022-09-04', 'rishav@company.com');

-- Create Table: Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    ManagerID INT,
    Location VARCHAR(100)
);

INSERT INTO Departments VALUES
(101, 'Human Resources', 1, 'New York'),
(102, 'Finance', 2, 'London'),
(103, 'IT', 4, 'San Francisco'),
(104, 'Design', 7, 'Berlin'),
(105, 'Marketing', NULL, 'Paris');

-- Create Table: Projects
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    EmployeeID INT,
    Budget INT,
    Deadline DATE
);

INSERT INTO Projects VALUES
(201, 'AI Development', 4, 120000, '2024-06-01'),
(202, 'Product Launch', 3, 80000, '2024-09-15'),
(203, 'System Upgrade', 2, 60000, '2024-03-30'),
(204, 'HR Optimization', 1, 50000, '2024-05-10'),
(205, 'Website Redesign', 7, 45000, '2024-08-25'),
(206, 'Cloud Migration', NULL, 100000, '2025-01-15'),
(207, 'Marketing Campaign', NULL, 70000, '2024-12-10');

--Subqueries

--Find the department of the employee with the highest salary
SELECT DepartmentName
FROM Departments
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Employees
    WHERE Salary = (SELECT MAX(Salary) FROM Employees)
);

--Find employees working on projects with budgets greater than 70000
SELECT Name
FROM Employees
WHERE EmployeeID IN (
    SELECT EmployeeID
    FROM Projects
    WHERE Budget > 70000
);

--Joins

--1. Inner Join
--List all employees with their projects
SELECT e.Name, p.ProjectName, p.Budget
FROM Employees e
INNER JOIN Projects p ON e.EmployeeID = p.EmployeeID;

--2. Left Join (Left Outer Join)
--List all employees, including those not assigned to any projects.
SELECT e.Name, p.ProjectName, p.Budget
FROM Employees e
LEFT JOIN Projects p ON e.EmployeeID = p.EmployeeID;

--3. Right Join
--List all projects, including those not assigned to any employees
SELECT p.ProjectName, e.Name, p.Budget
FROM Employees e
RIGHT JOIN Projects p ON e.EmployeeID = p.EmployeeID;

--4.Full Outer Join (Full Join)
--List all employees and projects, matching where possible
SELECT e.Name, p.ProjectName, p.Budget
FROM Employees e
FULL OUTER JOIN Projects p ON e.EmployeeID = p.EmployeeID;

--Join all tables
--List employees, their departments, and the projects they are working on
SELECT e.Name, d.DepartmentName, p.ProjectName, p.Budget
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
LEFT JOIN Projects p ON e.EmployeeID = p.EmployeeID;


--Union
--Combine all employee salaries and project budgets (without duplicates)
SELECT Salary AS Amount FROM Employees
UNION 
SELECT Budget AS Amount FROM Projects;

--If we want to get with duplicates we just have to replace "UNION" with "UNION ALL"