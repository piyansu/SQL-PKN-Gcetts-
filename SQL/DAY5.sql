DROP TABLE   EMP23;
DROP TABLE   DEPT23;


CREATE TABLE DEPT23 (
	DEPTNO		NUMBER(3),
	DNAME		VARCHAR(10),
	LOC		CHAR(5),
	CONSTRAINT PK_D_100    PRIMARY KEY(DEPTNO)
);

INSERT INTO DEPT23 VALUES (100, 'R AND D', 'KOL');
INSERT INTO DEPT23 VALUES (101, 'TESTING', 'SRM');
INSERT INTO DEPT23 VALUES (102, 'AO', 'KOL');
INSERT INTO DEPT23 VALUES (103, 'HR', 'SRM');

CREATE TABLE EMP23 (
	EMPNO		NUMBER(3),
	ENAME		VARCHAR(10),
	JOB		CHAR(5),
	MGR		NUMBER(3),
	DEPTNO		NUMBER(3),
	CONSTRAINT  PK_E_100  PRIMARY KEY (EMPNO),
	CONSTRAINT  FK_E_101  FOREIGN KEY(DEPTNO)  REFERENCES  DEPT23(DEPTNO),
	CONSTRAINT  FK_E_102  FOREIGN KEY(MGR)  REFERENCES  EMP23(EMPNO)
);

INSERT INTO EMP23  VALUES (900, 'AAA AA', 'JRE-B', 900, 100);
INSERT INTO EMP23  VALUES (901, 'BBB BB', 'SE-A', 900, 101);
INSERT INTO EMP23  VALUES (902, 'CCC CC', 'CLERK', 900, 102);
INSERT INTO EMP23  VALUES (903, 'DDD DD', 'SRAO', 901, 103);
