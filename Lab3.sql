--CREATE DATABASE Customer;
--USE Customer;
/*
CREATE TABLE customer
(
	CID					CHAR(3),
	Fname				VARCHAR(30),
	Lname				VARCHAR(30),
	Address				VARCHAR(20),
	Salary				MONEY,
	Job					VARCHAR(20)
)
*/
/*
INSERT INTO customer(CID, Fname, Lname, Address, Salary, Job)
VALUES
	('001', 'Khumthom', 'Nawalertpanya', 'Suratthani', 15000),
	('032', 'Kanchana', 'Praming', 'Sathun', 30000, 'Doctor'),
	('087', 'Kringsak', 'Yakkapon', 'Pattalung', 20000 ,'Doctor'),
	('024', 'Runguedee', 'Kitmakom', 'Sathun', 28000, 'Doctor'),
	('123', 'Chettachai', 'Dittakan', 'Suratthani', 80000, 'Pilot'),
	('456', 'Jiraporn', 'Jittiangtum', 'Suratthani', 15000, 'Admin'),
	('940', 'Orasa', 'Siriphan', 'Bangkok', 18000, 'Admin');
	*/

-- SELECT เลือกดูข้อมูลในตาราง ส่วนของ Column
-- * = เลือกดูค่าทั้งหมดในตาราง (ALL Column)
/* Q1
SELECT * 
FROM customer
*/

-- เลือกดูเฉพาะ Column ให้เขียนชื่อ Column เลย
/* Q2
SELECT Fname, Lname, Job, Salary
FROM customer
*/

-- WHERE เงื่อนไขการเลือก ROW
/* Q3
SELECT Fname, Lname, Address, Job
FROM customer
WHERE Address = 'Bangkok';
*/

/* Q4
SELECT *
FROM customer
WHERE Job = 'Doctor';
*/

-- OPERATOR =, !=, <>, >, < , <=
/* Q5
SELECT Fname, Lname, Job, Salary
FROM customer
WHERE Salary >= 30000
*/

/* Q6
SELECT *
FROM customer
WHERE Job != 'Doctor'
*/

-- LIKE = คำสั้งตัวอักษรที่จะแสดงใน ROW
-- % = K% ROW ไหนก็ได้ที่มีตัว K นำหน้า (ยาวเท่าไหร่ก็ได้)

/* Q7
SELECT *
FROM customer
WHERE Fname LIKE 'K%';
*/

/* Q8
SELECT *
FROM customer
WHERE Lname LIKE '%n';
*/

-- _h% = ตัวหน้าเป็นอะไรก็ได้ แต่ตัวหลัง _ ต้องเป็นตัว h
/* Q9
SELECT *
FROM customer
WHERE Fname LIKE '_h%';
*/

-- AND = เงื่อนไขที่ต้องเหมือนกันทั้ง 2 เงื่อนไข
/*Q11
SELECT CID, Fname, Lname, Job, Salary
FROM customer
WHERE Address = 'Sathun'
AND Job = 'Doctor';
*/

-- BETWEEN = คำสั่งการหาค่าระหว่างตัวเลข 2 ตัว
/* Q12
SELECT *
FROM customer

WHERE Salary BETWEEN 20000 AND 50000

WHERE Salary >= 20000 
AND Salary <= 50000
*/

/* Q13
SELECT *
FROM customer
WHERE Job = 'Pilot' OR Job = 'Doctor'
*/

/* Q14
SELECT *
FROM customer

WHERE Job = 'Pilot' 
OR Job = 'Doctor'
OR Job = 'Dentist';

-- IN = เป็น Operetor ที่เก็บเงื่อนไขเป็นเซ็ต 
WHERE Job IN ('Pilot', 'Doctor', 'Dentist')
*/

-- IS NULL = คำสั่งที่ใช้มนการสืบค้นค่าที่เป็นค่าว่าง ที่ไม่ใช่ '', ""
/* Q14 
SELECT * 
FROM customer
WHERE Job is NULL
*/

/*
-- Q14
SELECT * 
FROM customer
WHERE Address IN ('Sathun', 'Bangkok')
ORDER BY Job, Salary DESC;
-- DESC = เรียงจากมากไปน้อย
-- ORDER BY Fname DESC
*/


-- DISTINCT = เอาแต่ค่าที่ไม่ซ้ำ 
/* Q15
SELECT DISTINCT Address
FROM customer
*/

-- AS = เปลี่ยนชื่อ Column สำหรับการแสดงผลเท่านั้น
/*
SELECT	CID		AS		'Customer',
		Fname	AS		'First Name',
		Lname	AS		'Last Name',
		Address,
		Job,
		Salary
FROM customer
*/
