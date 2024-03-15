create database EunicePelonioSQL
use EunicePelonioSQL 

create table FACULTY
(EmpID int primary key,
FName varchar(30),
MName varchar(30),
LName varchar(30),
SupervisorID int, foreign key(SupervisorID) references FACULTY(EmpID),
BDate date NOT NULL,
EmpRank varchar(30) NOT NULL,
Position varchar(50) NOT NULL,
EmploymentStatus varchar(1) check (EmploymentStatus in ('R', 'P', 'C')),
Hiredate datetime NOT NULL default getdate(),
Salary decimal(10,2) NOT NULL,
RATA decimal(10,2),
)

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
('CAL', 'College of Arts and Letters'),
('CICT', 'College of Information and Communication Technology'),
('CIT', 'College of Industrial Technology'),
('COE', 'College of Engineering'),
('CON', 'College of Nursing')


SELECT * FROM college
SELECT * FROM FACULTY

INSERT INTO FACULTY(EmpID, FName, MName, LName, BDate, EmpRank, Position, EmploymentStatus, HireDate, Salary, RATA, SupervisorID, ColCode) 
VALUES (100, 'Keno', 'C', 'Piad','1985-05-04',
'Professor II', 'Dean', 'R' , '2010-05-06', 
102000.00, 15000.00, null, null),

(101, 'Digna', 'S', 'Evale','1980-06-25',
'Professor V', 'College Secretary', 'R' , '2000-06-06',
122000.00, 10000.00, 100,  'CICT'),

(102, 'Rose', 'C', 'Mendoza','1980-05-25',
'Professor II', 'Department Head', 'R' , '2001-06-10',
102000.00, 10000.00, 100,  'CICT'),

(103, 'Ana', 'S', 'Cruz','1989-05-25',
' Associate Professor II', 'Dean', 'R' , '2010-02-10',
54000.00, 15000.00, NULL,  'CON'),

(104, 'John', 'C', 'De Vera','1995-08-04',
'Instructor III', 'Faculty', 'R' , '2011-03-15',
38000.00, NULL, 103,  'CON'),

(105, 'Melanie', 'P', 'Santos', '1981-03-28',
'Associate Professor II', 'Department Head', 'R', '2001-06-10',
54000.00, NULL, 100, 'CICT'),

(107, 'Rina', 'C', 'Delos Reyes', '1980-08-25',
'Professor III', 'Dean', 'R', '2002-10-02',
112000.00, 10000.00, NULL, 'COE'),

(106, 'Robert', 'C', 'Gonzales', '1990-05-21',
'Instructor I', 'Faculty', 'C', '2015-06-10',
22000.00, NULL, 103, 'CON'),

(108, 'Gabriel', 'C', 'Canlas', '1994-04-23',
'Instructor II', 'Faculty', 'R', '2007-06-10',
32000.00, NULL, 107, 'COE'),

(109, 'Jay', 'P', 'Zamora', '1991-02-25',
'Associate Professor I', 'Faculty', 'C', '2001-06-10',
42000.00, NULL, 107, 'COE')



-- 1. Create a query that will display the complete name and their annual income including the 13th month pay.--
select Fname + ' ' + Mname + ' ' + Lname as "Complete Name", Salary*13/12 "13th month pay"
from Faculty

-- 2. Create a query that will display the first and last name as well as position of all faculty.--
select Fname, Lname, Position 
from Faculty

-- 3. Create a query that will display in just one column the position and the complete name of all the employees.--
select Fname + ' ' + Mname + ' ' + Lname as "Complete Name", Position 
from Faculty

 -- 4. Create a query that will display the first name and last name as well as tax of all the faculty. Assume that all are given 25 % tax.--
select Fname, Lname, Salary*0.25 as 'Tax'
from Faculty

-- 5. Create a query that will display the first name, last name and the net salary received of all the employees after deducting the 25% tax from the given salary.--
select Fname, Lname, Salary*0.75 as 'Net Pay'
from Faculty

-- 6. Create a query that will display the first name, last name of all the employees in CON. Make sure to display in the second column the college code.--
select Fname, Lname
from Faculty
Where ColCode = 'CON'

select CollegeCode 
From College
Where CollegeCode = 'CON'

-- 7. Create a query that will display the complete name of all the faculty and their rank. Name the column name as Name of Faculty and their Rank.--
select Fname + ' ' + Mname + ' ' + Lname + ' ' + ' is holding the position of '
+ EmpRank as "Name of Faculty and their Rank" 
from Faculty

