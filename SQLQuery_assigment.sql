
create database peloniodb
use peloniodb

create table INSTRUCTOR
(EmpID int primary key, 
LastName varchar(30),
FirstName varchar(30))

ALTER TABLE INSTRUCTOR
ALTER COLUMN FirstName varchar(30) NOT NULL 

ALTER TABLE INSTRUCTOR
Add EmpStatus varchar(30)

ALTER TABLE INSTRUCTOR
Add Hiredate datetime

insert into INSTRUCTOR
values
(5, 'Santos', 'Jolly', 'R', null)

select * from INSTRUCTOR

create table FACULTY
(EmpID int constraint f_pk primary key identity (10, 1),
FName varchar(30),
MName varchar(30),
LName varchar(30)
)

ALTER TABLE FACULTY
add SupervisorID int 

ALTER TABLE FACULTY
add constraint sup_FK foreign key(SupervisorID)
references FACULTY(EmpID)

alter table Faculty
add BDate date NOT NULL

alter table Faculty
add EmpRank varchar(30) NOT NULL

alter table Faculty
add Position varchar(50) NOT NULL

ALTER TABLE FACULTY
Add EmploymentStatus varchar(1) check (EmploymentStatus in ('R', 'P', 'C'))

ALTER TABLE faculty
Add Hiredate datetime NOT NULL default getdate()

alter table Faculty
add Salary decimal(10,2) NOT NULL

alter table Faculty
add RATA decimal(10,2) 


create table COLLEGE
(
CollegeCode varchar(10) primary key
)

alter table COLLEGE
add CollegeName varchar(70)

alter table FACULTY
add ColCode varchar(10)

alter table FACULTY
add constraint colcode_fk foreign key(ColCode)
references COLLEGE(CollegeCode)

INSERT INTO COLLEGE (CollegeCode, CollegeName)
values
('CAL', 'College of Arts and Letters')

INSERT INTO COLLEGE (CollegeCode, CollegeName)
values
('CICT', 'College of Information and Communication Technology')

INSERT INTO COLLEGE (CollegeCode, CollegeName)
values
('CIT', 'College of Industrial Technology')

INSERT INTO COLLEGE (CollegeCode, CollegeName)
values
('COE', 'College of Engineering')

INSERT INTO COLLEGE (CollegeCode, CollegeName)
values
('CON', 'College of Nursing')


SET IDENTITY_INSERT Faculty ON;
SELECT * FROM college
SELECT * FROM FACULTY

INSERT INTO FACULTY(EmpID, FName, MName, LName, BDate, EmpRank, Position, EmploymentStatus, HireDate, Salary, RATA, SupervisorID, ColCode) 
VALUES (100, 'Keno', 'C', 'Piad','1985-05-04',
'Professor II', 'Dean', 'R' , '2010-05-06', 
98000.00, 15000.00, null,  'CICT')

UPDATE Faculty
SET RATA = 15000.00
WHERE EmpID = 100

INSERT INTO FACULTY(EmpID, FName, MName, LName, BDate, EmpRank, Position, EmploymentStatus, HireDate, Salary, RATA, SupervisorID, ColCode) 
VALUES (101, 'Digna', 'S', 'Evale','1980-06-25',
'Professor V', 'College Secretary', 'R' , '2000-06-06',
122000.00, 10000.00, 100,  'CICT')

UPDATE Faculty
SET RATA = 10000.00
WHERE EmpID = 101

INSERT INTO FACULTY(EmpID, FName, MName, LName, BDate, EmpRank, Position, EmploymentStatus, HireDate, Salary, RATA, SupervisorID, ColCode) 
VALUES (102, 'Rose', 'C', 'Mendoza','1980-05-25',
'Professor II', 'Department Head', 'R' , '2001-06-10',
102000.00, 10000.00, 100,  'CICT')

UPDATE Faculty
SET RATA = 10000.00
WHERE EmpID = 102

INSERT INTO FACULTY(EmpID, FName, MName, LName, BDate, EmpRank, Position, EmploymentStatus, HireDate, Salary, RATA, SupervisorID, ColCode) 
VALUES (103, 'Ana', 'S', 'Cruz','1989-05-25',
' Associate Professor II', 'Dean', 'R' , '2010-02-10',
54000.00, 15000.00, NULL,  'CON')

UPDATE Faculty
SET RATA = 15000.00
WHERE EmpID = 103

INSERT INTO FACULTY(EmpID, FName, MName, LName, BDate, EmpRank, Position, EmploymentStatus, HireDate, Salary, RATA, SupervisorID, ColCode) 
VALUES (104, 'John', 'C', 'De Vera','1995-08-04',
'Instructor III', 'Faculty', 'R' , '2011-03-15',
38000.00, NULL, 104,  'CON')

INSERT INTO FACULTY (EmpID, Fname, MName, LName, BDate, EmpRank, Position, EmploymentStatus, Hiredate, Salary, RATA, SupervisorID, ColCode)
VALUES ('105', 'Melanie', 'P', 'Santos', '1981-03-28',
'Associate Professor II', 'Department Head', 'R', '2001-06-10',
54000.00, NULL, 103, 'CICT')

INSERT INTO FACULTY (EmpID, Fname, MName, LName, BDate, EmpRank, Position, EmploymentStatus, Hiredate, Salary, RATA, SupervisorID, ColCode)
VALUES ('107', 'Rina', 'C', 'Delos Reyes', '1980-08-25',
'Professor III', 'Dean', 'R', '2002-10-02',
112000.00, 10000.00, NULL, 'COE')

INSERT INTO FACULTY (EmpID, Fname, MName, LName, BDate, EmpRank, Position, EmploymentStatus, Hiredate, Salary, RATA, SupervisorID, ColCode)
VALUES ('109', 'Robert', 'C', 'Gonzales', '1990-05-21',
'Instructor I', 'Faculty', 'C', '2015-06-10',
22000.00, NULL, 103, 'CON')

INSERT INTO FACULTY (EmpID, Fname, MName, LName, BDate, EmpRank, Position, EmploymentStatus, Hiredate, Salary, RATA, SupervisorID, ColCode)
VALUES ('110', 'Gabriel', 'C', 'Canlas', '1994-04-23',
'Instructor II', 'Faculty', 'R', '2007-06-10',
32000.00, NULL, 107, 'COE')

INSERT INTO FACULTY (EmpID, Fname, MName, LName, BDate, EmpRank, Position, EmploymentStatus, Hiredate, Salary, RATA, SupervisorID, ColCode)
VALUES ('111', 'Jay', 'P', 'Zamora', '1991-02-25',
'Associate Professor I', 'Faculty', 'C', '2001-06-10',
42000.00, NULL, 107, 'COE')
