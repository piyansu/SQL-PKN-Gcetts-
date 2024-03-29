--Assignment 1 =>
------------------------

DROP TABLE BOOKING ; 
DROP TABLE GUEST ; 
DROP TABLE ROOM ;
DROP TABLE HOTEL ; 

CREATE TABLE HOTEL (
HOTELNO VARCHAR2(10) , 
HOTELNAME  VARCHAR2(20) , 
CITY VARCHAR2(15) DEFAULT  ' KOLKATA',
STATUS NUMBER(1) DEFAULT 1, 
CONSTRAINTS HOTELNO_PK PRIMARY KEY (HOTELNO),
CONSTRAINTS HOTELNO_CH CHECK (HOTELNO LIKE 'H%'),
CONSTRAINTS STATUS_CH CHECK (STATUS IN (1,3,5))
);

CREATE TABLE ROOM (
ROOMNO VARCHAR2(10) , 
HOTELNO VARCHAR2(10) , 
BED VARCHAR2(10) , 
RATE NUMBER(8,2)  , 
TYPE CHAR(3) , 
FLOOR NUMBER(1) , 
CONSTRAINTS ROOMNO_PK PRIMARY KEY (ROOMNO),
CONSTRAINTS ROOMNO_CH CHECK (ROOMNO LIKE 'R%'),
CONSTRAINTS HOTELNO_FK FOREIGN KEY (HOTELNO) REFERENCES HOTEL(HOTELNO),
CONSTRAINTS TYPE_CH CHECK ( TYPE IN ('AC' , 'NAC')),
CONSTRAINTS FLOOR_CH CHECK ( FLOOR IN (0,1,2,3,4,5))
);

CREATE TABLE GUEST (
GUESTNO VARCHAR2(10),
GUESTNAME VARCHAR2(20),
SEX CHAR(1),
GUESTID VARCHAR2(10),
GUESTADDRESS VARCHAR2(25),
NOMEMBER NUMBER(1) DEFAULT  1,
CONSTRAINTS GUESTNO_PK PRIMARY KEY (GUESTNO) , 
CONSTRAINTS GUESTNO_CK CHECK (GUESTNO LIKE 'G%'),
CONSTRAINTS SEX_CK CHECK (SEX IN ('M','F'))
);

CREATE TABLE BOOKING (
BOOKID VARCHAR2(5) , 
HOTELNO VARCHAR2(10),
GUESTNO VARCHAR2(10),
DATEFROM DATE,
DATETO DATE,
ROOMNO VARCHAR2(10),
CONSTRAINTS BOOKID_PK PRIMARY KEY (BOOKID) ,
CONSTRAINTS BOOKID_CK CHECK ( BOOKID LIKE 'B%'),
CONSTRAINTS HOTELNO2_FK FOREIGN KEY (HOTELNO) REFERENCES HOTEL(HOTELNO),
CONSTRAINTS GUESTNO_FK FOREIGN KEY (GUESTNO) REFERENCES GUEST(GUESTNO),
CONSTRAINTS ROOMNO_FK FOREIGN KEY (ROOMNO) REFERENCES ROOM(ROOMNO)
);

DESC HOTEL ; 
DESC ROOM ; 
DESC BOOKING ;
DESC GUEST ; 


--Assignment 2 =>
------------------------

INSERT INTO HOTEL VALUES ('H001' , 'TAJ BENGAL' , 'KOLKATA' , 5);
INSERT INTO HOTEL VALUES ( 'H002', 'ASHOKA' , 'AIRPORT' , 3);
INSERT INTO HOTEL VALUES ( 'H003' , 'HINDUSTAN' , 'KOLKATA' , 3);
INSERT INTO HOTEL VALUES ( 'H004' , 'THE PARK' , 'KOLKATA' ,1);
INSERT INTO HOTEL VALUES ( 'H005' , 'HYATT' , 'SALT-LAKE' ,1);
INSERT INTO HOTEL VALUES ( 'H006' , 'ORCHIT' , 'KOLKATA' , 3);