-- 8. Same as query letter f but this time, display only the names of faculty whose rank contains the word PROFESSOR.--
select Fname
from Faculty 
where EmpRank LIKE '%PROFESSOR%'

-- 9. Create a query that will display the complete name all the CICT employees who is receiving 6-digit salary. Be sure to include the collegecode and their salary in the output.--
select Fname, Mname, Lname, ColCode
from Faculty 
where ColCode = 'CICT' AND Salary >= 100000 AND Salary < 1000000

-- 10. Create a query that will display the complete name, college code and employee rank of all in either COE or CON who is receiving RATA.--
select FName + ' ' + MName + ' ' + LName AS "Complete Name", ColCode, EmpRank 
from Faculty
where (ColCode = 'COE' OR ColCode = 'CON') AND RATA IS NOT NULL

-- 11. Create a query that will display the first name, last name and employee rank of all CICT faculty hired from January 1, 2000 to December 31, 2005.--
select fname, lname, EmpRank
from Faculty 
Where ColCode = 'CICT' AND HireDate >= '01-01-2000' AND HireDate <= '12-31-2005'

-- 12. Create a query that will display the first name, lastname and employee rank of all COE faculty hired after 2005.--
select Fname, Lname, EmpRank
from Faculty
Where Hiredate > '12-31-2005'

-- 13. Create a query that will display in just one column the complete name and the hiredate of all the employees.--
select FName + ' ' + MName + ' ' + LName "Complete Name", HireDate
from Faculty

-- 14. Create a query that will display the first name and lastname and determine their number of months of service in the organization--
select CONCAT(Fname, ' ', Lname, ' no. of months of service in organization is ', DATEDIFF(month, HireDate, GETDATE())) AS "Employee's Month of Service"
from Faculty 

-- 15. Create a query that will determine the lowest salary in every college.--
select ISNULL(ColCode, 'Unknown'), MIN(Salary)
from Faculty
Group by ColCode 

-- 16. Create a query that will count the number of faculty per college.--
select ColCode, count (*) 'Number of Faculty' 
from Faculty
group by ColCode

-- 17. Create a query that will count the number of faculty who are receiving additional allowance (RATA).--
select count (RATA) 'Number of Faculty who are receiving RATA' 
from faculty

-- 18. Create a query that will display the college code, employee’s rank and count the number of faculty per rank.--
select ColCode, EmpRank, count(*) as "Number of faculty per Rank"
from Faculty
Group by Colcode, EmpRank

-- 19. Create a query that that will display the number of faculty hired in same month for each college.--
select ColCode, DATENAME(MONTH, HireDate) AS "Hire Month", COUNT(*) AS "Hired In Same Month"
from FACULTY
group by ColCode, DATENAME(MONTH, HireDate)

-- 20. The University will give a loyalty award to those who served in 10, 15, 20, 25, 30, 35, 40, 45 years in service.--
select Fname + ' ' + Lname as 'Loyalty Award for 10 years'
from Faculty
Where DATEDIFF(year, HireDate, GETDATE()) >=10 AND DATEDIFF(year, HireDate, GETDATE()) <15

select Fname + ' ' + Lname as 'Loyalty Award for 15 years'
from Faculty
Where DATEDIFF(year, HireDate, GETDATE()) >=15 AND DATEDIFF(year, HireDate, GETDATE()) <20

select Fname + ' ' + Lname as 'Loyalty Award for 20 years'
from Faculty
Where DATEDIFF(year, HireDate, GETDATE()) >=20 AND DATEDIFF(year, HireDate, GETDATE()) <25

select Fname + ' ' + Lname as 'Loyalty Award for 25 years'
from Faculty
Where DATEDIFF(year, HireDate, GETDATE()) >=25 AND DATEDIFF(year, HireDate, GETDATE()) <30

select Fname + ' ' + Lname as 'Loyalty Award for 30 years'
from Faculty
Where DATEDIFF(year, HireDate, GETDATE()) >=30 AND DATEDIFF(year, HireDate, GETDATE()) <35

select Fname + ' ' + Lname as 'Loyalty Award for 35 years'
from Faculty
Where DATEDIFF(year, HireDate, GETDATE()) >=35 AND DATEDIFF(year, HireDate, GETDATE()) <40

select Fname + ' ' + Lname as 'Loyalty Award for 40 years'
from Faculty
Where DATEDIFF(year, HireDate, GETDATE()) >=40 AND DATEDIFF(year, HireDate, GETDATE()) <45