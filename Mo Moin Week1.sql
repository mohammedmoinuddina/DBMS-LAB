
-- CREATE DATABASE WEEK1MO;
USE WEEK1MO;

CREATE TABLE person (driver_id VARCHAR(10) PRIMARY KEY,name VARCHAR(20),address VARCHAR(30));

CREATE TABLE car (reg_num VARCHAR(10) PRIMARY KEY,model VARCHAR(10),year INT);

CREATE TABLE accident (report_num INT PRIMARY KEY,accident_date DATE,location VARCHAR(20));

CREATE TABLE owns (driver_id VARCHAR(10),reg_num VARCHAR(10),PRIMARY KEY (driver_id, reg_num),FOREIGN KEY (driver_id) REFERENCES person(driver_id),
FOREIGN KEY (reg_num) REFERENCES car(reg_num));

CREATE TABLE participated (driver_id VARCHAR(10),reg_num VARCHAR(10),report_num INT,damage_amount INT,PRIMARY KEY (driver_id, reg_num, report_num),
FOREIGN KEY (driver_id) REFERENCES person(driver_id),FOREIGN KEY (reg_num) REFERENCES car(reg_num),FOREIGN KEY (report_num) REFERENCES accident(report_num));


INSERT INTO accident VALUES(11, '2003-01-01', 'Mysore Road'),
(12, '2004-02-02', 'South end Circle'),
(13, '2003-01-21', 'Bull temple Road'),
(14, '2008-02-17', 'Mysore Road'),
(15, '2004-03-05', 'Kanakpura Road');


INSERT INTO person VALUES('D1', 'MOIN', 'PEENYA'),
('D2', 'NIKHIL', 'SRS ROAD'),
('D3', 'AQUA', 'TANNERY ROAD'),
('D4', 'JOHN', 'MG ROAD'),
('D5', 'DILLINGER', 'TUMKUR ROAD');
SELECT * FROM person;

INSERT INTO car VALUES('ABC123', 'Sedan', 2000),
('XYZ456', 'SUV', 2005),
('LMN789', 'TATA', 2010),
('DEF234', 'TESLA', 2015),
('GHI567', 'BMW', 2020);
SELECT * FROM car;

INSERT INTO owns VALUES('D1', 'ABC123'),
('D2', 'XYZ456'),
('D3', 'LMN789'),
('D4', 'DEF234'),
('D5', 'GHI567');
SELECT * FROM owns;


INSERT INTO participated (driver_id, reg_num, report_num, damage_amount) VALUES('D1', 'ABC123', 11, 5000),
('D2', 'XYZ456', 12, 3000),
('D3', 'LMN789', 13, 2000),
('D4', 'DEF234', 14, 4000),
('D5', 'GHI567', 15, 3500);
SELECT * FROM participated;

UPDATE participated SET damage_amount = 25000 WHERE reg_num = 'XYZ456' AND report_num = 12;
select count(distinct driver_id) CNT from participated a, accident b where a.report_num=b.report_num and b.accident_date like '%08';

insert into accident values(16,'2008-03-08','Domlur');
select * from accident;

SELECT accident_date, location FROM accident;

SELECT DISTINCT driver_id FROM participated WHERE damage_amount >= 25000;