INSERT INTO ROOM VALUES ( 'R001' , 'H001' ,  'SINGLE' , 2200 , 'AC' ,  1);
INSERT INTO ROOM VALUES ( 'R002' , 'H001' ,  'DOUBLE' , 4200 , 'NAC' ,  0);
INSERT INTO ROOM VALUES ( 'R003' , 'H002' ,  'SOFA CUM ' , 4800 , 'AC' ,  2);
INSERT INTO ROOM VALUES ( 'R004' , 'H002' ,  'SINGLE' , 3000 , 'NAC' ,  3);
INSERT INTO ROOM VALUES ( 'R005' , 'H003' ,  'DOUBLE' , 5000 , 'AC' ,  1);
INSERT INTO ROOM VALUES ( 'R006', 'H003' ,  'SINGLE' , 3000 , 'NAC' ,  4);
INSERT INTO ROOM VALUES ( 'R007' , 'H003' ,  'SOFA CUM' , 4500 , 'AC' ,  0);
INSERT INTO ROOM VALUES ( 'R008' , 'H004' ,  'SINGLE' , 2500 , 'NAC' ,  2);
INSERT INTO ROOM VALUES ( 'R009' , 'H004' ,  'SOFA CUM' , 3500 , 'AC' ,  3);
INSERT INTO ROOM VALUES ( 'R0010' , 'H005' ,  'DOUBLE' , 3800 , 'NAC' ,  4);
INSERT INTO ROOM VALUES ( 'R0011' , 'H001' ,  'DOUBLE' , 4500 , 'AC' ,  1);
INSERT INTO ROOM VALUES ( 'R0012' , 'H006' ,  'SINGLE' , 2700 , 'NAC' ,  2);

INSERT INTO GUEST VALUES ( 'G001' , 'NAREN KUMAR' ,  'M' , 'AODPN8133Q' , 'DELHI' ,  1);
INSERT INTO GUEST VALUES ( 'G002' , 'AMRITA ROY',  'F' , 'AEWPM7385' , 'BANGALORE' ,  2);
INSERT INTO GUEST VALUES ( 'G003' , 'SAIKAT SINHA' ,  'M' , 'APWKL2532Q' , 'HYDRABAD' ,  2);
INSERT INTO GUEST VALUES ( 'G004' , 'KIRAN KHAN' ,  'F' , 'AWPOL253M' , 'MUMBAI' ,  4);
INSERT INTO GUEST VALUES ( 'G005' , 'SUKUMAR DAS' ,  'M' , 'ARTP35629Q' , 'KOLKATA' ,  1);
INSERT INTO GUEST VALUES ( 'G006' , 'HARI HAR' ,  'M' , 'ADFPL4563Q' , 'HYDRABAD' ,  3);

INSERT INTO BOOKING VALUES ( 'B0001' , 'H001' , 'G001' ,'20-Jan-2014', '02-Feb-2014' , 'R002');
INSERT INTO BOOKING VALUES ( 'B0002' , 'H001' , 'G002', '05-Jan-2014','12-Jan-2014' , 'R002');
INSERT INTO BOOKING VALUES ( 'B0003' , 'H002' , 'G003' , '10-Mar-2014','15-Mar-2014' , 'R003');
INSERT INTO BOOKING VALUES ( 'B0004' , 'H003' , 'G004' ,  '30-Jan-2014','07-Feb-2014' , 'R008');
INSERT INTO BOOKING VALUES ( 'B0005' , 'H004' , 'G001' ,'21-Mar-2014','29-Mar-2014' , 'R007');
INSERT INTO BOOKING VALUES ( 'B0006' , 'H004' , 'G005' ,  '22-Feb-2014','28-Feb-2014' , 'R007');
INSERT INTO BOOKING VALUES ( 'B0007' , 'H004' , 'G006' ,  '10-Jan-2014',NULL , 'R009');
INSERT INTO BOOKING VALUES ( 'B0008' , 'H005' , 'G002' ,  '12-Feb-2014','22-Feb-2014' , 'R009');
INSERT INTO BOOKING VALUES ( 'B0009' , 'H005' , 'G006' ,  '02-Mar-2014','15-Mar-2014' , 'R0010');
INSERT INTO BOOKING VALUES ( 'B0010' , 'H006' , 'G006' ,  '06-Apr-2014','18-Apr-2014' , 'R0012');
INSERT INTO BOOKING VALUES ( 'B0011' , 'H006' , 'G003' ,  '12-Apr-2014','21-Apr-2014' , 'R0012');


