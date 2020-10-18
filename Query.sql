--1.1
CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID INT PRIMARY KEY IDENTITY(1,1),
    FIRST_NAME NVARCHAR(50) NOT NULL,
	LAST_NAME NVARCHAR(50) NOT NULL,
    SUPERIOR_FK INT,
    CONSTRAINT FK_EMPLOYEE_SUPERIOR FOREIGN KEY (SUPERIOR_FK) REFERENCES EMPLOYEES (EMPLOYEE_ID)
);

--ceo
INSERT INTO EMPLOYEES (FIRST_NAME, LAST_NAME) VALUES('Kamil', 'Œlimak');

--superiors
INSERT INTO EMPLOYEES (FIRST_NAME, LAST_NAME, SUPERIOR_FK) VALUES('Ryszard', 'Nowak', 1);
INSERT INTO EMPLOYEES (FIRST_NAME, LAST_NAME, SUPERIOR_FK) VALUES('Adam', 'Kowalski', 1);

--superiors
INSERT INTO EMPLOYEES (FIRST_NAME, LAST_NAME, SUPERIOR_FK) VALUES('Tomasz', 'Nowak', 2);
INSERT INTO EMPLOYEES (FIRST_NAME, LAST_NAME, SUPERIOR_FK) VALUES('Beata', 'Kowalska', 3);

--1.1.1
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, S.FIRST_NAME + ' '+ S.LAST_NAME AS SUPERIOR
FROM EMPLOYEES AS E
LEFT JOIN EMPLOYEES AS S ON E.SUPERIOR_FK = S.EMPLOYEE_ID;

--1.1.2
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (
	SELECT DISTINCT(SUPERIOR_FK) FROM EMPLOYEES
	WHERE SUPERIOR_FK IS NOT NULL
);
