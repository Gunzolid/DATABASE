/*
CREATE TABLE Flights(

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
*/
/*
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
*/
-- Q1 
-- COUNT คำสั่งสำหรับนับ แถวใน TABLE
SELECT COUNT(*) AS 'Flights' 
FROM Flights

--Q2 
-- MIN คำสั่งสำหรับหาตัวเลขที่ค่าน้อยที่สุดใน COLUMN Price
-- MAX คำสั่งสำหรับหาตัวเลขที่ค่ามากที่สุดใน COLUMN Price
SELECT	MIN(Price) AS 'Min Price', 
		MAX(Price) AS 'Max Price'
FROM Flights

--Q3
SELECT	MIN(Price) AS 'Minimum Ticket Price', 
		MAX(Price) AS 'Maximum Ticket Price'
FROM Flights
WHERE FlgFrom in ('Bangkok')

--Q4 AVG คำสั่งที่ใช้หาค่าเฉลี่ยของ COLUMN Distance
SELECT	MIN(Distance)	AS 'Minimum Distance', 
		MAX(Distance)	AS 'Maximum Distance',
		AVG(Distance)	AS 'Averages Distance',
		COUNT(FlgFrom)	AS 'Flight From Bangkok'
FROM Flights
WHERE FlgFrom in ('Bangkok')

--Q5 GROUP BY คำสั่งสำหรับการจัดกลุ่ม
SELECT Type, COUNT(Type)	AS 'Flights'
FROM Flights
GROUP BY Type 

--Q6
SELECT	Type,
		MIN(Distance)	AS 'Minimum Distance', 
		MAX(Distance)	AS 'Maximum Distance',
		AVG(Distance)	AS 'Averages Distance',
		COUNT(FlgFrom)	AS 'Number ofFlight'
FROM Flights
GROUP BY Type 

--Q7 
SELECT	FlgFrom,
		MIN(Price)	AS 'Minimum Ticket Price', 
		MAX(Price)	AS 'Maximum Ticket Price',
		COUNT(FlgFrom)	AS 'Flight From Town'
FROM Flights
GROUP BY FlgFrom 
ORDER BY FlgFrom

--Q8 Having เหมือนกับ WHERE แต่ใช้สำหรับข้อมูลมราคิดมาแล้วเช่น MIN(Price), MAX(Price), AVG(Price)
SELECT	FlgTo,
		MIN(Price)	AS 'Minimum Ticket Price', 
		MAX(Price)	AS 'Maximum Ticket Price',
		AVG(Price)	AS 'Averages Ticket Price'
FROM Flights
GROUP BY FlgTo 
HAVING AVG(Price) >= 20000

