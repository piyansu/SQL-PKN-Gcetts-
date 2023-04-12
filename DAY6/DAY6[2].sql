DROP TABLE   EMP23;
DROP TABLE   DEPT23;


CREATE TABLE DEPT23 (
	DID		NUMBER(3),
	DNAME	VARCHAR(10),
	CONSTRAINT PK_D_100    PRIMARY KEY(DID)
);

INSERT INTO DEPT23 VALUES (90, 'CSE');
INSERT INTO DEPT23 VALUES (91, 'IT');
INSERT INTO DEPT23 VALUES (92, 'APM');

CREATE TABLE EMP23 (
	EMPNO		NUMBER(3),
	ENAME		VARCHAR(10),
	DID		    NUMBER(3),
	CONSTRAINT  PK_E_100  PRIMARY KEY (EMPNO),
	CONSTRAINT  FK_E_101  FOREIGN KEY(DID)  REFERENCES  DEPT23(DID)
);

INSERT INTO EMP23  VALUES (100 , 'AAA' , 90);
INSERT INTO EMP23  VALUES (101 , 'BBB' , 90);
INSERT INTO EMP23  VALUES (102 , 'CCC' , 91);

SELECT * FROM EMP23 ;
SELECT * FROM DEPT23 ; 
 
SELECT DID FROM DEPT23 WHERE DNAME = 'CSE' ;

SELECT ENAME FROM EMP23 WHERE DID IN (SELECT DID FROM DEPT23 WHERE DNAME = 'CSE') ;

SELECT * FROM DEPT23 , (SELECT EMPNO , ENAME FROM EMP23);	

--> Sub query Expression --->

--> CSE  WHEN...THEN...ELSE..END

SELECT DID , DNAME , (CASE WHEN DID NOT IN (SELECT DID FROM EMP23) THEN 'NOT USED' ELSE 'USED' END) "STATUS" FROM DEPT23 ; 

