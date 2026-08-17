create database companyDB;
use companyDB;
CREATE Table departments (
dept_id int primary key,
dept_name varchar(50) unique
);
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    age INT,
    salary DECIMAL(10,2),
    dept_id INT,
    city VARCHAR(50),
    joining_date DATE,
    email VARCHAR(100) UNIQUE,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
INSERT INTO Departments VALUES
(1, 'Data Science'),
(2, 'Finance'),
(3, 'Marketing'),
(4, 'HR'),
(5, 'IT');
INSERT INTO Employees VALUES
(101, 'Amit', 'Male', 25, 55000, 1, 'Mumbai', '2022-01-15', 'amit@company.com', 106),
(102, 'Priya', 'Female', 28, 65000, 1, 'Pune', '2021-06-20', 'priya@company.com', 106),
(103, 'Rahul', 'Male', 32, 75000, 2, 'Mumbai', '2020-03-10', 'rahul@company.com', 107),
(104, 'Sneha', 'Female', 26, 48000, 3, 'Thane', '2023-02-05', 'sneha@company.com', 108),
(105, 'Vikas', 'Male', 35, 90000, 5, 'Mumbai', '2019-08-12', 'vikas@company.com', NULL),
(106, 'Neha', 'Female', 40, 120000, 1, 'Mumbai', '2017-04-18', 'neha@company.com', NULL),
(107, 'Raj', 'Male', 38, 110000, 2, 'Pune', '2018-11-25', 'raj@company.com', NULL),
(108, 'Pooja', 'Female', 34, 85000, 3, 'Thane', '2020-09-15', 'pooja@company.com', NULL),
(109, 'Karan', 'Male', 29, 60000, 4, 'Mumbai', '2022-07-30', 'karan@company.com', 110),
(110, 'Anjali', 'Female', 36, 95000, 4, 'Pune', '2019-01-10', 'anjali@company.com', NULL);
select * from employees;
select emp_name,salary from employees;
select emp_name,  salary from employees where salary > 70000;
select emp_name, salary from employees where gender = 'female' and salary > 60000;
select emp_name, city from employees where city = 'mumbai' or city = 'pune';
select emp_name, city from employees where city in('mumbai','pune','thane');
select emp_name, city from employees where city not in ('mumbai','pune');
select emp_name, salary from employees where salary between 60000 and 90000;
select emp_name, age from employees where age between 25 and 30;
select emp_id, emp_name from employees where emp_name like 'a%';
select emp_id, emp_name from employees where emp_name like '%a';
select emp_id, emp_name from employees where emp_name like '%an%';
select distinct city from employees;
select emp_name, salary from employees order by salary desc;
select emp_name, salary from employees order by salary asc;
select emp_name, salary from employees order by salary desc limit 3;
select emp_name, salary from employees order by salary desc limit 3 offset 3;
select max(salary) as highest_salary from employees;
select max(salary) from employees;
select min(salary) from employees;
select min(salary) as lowest_salary from employees;
select avg(salary) from employees;
select sum(salary) as total_salary from employees;
select count(*) as total_employees from employees;

