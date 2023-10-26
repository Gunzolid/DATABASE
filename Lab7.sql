/*
CREATE TABLE Flights
(
	FlightNo		CHAR(5),
	AID				CHAR(6),
	Type			VARCHAR(10),
	FlgFrom			VARCHAR(20),
	FlgTo			VARCHAR(20),
	Distance		INT,
	Depart			CHAR(5),
	Arrive			CHAR(5),
	Price			INT
)

INSERT INTO Flights (FlightNo, AID, Type, FlgFrom, FlgTo, Distance, Depart, Arrive, Price)
VALUES 
('TG732', 'BO1733', 'BOEING', 'Bangkok', 'Dullus', 8120, '01.00', '23.30', 38635),
('TG865', 'AB1208', 'AIRBUS', 'Bangkok', 'Narita', 2570, '10.00', '15.00', 17300),
('TG122', 'BO3409', 'BOEING', 'Phuket', 'Singapore', 835, '14.45', '16.15', 6950),
('TG347', 'BO7861', 'BOEING', 'London', 'Bangkok', 5895, '16.15', '04.30', 28650),
('TG232', 'BO1287', 'BOEING', 'Bangkok', 'Egypt', 2450, '20.30', '02.45', 17300),
('TG455', 'AB1086', 'AIRBUS', 'Auckland', 'Bangkok', 1575, '00.35', '06.05', 18600),
('TG765', 'AB2475', 'AIRBUS', 'Perth', 'Bangkok', 1250, '09.00', '14.45', 15700),
('TG876', 'AB2369', 'AIRBUS', 'Vancuver', 'Bangkok', 7595, '00.45', '23.45', 35000)

CREATE TABLE Aircraft
(
	AID				CHAR(6),
	Aname			VARCHAR(20),
	Model			CHAR(5),
	Cruising_Range	INT,
	SubID			CHAR(5)
)
INSERT INTO Aircraft (AID, Aname, Model, Cruising_Range, SubID)
VALUES 
	('AB1086', 'BUCK', 'A-320', 5000, 'S1002'),
	('AB1208', 'DEWEY', 'A-320', 5000, 'S1003'),
	('AB2369', 'MAYA', 'A-380', 10000, 'S1001'),
	('AB2475', 'MAX', 'A-333', 10000, 'S1002'),
	('BO1287', 'OLD JACK', 'B-747', 8000, 'S1004'),
	('BO1733', 'SHADOW', 'B-747', 8000, 'S1003'),
	('BO3409', 'SHORTIE', 'B-777', 10000, 'S1004'),
	('BO7861', 'THUMAN', 'B-737', 5000, 'S1002')


CREATE TABLE Supplier
(
	SupID				CHAR(5),
	SupName				VARCHAR(100),
	SupAddress			VARCHAR(100),
	Telephone			VARCHAR(20)
)
INSERT INTO Supplier(SupID, SupName, SupAddress, Telephone)
VALUES 
('S1001', 'American Rockwell', '3236 M St NW, Washington, DC, 20007, United States', '001-140-7717177'),
('S1002', 'ATR Bombardier Embraer', '1550 Wilson Blvd, Arlington, VA, 22209, United States', '001-159-23923969'),
('S1003', 'Aerospatiale', '35 Rue Chevalier de La Barre,75018 Paris, France', '36-01-53418900'),
('S1004', 'Boeing Commercial Airplanes', 'Echterdinger Stra?e 30, 70599, Stuttgart, Germany', '49-0711167650')
*/

-- Q1 update ราคาตั๋วของเที่ยวบินทุกไฟล์เพิ่มขึ้น 10 %
/*
SELECT *
FROM Flights

UPDATE Flights
SET price = (price * 10/100) + price;
*/

-- Q2 อัปเดตชื่อเครื่องบิน ID 'BO1287' จาก OLD JACK เป็น BULEBELL
/*
SELECT * 
FROM Aircraft
WHERE AID = 'BO1287'

UPDATE Aircraft
SET Aname = 'BLUEBELL'
WHERE AID = 'BO1287'
*/

-- Q3 อัปเดตชื่อเครื่องบินเป็น ALBERT จากเครื่องบินที่ใช้บินจาก กรุงเทพ ไป นาริตะ
/*
SELECT *
FROM Aircraft INNER JOIN Flights
ON Aircraft.AID = Flights.AID
WHERE Flights.FlgFrom = 'Bangkok' AND Flights.FlgTo = 'Narita'

UPDATE Aircraft
SET Aname = 'ALBERT'
WHERE AID IN (
				SELECT AID
				FROM Flights
				WHERE Flights.FlgFrom = 'Bangkok' AND Flights.FlgTo = 'Narita'
				)
*/

-- Q4 เขียนคำสั่งเปลี่ยนคำสั่งรายละเอียดเที่ยวบินจากเที่ยวบินที่ปินจาก Phuket ไป Singapore
-- เปลี่ยนเครื่องไปใช้เครื่องที่ชื่อว่า Max
-- Depart = '08.00'
-- Arrive = '10.00'
-- Price = 10000
/*
UPDATE Flights
SET AID = (
			SELECT AID
			FROM Aircraft
			WHERE Aname = 'Max'
				),
	Depart = '08.00',
	Arrive = '10.00',
	Price = 10000
WHERE FlgFrom = 'Phuket' AND FlgTo = 'Singapore'

SELECT * 
FROM Flights 
*/
-- Q5 ลบเครื่องบินชื่อ Max
/*
DELETE 
FROM Aircraft
WHERE Aname = 'Max'

SELECT *
FROM Aircraft
*/

--Q6 ลบชื่อ Supplier ที่ ขายเคื่องบิน Model B-747 และ A-320
/*
SELECT * 
FROM Supplier

DELETE 
FROM Supplier
WHERE SupID IN (SELECT SubID
				FROM Aircraft
				WHERE Model IN ('B-747', 'A-320')
				)
				*/
SELECT * 
FROM Supplier