--Assignment 3 =>
------------------------

--Q1:
SELECT * FROM HOTEL ;

--Q2:
 SELECT * FROM HOTEL WHERE (CITY='KOLKATA' OR CITY='SALT-LAKE') AND STATUS = 5;

--Q3:
SELECT GUESTNAME FROM GUEST WHERE GUESTNAME LIKE 'S%'OR GUESTNAME LIKE 'A%';

--Q4:
SELECT GUESTNAME FROM GUEST WHERE GUESTNAME NOT LIKE 'N%'AND GUESTNAME NOT LIKE 'H%' AND GUESTNAME NOT LIKE 'A%';

--Q5:
SELECT GUESTNAME , GUESTADDRESS FROM GUEST ORDER BY GUESTADDRESS ;

--Q6:
SELECT DISTINCT GUESTNO FROM BOOKING ;

--Q7:
SELECT ROOMNO , TYPE FROM ROOM WHERE RATE BETWEEN 3000 AND 4000;

--Q8:
SELECT * FROM ROOM WHERE RATE BETWEEN 3000 AND 4500;

--Q9:
SELECT * FROM ROOM WHERE BED='DOUBLE'AND RATE BETWEEN 0 AND 4000 ;

--Q10:
SELECT * FROM BOOKING WHERE EXTRACT (MONTH FROM DATEFROM ) = 3 ;

--Q11:
SELECT BOOKID FROM BOOKING WHERE DATETO IS NULL;

--Q12:
UPDATE ROOM SET RATE = (RATE * 110)/100 ;
SELECT * FROM ROOM ;

--Q13:
CREATE TABLE VISITORS AS SELECT * FROM GUEST WHERE 1=2;
INSERT INTO VISITORS VALUES ( 'G001' , 'NAREN KUMAR' ,  'M' , 'AODPN8133Q' , 'DELHI' ,  1);
INSERT INTO VISITORS VALUES ( 'G002' , 'AMRITA ROY',  'F' , 'AEWPM7385' , 'BANGALORE' ,  2);
INSERT INTO VISITORS VALUES ( 'G003' , 'SAIKAT SINHA' ,  'M' , 'APWKL2532Q' , 'HYDRABAD' ,  2);
SELECT * FROM VISITORS ;

--Q14:
ALTER TABLE VISITORS RENAME TO CORPORATES ;


--Assignment 4 =>
------------------------

--UPDATE AND ALTER  :
------------------------------------
--Q1:
UPDATE HOTEL SET HOTELNAME ='THE TAJ BENGAL' WHERE HOTELNAME ='TAJ BENGAL' ;

--Q2:
ALTER TABLE HOTEL MODIFY CITY VARCHAR(10) DEFAULT 'SALT-LAKE';

--Q3:
--UPDATE BOOKING SET DATEFROM = '27-Jan-2014',DATETO = '07-Feb-2014' WHERE HOTELNO ='H001' AND GUESTNO = 'G001' ;

--Q4:
ALTER TABLE BOOKING ADD NO_OF_GUEST NUMBER(1);
UPDATE BOOKING SET NO_OF_GUEST = 1 ;
SELECT * FROM BOOKING ;

