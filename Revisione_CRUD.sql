USE master;
GO
-- Revizione completa del corso Sql server 
-- CREAZIONE DEL DATABASE hr_analytics_db
DROP DATABASE IF EXISTS Hr_analytics_db;
GO
CREATE DATABASE Hr_analytics_db;
GO
-- Uso del database 
USE Hr_analytics_db;
-- Creazione della tabella departments
CREATE TABLE Departments(
    DepartmentId INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- COLONNA principale della tabella 
    Department_Name VARCHAR(100) NOT NULL,
    Location VARCHAR(50) NULL
);
-- Creazione della tabella Employees(DIPENDENTI)
CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY,
    Employee_Name VARCHAR(100),
    DepartmentId INT NULL,
    Job_Title VARCHAR(100) NULL,
    Hire_date DATE DEFAULT GETDATE() NULL,
    Salary DECIMAL(12,2) NULL,
    Employment_status VARCHAR(20) NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId)
);
-- Creazione della tabella Attendance
CREATE TABLE Attendance(
    AttendanceId INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    EmployeeId INT NULL, 
    Attendance_Date DATE NULL,
    Attendance_Status VARCHAR(50) NULL,
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);
-- Creazione della tabella Promozioni
CREATE TABLE Promotions(
    PromotionId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    EmployeeId INT NULL,
    Promotion_Date DATE NULL,
    Old_job_title VARCHAR(150) NULL,
    New_job_title VARCHAR(150) NULL,
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);

INSERT INTO Departments
    (Department_Name, Location)
VALUES
    ('Data Analytics', 'Mumbai'),
    ('Finance', 'Delhi'),
    ('Human Resources', 'Bangalore'),
    ('Technology', 'Pune'),
    ('Operations', 'Hyderabad');

SELECT * FROM Departments;
GO

-- INSERIMENTO DEI DIPENDENTI
-------------------------------------------------------------
-- EmployeeId NON è IDENTITY,
-- quindi dobbiamo specificarlo.

INSERT INTO Employees
    (
        EmployeeId,
        Employee_Name,
        DepartmentId,
        Job_Title,
        Hire_date,
        Salary,
        Employment_status
    )
VALUES
    (1, 'Rahul Sharma', 1, 'Data Analyst',       '2022-01-10',  850000.00, 'Active'),
    (2, 'Priya Verma',  2, 'Financial Analyst',  '2021-05-15',  920000.00, 'Active'),
    (3, 'Amit Patel',   4, 'Software Engineer',  '2020-08-20', 1200000.00, 'Active'),
    (4, 'Sneha Joshi',  3, 'HR Specialist',      '2023-02-10',  650000.00, 'Active'),
    (5, 'Rohan Gupta',  5, 'Operations Analyst', '2022-11-05',  750000.00, 'Resigned');

SELECT * FROM Employees;
GO

-- INSERIMENTO DELLE PRESENZE
-------------------------------------------------------------
-- AttendanceId è IDENTITY.
-- NON dobbiamo inserirlo.
INSERT INTO Attendance
    (
        EmployeeId,
        Attendance_Date,
        Attendance_Status
    )
VALUES
    (1, '2025-01-02', 'Present'),
    (1, '2025-01-03', 'Present'),
    (2, '2025-01-02', 'Present'),
    (2, '2025-01-03', 'Absent'),
    (3, '2025-01-02', 'Present'),
    (4, '2025-01-02', 'Present'),
    (5, '2025-01-02', 'Absent');

SELECT * FROM Attendance;
GO

-- INSERIMENTO DELLE PROMOZIONI
-------------------------------------------------------------
-- PromotionId è IDENTITY.
-- NON dobbiamo inserirlo.
INSERT INTO Promotions
    (
        EmployeeId,
        Promotion_Date,
        Old_job_title,
        New_job_title
    )
VALUES
    (1, '2024-06-01', 'Junior Data Analyst', 'Data Analyst'),
    (3, '2024-01-15', 'Software Engineer', 'Senior Software Engineer');

SELECT * FROM Promotions;
GO

--------------------
-- restituire le prime 3 linee della tabella departments

SELECT * FROM Departments;

SELECT TOP 3 * FROM Departments;

-- Restituire la colonna Department data analystics

SELECT * FROM Departments
WHERE Department_Name = 'Data Analytics';

SELECT * FROM Departments
WHERE DepartmentId = 1;

SELECT * FROM Departments
WHERE Location = 'Mumbai';

SELECT * FROM Departments WHERE Department_Name LIKE '%Analytics';
SELECT * FROM Departments WHERE Department_Name LIKE '%s' AND DepartmentId = 1;
SELECT * FROM Departments WHERE Department_Name LIKE 'D%';
SELECT * FROM Departments WHERE Department_Name LIKE 'Data%';

-- Rimuovere i duplicati
SELECT DISTINCT * FROM Employees;

-- INNER JOIN DEL DEPARTMENTS CON EMPLOIEE

SELECT * 
FROM Departments AS d
INNER JOIN Employees AS e
ON d.DepartmentId = EmployeeId;

-- campi da restituire; Nome, ruolo, dipartimento, sede,

SELECT 
e.Employee_Name as [Nome dell'impiegato],
e.Job_Title as Ruolo,
CONCAT('€ ', Cast(e.Salary as INT)) as stipendio,
d.Department_Name as Dipartimento,
d.location as Sede
FROM Departments AS d
INNER JOIN Employees AS e
ON d.DepartmentId = EmployeeId;

-- LO STIPENDIO MEDIO DELLA TABELLA EMPLOYEES
-- AVG(salary)      -> calcola la media degli stipendi
-- Cast(... as INT) -> elimina i decimali
-- Format( ...'N','it-IT') -> Formatta il numero in stile Italiano
-- Concat(..., '€ ') -> aggiunge il simbolo dell'€

SELECT 
CONCAT('€ ',CAST(AVG(Salary) AS int)) as [stipendio medio]
FROM Employees;

SELECT 
  CONCAT(FORMAT(CAST(AVG(Salary) AS INT),'N','it-IT'),' €') AS [MEDIA STIPENDI]
    FROM Employees;


    -- LO STIPENDIO massimo DELLA TABELLA EMPLOYEES

SELECT 
  CONCAT(FORMAT(CAST(MAX(Salary) AS INT),'N','it-IT'),' €') AS [MEDIA STIPENDI]
    FROM Employees;

-- MODIFICARE UN RECORD DELLA DBO.ATTENDANCE

SELECT * FROM [dbo].[Attendance];

UPDATE Attendance
SET Attendance_Status ='Absent'
WHERE AttendanceId = 2;

SELECT *
FROM Attendance
WHERE AttendanceId = 2;

