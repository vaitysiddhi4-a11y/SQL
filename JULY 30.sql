CREATE DATABASE EMPLOYEE;
USE EMPLOYEE;
CREATE TABLE Employee (
EmployeeId INT PRIMARY KEY,
FullName VARCHAR(45) NOT NULL,
Department VARCHAR(45) NOT NULL,
Salary float NOT NULL,
Gender VARCHAR(45) NOT NULL,
Age INT NOT NULL
);
SELECT * FROM EMPLOYEE;
INSERT INTO Employee values
(1001,"John Doe","IT",35000,"Male",25),
(1002, 'Mary Smith', 'HR', 45000, 'Female', 27),
(1003, 'James Brown', 'Finance', 50000, 'Male', 28),
(1004, 'Mike Walker', 'Finance', 50000, 'Male', 28),
(1005, 'Linda Jones', 'HR', 75000, 'Female', 26),
(1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25),
(1007, 'Priyanka Dewangan', 'HR', 45000, 'Female', 27),
(1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28),
(1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28),
(1010, 'Hina Sharma', 'HR', 75000, 'Female', 26);
SELECT * FROM EMPLOYEE;
CREATE TABLE Projects (
ProjectId INT PRIMARY KEY AUTO_INCREMENT,
ProjectName VARCHAR(200) NOT NULL,
EmployeeId INT,
StartDate DATETIME,
EndDate DATETIME
);
SELECT * FROM EMPLOYEE;
INSERT INTO Projects VALUES
(1,'Develop Ecommerse Website from scratch', 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
(2,'WordPress Website for our company', 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
(3,'Manage our Company Servers', 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
(4,'Hosting account is not working', 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
(5,'MySQL database from my desktop application', 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
(6,'Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(),
INTERVAL 10 DAY)),
(7,'Migrate web application and database to new server', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5
DAY)),
(8,'Android Application development', 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
(9,'Hosting account is not working', 1001, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
(10,'MySQL database from my desktop application', 1008, NOW(), DATE_ADD(NOW(), INTERVAL 15
DAY)),
(11,'Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(),
INTERVAL 10 DAY));
SELECT * FROM PROJECTS;
CREATE TABLE Address
(
AddressId INT PRIMARY KEY AUTO_INCREMENT,
EmployeeId INT,
Country VARCHAR(50),
State VARCHAR(50),
City VARCHAR(50)
);
select * FROM ADDRESS;
INSERT INTO Address (EmployeeId, Country, State, City) Values (1001, 'India', 'Odisha', 'BBSR');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1002, 'India', 'Maharashtra', 'Mumbai');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1003, 'India', 'Maharashtra', 'Pune');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1004, 'India', 'Odisha', 'Cuttack');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1005, 'India', 'Maharashtra', 'Nagpur');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1006, 'India', 'Odisha', 'Cuttack');
SELECT * FROM ADDRESS;
SELECT * FROM ADDRESS;
DELETE FROM ADDRESS WHERE ADDRESSID=7;
ALTER TABLE EMPLOYEE;
ADD LOCATION VARCHAR(50);
ALTER TABLE EMPLOYEE ADD LOCATION VARCHAR(50);
SELECT * FROM employee;
ALTER TABLE EMPLOYEE ADD SERIAL_NO INT FIRST;
ALTER TABLE EMPLOYEE ADD TITLE VARCHAR(5) AFTER EMPLOYEEID;
ALTER TABLE EMPLOYEE DROP LOCATION;
ALTER TABLE employee DROP SERIAL_NO,DROP TITLE;
ALTER TABLE EMPLOYEE MODIFY FULLNAME VARCHAR(55) UNIQUE;
DESC EMPLOYEE;
ALTER TABLE EMPLOYEE CHANGE COLUMN DEPARTMENT DEPT VARCHAR(40);
ALTER TABLE EMPLOYEE RENAME TO EMP;
DESC EMP;
TRUNCATE TABLE PROJECTS;
SELECT * FROM PROJECTS;
ALTER TABLE EMP ADD LOCATION VARCHAR (30);
select * FROM EMP;
UPDATE EMP SET LOCATION = "THANE";  
USE EMPLOYEE;
SELECT * FROM EMP;
use employee;
alter table emp add title varchar(4);
select * from emp;
update emp set title ="Mr.";
update emp set title ="Mrs." where gender ="female";
update emp set salary ="55000" where fullname ="Mary Smith";
DELETE FROM EMP WHERE EMPLOYEEID =1010;
SELECT * FROM EMP ORDER BY FULLNAME;
SELECT * FROM EMP ORDER BY EMPLOYEEID DESC;
select * FROM EMP ORDER BY FULLNAME LIMIT 3;
SELECT * FROM EMP LIMIT 5,3;
SELECT * FROM EMP LIMIT 2,5;
SELECT * FROM EMP LIMIT 5 OFFSET 2;
select * FROM EMP WHERE EMPLOYEEID % 2 = 0;
SELECT * FROM EMP WHERE SALARY >50000;
SELECT FULLNAME,SALARY,(SALARY*0.05) AS BONUS FROM EMP;
SELECT MAX(SALARY) FROM EMP;
select MIN(SALARY) FROM EMP;
SELECT AVG(SALARY) FROM EMP;
SELECT SUM(SALARY) FROM EMP;
SELECT * FROM PROJECTS;
SELECT * FROM PROJECTS WHERE EMPLOYEEID IS NULL;
SELECT * FROM PROJECTS WHERE EMPLOYEEID IS NOT NULL;
SELECT DEPT,COUNT(DEPT) FROM EMP GROUP BY DEPT;
SELECT DEPT,COUNT(*) FROM EMP GROUP BY DEPT;
SELECT GENDER,COUNT(GENDER) FROM EMP GROUP BY GENDER;
SELECT DEPT,SUM(SALARY) FROM EMP GROUP BY DEPT;
SELECT DEPT, TRUNCATE(AVG(AGE),0) FROM EMP GROUP BY DEPT;
SELECT DEPT,AVG(AGE) FROM EMP GROUP BY DEPT;
SELECT * FROM EMP;
use employee;
select distinct dept from emp;
select distinct gender from emp;
select distinct age from emp;
select distinct dept,gender from emp;
select * from emp where age not in (23,28);
select * from emp where age in (23,28);
select * from emp where salary between 40000 and 60000;
select * from emp where age between 25 and 28;
select * from emp where employeeid in (1004,1007,1003,1010);
select * from emp where age between 25 and 28;
select * from emp where employeeid not in (1004,1007,1003,1010);
SELECT * FROM EMP WHERE FULLNAME LIKE "P%";
SELECT * FROM EMP WHERE FULLNAME LIKE "%Y";
SELECT * FROM EMP WHERE FULLNAME LIKE "%I%";
SELECT * FROM EMP WHERE FULLNAME LIKE "_I%";
SELECT * FROM EMP WHERE FULLNAME LIKE "%N__";
SELECT * FROM EMP WHERE FULLNAME NOT LIKE "P%";
SELECT * FROM PROJECTS WHERE EMPLOYEEID IS NULL;
SELECT * FROM PROJECTS WHERE PROJECTNAME IS NULL;
SELECT * FROM PROJECTS WHERE EMPLOYEEID IS NOT NULL;
SELECT * FROM EMP LIMIT 5;
SELECT * FROM EMP ORDER BY AGE;
SELECT DEPT FROM EMP GROUP BY DEPT;
SELECT DEPT, COUNT(*) FROM EMP 
GROUP BY DEPT HAVING COUNT(*)>3;
SELECT DEPT, COUNT(*) FROM EMP 
GROUP BY DEPT HAVING COUNT(*)=2;
SELECT CITY,COUNT(*) FROM ADDRESS GROUP BY CITY HAVING COUNT(*)>1;
SELECT * FROM PROJECTS;
SELECT DATEDIFF(ENDDATE,STARTDATE) AS DURATION FROM PROJECTS;
SELECT DATEDIFF(ENDDATE,STARTDATE) AS DURATION,COUNT(*) FROM PROJECTS
GROUP BY DATEDIFF(ENDDATE,STARTDATE);
SELECT DATEDIFF(ENDDATE,STARTDATE) AS DURATION,COUNT(*) FROM PROJECTS
GROUP BY DATEDIFF(ENDDATE,STARTDATE) HAVING COUNT(*)>=2;
SELECT DATEDIFF(ENDDATE,STARTDATE) AS DURATION,COUNT(*) FROM PROJECTS
WHERE EMPLOYEEID>1004
GROUP BY DATEDIFF(ENDDATE,STARTDATE) HAVING COUNT(*)>=2;
USE EMPOLYEE;
use employee;
create table voter_list
(voter_id int ,
names varchar(30),
age int check(age>=18) );
desc voter_list;
select * from voter_list;
insert into voter_list values
(20067, "anuja patil",18);
select * from projects where employeeid is null;
select * from projects where employeeid is not null;
create table voter_list_2
(voter_id int ,
names varchar(30),
age int check(age>=18),
email_id varchar(30) default "dummy@gmail.com" );
desc voter_list_2;
select * from voter_list_2;
insert into voter_list_2 values
(20067, "anuja patil",18, "anujaP@gmail.com"),
(20068, "kamlesh joshi",44, default);
show tables;
select *, concat(fullname,"-",employeeid) as specific_code from emp;
select fullname, lower(fullname) from emp;
select fullname, upper(fullname) from emp;
select fullname, replace(fullname,"Mohanty","kulkarni") as new_name from emp;
UPDATE EMP SET FULLNAME = "SAMBIT KULKARNI" WHERE EMPLOYEEID = 1008;
UPDATE EMP SET FULLNAME = "ANURAG KULKARNI" WHERE EMPLOYEEID = 1006;
SELECT * FROM EMP;
SELECT LENGTH(FULLNAME) FROM EMP;
SELECT LENGTH(FULLNAME) FROM EMP WHERE EMPLOYEEID = 1008;
SELECT FULLNAME, LENGTH(FULLNAME) FROM EMP WHERE EMPLOYEEID = 1008;
SELECT SUBSTRING("MARY SMITH",2,3);
SELECT FULLNAME, SUBSTRING(FULLNAME, 2,3) AS PARTIALL,
LENGTH(SUBSTRING(FULLNAME,2,3)) AS LENGTH FROM EMP; 