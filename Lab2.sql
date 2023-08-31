-- CREATE DATABASE Lab2;
-- NATASAN CHANTIP 6530611021
USE Lab2;

CREATE TABLE employee
(
	SSN				CHAR(9),
	Last_name		VARCHAR(25),
	First_name		VARCHAR(25),
	Date_of_birth	DATE,
	Salary			MONEY
);

INSERT INTO employee(SSN, Last_name, First_name, Date_of_birth, Salary)
VALUES('000000001', 'CHANTIP', 'NATASAN', '2003-09-05', 20000);

INSERT INTO employee(SSN, Last_name, First_name, Date_of_birth, Salary)
VALUES('000000002', 'Potter', 'Harry', '1979-11-11', 70000);


SELECT * from employee;
DROP TABLE employee; 


CREATE TABLE Doctor
(
	ID				CHAR(3),
	Fname			VARCHAR(30),
	Lname			VARCHAR(30),
	DOB				DATE,
	Place			VARCHAR(20),
	Salary			MONEY,
	Ward			VARCHAR(20)
);

INSERT INTO Doctor(ID, Fname, Lname, DOB, Place, Salary, Ward)
VALUES	('053', 'Khumtorn', 'Nawalertpanya', '1980-08-06', 'Surat-thani', 35000, 'Surgery'),
		('063', 'Monkol', 'Daing-iad', '1979-03-09', 'Naratiwat', 50000, 'Surgery'),
		('247', 'Kanchana', 'Pramong', '1979-11-07', 'Sathun', 40000, 'Child'),
		('135', 'Urairat', 'Torhirun', '1982-09-19', 'Sathu n', 60000, 'Medicine');

SELECT * from Doctor;

DROP TABLE Doctor;