--Q5:
ALTER TABLE BOOKING MODIFY NO_OF_GUEST NUMBER(2);

--Q6:
ALTER TABLE BOOKING DROP COLUMN NO_OF_GUEST;

--Q7:
DROP TABLE CORPORATES ;

--AGGREGATE FUNCTIONS :
--------------------------------------------
--Q1:
SELECT COUNT(HOTELNO) FROM HOTEL ;

--Q2:
SELECT CITY,COUNT(HOTELNO) FROM HOTEL GROUP BY CITY ;

--Q3:
SELECT COUNT(HOTELNO) FROM HOTEL WHERE CITY='KOLKATA' AND STATUS = 5;

--Q4:
SELECT MIN(RATE) FROM ROOM WHERE HOTELNO = 'H003' AND TYPE = 'NAC';

--Q5:
SELECT HOTELNO,AVG(RATE) FROM ROOM GROUP BY HOTELNO ;

--Q6:
SELECT SUM(RATE) FROM ROOM WHERE BED='DOUBLE' ;

--Q7:
SELECT ROOMNO,COUNT(BOOKID) "TOTAL BOOKS" FROM BOOKING GROUP BY ROOMNO;

--Q8:
SELECT COUNT(BOOKID) FROM BOOKING WHERE EXTRACT(MONTH FROM DATEFROM) = 2 ;

--Q9:
SELECT MAX(RATE),MIN(RATE) FROM ROOM WHERE HOTELNO = 'H001' ;

--Q10:
SELECT COUNT(ROOMNO) FROM ROOM WHERE BED = 'SINGLE' AND TYPE = 'NAC' AND RATE BETWEEN 1 AND 3000;

--Q11:
SELECT SUM(RATE) FROM ROOM WHERE BED = 'DOUBLE' AND TYPE = 'AC' ;

--Q12:
SELECT DISTINCT COUNT(GUESTNO) FROM BOOKING WHERE EXTRACT(MONTH FROM DATEFROM) = 1 ;

--Assignment 5 =>
------------------------
--Q1:
SELECT RATE , TYPE FROM ROOM WHERE HOTELNO IN (SELECT HOTELNO FROM HOTEL WHERE HOTELNAME = 'HYATT'); 

--Q2:
SELECT HOTELNAME  , ROOMNO , TYPE FROM HOTEL , ROOM ; 

--Q3:
SELECT HOTELNAME,DATEFROM,ROOMNO FROM BOOKING NATURAL JOIN ROOM NATURAL JOIN HOTEL WHERE CITY='KOLKATA' AND TYPE='AC';

--Q4:
SELECT GUESTID FROM BOOKING B INNER JOIN HOTEL H ON H.HOTELNO=B.HOTELNO INNER JOIN GUEST G ON G.GUESTNO=B.GUESTNO WHERE HOTELNAME='THE TAJ BENGAL' AND SEX='M';

--Q5:
SELECT DISTINCT HOTEL.HOTELNO,ROOMNO,BED,STATUS FROM HOTEL INNER JOIN ROOM ON HOTEL.HOTELNO=ROOM.HOTELNO INNER JOIN BOOKING ON BOOKING.HOTELNO=HOTEL.HOTELNO WHERE (STATUS=3 OR STATUS=5) AND DATETO IS NULL OR DATEFROM IS NULL ORDER BY HOTEL.HOTELNO;

--Q6:
SELECT HOTELNAME,CITY,MAX(RATE) FROM ROOM NATURAL JOIN HOTEL GROUP BY(HOTELNAME,CITY);

--Q7:
SELECT HOTELNO,GUESTNO,GUESTNAME,SEX,GUESTID,GUESTADD FROM BOOKING NATURAL JOIN GUEST NATURAL JOIN HOTEL WHERE HOTELNAME = 'THE PARK' AND DATETO-DATEFROM > 2;




