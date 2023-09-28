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
/*
SELECT *
FROM Flights

SELECT *
FROM Aircraft

SELECT *
FROM Supplier
*/
-- Q1 จงหาชื่อเครื่องบินที่ใช้บินจากกรุงเทพ ไป นาริตะ 
SELECT Aname
FROM Aircraft
WHERE AID =		(	
				SELECT AID
				FROM Flights 
				WHERE FlgFrom in ('Bangkok') AND FlgTo in ('Narita')
				) 


-- Q2 จงหาเที่ยวบิน (หมายเลขเที่ยวบิน ต้นทาง ปลายทาง และระยะทาง)ที่ใช้เครื่องบินชื่อ Max บิน
SELECT FlightNo, FlgFrom, FlgTo, Distance
FROM Flights 
WHERE AID =		(
				SELECT AID 
				FROM Aircraft 
				WHERE Aname in ('Max')
				)

--Q3 จงหาชื่อเครื่องบินและโมเดลของเครื่องบินที่เป็นประเภท BOEING
SELECT *
FROM Aircraft
WHERE AID in	(
				SELECT AID
				FROM Flights
				WHERE Type in ('BOEING')
				)
--Q4 จงหาชื่อเครื่องบินและโมเดลของเครื่องบินที่ถูกขายโดยบริษัทที่ตั้งอยู่ที่ประเทศเยอรมนี
SELECT Aname, Model
FROM Aircraft
WHERE SubID IN	(
				SELECT SupID
				FROM Supplier
				WHERE SupAddress LIKE '%Germany'
				)
--Q5 จงหาชื่อและที่อยู่ของบริษัทที่ขายเครื่องบินที่ใช้บินออกจากกรุงเทพ
SELECT SupName, SupAddress
FROM Supplier
WHERE SupID in	(
				SELECT SubID 
				FROM Aircraft
				WHERE AID in	(
								SELECT AID
								FROM Flights
								WHERE FlgFrom IN ('Bangkok')
								)
				)
--Q6 จงหาหมายเลขเที่ยวบิน ต้นทาง ปลายทางและระยะทางของเครื่องบินที่ถูกขายโดยบริษัททั้งตั้งอยู่ในประเทศฝรั่งเศส
SELECT FlightNo, FlgFrom, FlgTo, Distance
FROM Flights
WHERE AID IN	(
				SELECT AID
				FROM Aircraft
				WHERE SubID in	(
								SELECT SupId
								FROM Supplier
								WHERE SupAddress LIKE '%France'
								)
				)
--Q7 จงหาชื่อเครื่องบินและโมเดลของเครื่องบินที่ใช้บินในเที่ยวบินที่มีระยะทางมากกว่าระยะทางเฉลี่ย ของเที่ยวบินทั้งหมด
SELECT Aname, Model
FROM Aircraft
WHERE AID IN	(
				SELECT	AID
				FROM Flights
				WHERE Distance >	(
									SELECT AVG(Distance)
									FROM Flights
									)
				)
--Q8 จงหาหมายเลขเที่ยวบิน ต้นทาง ปลายทาง ราคาตั๋ว และระยะทางของเครื่องบินที่ใช้เครื่องบิน Airbus Model A-320 และถูกขายโดยบริษัทที่ตั้งอยู่ใน America
SELECT FlightNo, FlgFrom, FlgTo, Price, Distance 
FROM Flights
WHERE	type = 'AIRBUS' AND
		AID IN	(
				SELECT AID
				FROM Aircraft
				WHERE	Model IN ('A-320') AND
						SubID IN	(
								SELECT SupID
								FROM Supplier
								WHERE SupAddress LIKE '%United States'
								)
				)
--Q9 จงหาหมายเลขเที่ยวบิน ต้นทาง ปลายทาง ราคาตั๋ว ราคาตั๋วเฉลี่ย และส่วนต่างของราคาใน แต่ละเที่ยวบิน ของเครื่องบินประเภท BOEING
SELECT	FlightNo, FlgFrom, FlgTo, Price,
		(SELECT AVG(Price) FROM Flights) AS 'Average',
		Price - (SELECT AVG(Price) FROM Flights) AS 'Diffrence'
FROM Flights
WHERE Type = 'BOEING'
