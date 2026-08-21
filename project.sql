CREATE DATABASE Banking_Management_System;
USE Banking_Management_System;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    city VARCHAR(50),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    occupation VARCHAR(50),
    annual_income DECIMAL(12,2),
    customer_since DATE
);
DESC Customers;
CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    branch_type VARCHAR(30),
    manager_name VARCHAR(100)
);
DESC Branches;
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    account_type VARCHAR(30) NOT NULL,
    opening_date DATE NOT NULL,
    balance DECIMAL(15,2) DEFAULT 0.00,
    account_status VARCHAR(20) DEFAULT 'Active',

    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),

    FOREIGN KEY (branch_id)
        REFERENCES Branches(branch_id)
);
DESC Accounts;
show tables;
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_date DATETIME NOT NULL,
    transaction_type VARCHAR(30) NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    payment_mode VARCHAR(30),
    transaction_status VARCHAR(20) DEFAULT 'Success',
    merchant_category VARCHAR(50),
    location VARCHAR(50),

    FOREIGN KEY (account_id)
        REFERENCES Accounts(account_id),

    CHECK (amount > 0)
);
DESC Transactions;
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    loan_type VARCHAR(30) NOT NULL,
    loan_amount DECIMAL(15,2) NOT NULL,
    interest_rate DECIMAL(5,2),
    loan_date DATE NOT NULL,
    tenure_months INT,
    emi_amount DECIMAL(12,2),
    loan_status VARCHAR(20) DEFAULT 'Active',
    outstanding_amount DECIMAL(15,2),

    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),

    CHECK (loan_amount > 0),
    CHECK (interest_rate >= 0),
    CHECK (outstanding_amount >= 0)
);
DESC Loans;
CREATE TABLE Loan_Payments (
    payment_id INT PRIMARY KEY,
    loan_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(12,2) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'Paid',
    days_overdue INT DEFAULT 0,

    FOREIGN KEY (loan_id)
        REFERENCES Loans(loan_id),

    CHECK (payment_amount > 0),
    CHECK (days_overdue >= 0)
);
DESC Loan_Payments;
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    branch_id INT NOT NULL,
    employee_name VARCHAR(100) NOT NULL,
    designation VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(12,2),
    joining_date DATE,

    FOREIGN KEY (branch_id)
        REFERENCES Branches(branch_id),

    CHECK (salary >= 0)
);
DESC Employees;
SHOW TABLES;
USE Banking_Management_System;
INSERT INTO Customers
(customer_id, customer_name, gender, date_of_birth, city, phone, email, occupation, annual_income, customer_since)
VALUES
(101, 'Aarav Sharma', 'Male', '1995-04-12', 'Mumbai', '9876501001', 'aarav.sharma@gmail.com', 'Software Engineer', 950000, '2021-06-15'),
(102, 'Priya Mehta', 'Female', '1992-08-25', 'Pune', '9876501002', 'priya.mehta@gmail.com', 'Financial Analyst', 1200000, '2020-03-10'),
(103, 'Rohan Patil', 'Male', '1998-01-17', 'Mumbai', '9876501003', 'rohan.patil@gmail.com', 'Business Owner', 1500000, '2022-01-20'),
(104, 'Sneha Joshi', 'Female', '1996-11-05', 'Nashik', '9876501004', 'sneha.joshi@gmail.com', 'Teacher', 650000, '2021-09-12'),
(105, 'Aditya Kulkarni', 'Male', '1990-06-21', 'Pune', '9876501005', 'aditya.kulkarni@gmail.com', 'Doctor', 2200000, '2019-05-18'),
(106, 'Neha Desai', 'Female', '1994-03-14', 'Mumbai', '9876501006', 'neha.desai@gmail.com', 'HR Manager', 1100000, '2022-07-25'),
(107, 'Karan Shah', 'Male', '1988-12-09', 'Ahmedabad', '9876501007', 'karan.shah@gmail.com', 'Entrepreneur', 1800000, '2018-11-30'),
(108, 'Ananya Rao', 'Female', '1999-07-19', 'Bangalore', '9876501008', 'ananya.rao@gmail.com', 'Data Analyst', 850000, '2023-02-14'),
(109, 'Vikram Singh', 'Male', '1987-05-28', 'Delhi', '9876501009', 'vikram.singh@gmail.com', 'Consultant', 1350000, '2019-08-22'),
(110, 'Isha Nair', 'Female', '1997-09-03', 'Mumbai', '9876501010', 'isha.nair@gmail.com', 'Marketing Manager', 900000, '2022-10-05'),
(111, 'Rahul Verma', 'Male', '1993-02-16', 'Delhi', '9876501011', 'rahul.verma@gmail.com', 'Business Analyst', 1050000, '2020-12-11'),
(112, 'Pooja Iyer', 'Female', '1991-10-30', 'Bangalore', '9876501012', 'pooja.iyer@gmail.com', 'CA', 1600000, '2019-04-17'),
(113, 'Siddharth Jain', 'Male', '1996-04-08', 'Jaipur', '9876501013', 'siddharth.jain@gmail.com', 'Trader', 2000000, '2021-01-08'),
(114, 'Meera Kapoor', 'Female', '1995-12-12', 'Mumbai', '9876501014', 'meera.kapoor@gmail.com', 'Designer', 700000, '2023-05-20'),
(115, 'Arjun Malhotra', 'Male', '1989-07-07', 'Pune', '9876501015', 'arjun.malhotra@gmail.com', 'Company Director', 2500000, '2017-09-15');
SELECT * FROM Customers;
INSERT INTO Branches
(branch_id, branch_name, city, state, branch_type, manager_name)
VALUES
(1, 'Fort Branch', 'Mumbai', 'Maharashtra', 'Urban', 'Rajesh Kumar'),
(2, 'Andheri Branch', 'Mumbai', 'Maharashtra', 'Urban', 'Sunita Rao'),
(3, 'Pune Central Branch', 'Pune', 'Maharashtra', 'Urban', 'Amit Joshi'),
(4, 'Ahmedabad Main Branch', 'Ahmedabad', 'Gujarat', 'Urban', 'Vivek Shah'),
(5, 'Bangalore Central Branch', 'Bangalore', 'Karnataka', 'Urban', 'Kavita Nair');
SELECT * FROM Branches;
INSERT INTO Accounts
(account_id, customer_id, branch_id, account_type, opening_date, balance, account_status)
VALUES
(10001, 101, 1, 'Savings', '2021-06-20', 85000.00, 'Active'),
(10002, 102, 3, 'Savings', '2020-03-15', 145000.00, 'Active'),
(10003, 103, 1, 'Current', '2022-01-25', 320000.00, 'Active'),
(10004, 104, 3, 'Savings', '2021-09-15', 45000.00, 'Active'),
(10005, 105, 3, 'Savings', '2019-05-20', 580000.00, 'Active'),
(10006, 106, 2, 'Salary', '2022-07-30', 92000.00, 'Active'),
(10007, 107, 4, 'Current', '2018-12-05', 450000.00, 'Active'),
(10008, 108, 5, 'Savings', '2023-02-18', 65000.00, 'Active'),
(10009, 109, 1, 'Savings', '2019-08-25', 175000.00, 'Active'),
(10010, 110, 2, 'Savings', '2022-10-10', 72000.00, 'Active'),
(10011, 111, 1, 'Salary', '2020-12-15', 110000.00, 'Active'),
(10012, 112, 5, 'Savings', '2019-04-20', 225000.00, 'Active'),
(10013, 113, 4, 'Current', '2021-01-12', 390000.00, 'Active'),
(10014, 114, 2, 'Savings', '2023-05-25', 38000.00, 'Active'),
(10015, 115, 3, 'Savings', '2017-09-20', 620000.00, 'Active'),
(10016, 101, 1, 'Fixed Deposit', '2022-07-01', 250000.00, 'Active'),
(10017, 105, 3, 'Fixed Deposit', '2020-08-10', 500000.00, 'Active'),
(10018, 107, 4, 'Savings', '2021-04-12', 180000.00, 'Active');
SELECT * FROM ACCOUNTS;
INSERT INTO Transactions
(transaction_id, account_id, transaction_date, transaction_type, amount, payment_mode, transaction_status, merchant_category, location)
VALUES
(50001, 10001, '2025-01-05 10:15:00', 'Deposit', 50000, 'UPI', 'Success', 'Salary', 'Mumbai'),
(50002, 10001, '2025-01-08 14:20:00', 'Withdrawal', 12000, 'ATM', 'Success', 'Cash Withdrawal', 'Mumbai'),
(50003, 10001, '2025-01-15 09:45:00', 'Transfer', 25000, 'NEFT', 'Success', 'Transfer', 'Mumbai'),

(50004, 10002, '2025-01-10 11:30:00', 'Deposit', 100000, 'NEFT', 'Success', 'Salary', 'Pune'),
(50005, 10002, '2025-01-18 16:10:00', 'Payment', 18000, 'UPI', 'Success', 'Shopping', 'Pune'),

(50006, 10003, '2025-01-04 12:15:00', 'Deposit', 200000, 'NEFT', 'Success', 'Business', 'Mumbai'),
(50007, 10003, '2025-01-12 18:40:00', 'Transfer', 125000, 'IMPS', 'Success', 'Business Transfer', 'Mumbai'),
(50008, 10003, '2025-01-20 19:05:00', 'Payment', 15000, 'UPI', 'Failed', 'Utilities', 'Mumbai'),

(50009, 10004, '2025-01-07 09:30:00', 'Deposit', 35000, 'UPI', 'Success', 'Salary', 'Nashik'),

(50010, 10005, '2025-01-03 10:00:00', 'Deposit', 250000, 'NEFT', 'Success', 'Salary', 'Pune'),
(50011, 10005, '2025-01-11 13:25:00', 'Transfer', 180000, 'IMPS', 'Success', 'Investment', 'Pune'),
(50012, 10005, '2025-01-19 15:50:00', 'Payment', 95000, 'UPI', 'Success', 'Shopping', 'Pune'),

(50013, 10006, '2025-01-06 08:45:00', 'Deposit', 75000, 'NEFT', 'Success', 'Salary', 'Mumbai'),
(50014, 10006, '2025-01-16 17:20:00', 'Payment', 22000, 'UPI', 'Success', 'Travel', 'Mumbai'),

(50015, 10007, '2025-01-02 11:10:00', 'Deposit', 500000, 'NEFT', 'Success', 'Business', 'Ahmedabad'),
(50016, 10007, '2025-01-09 14:45:00', 'Transfer', 275000, 'IMPS', 'Success', 'Business Transfer', 'Ahmedabad'),
(50017, 10007, '2025-01-17 22:15:00', 'Payment', 150000, 'UPI', 'Failed', 'Electronics', 'Ahmedabad'),

(50018, 10008, '2025-01-05 10:40:00', 'Deposit', 60000, 'UPI', 'Success', 'Salary', 'Bangalore'),
(50019, 10008, '2025-01-13 12:30:00', 'Payment', 12000, 'UPI', 'Success', 'Shopping', 'Bangalore'),

(50020, 10009, '2025-01-04 09:15:00', 'Deposit', 120000, 'NEFT', 'Success', 'Salary', 'Delhi'),
(50021, 10009, '2025-01-14 16:00:00', 'Transfer', 90000, 'IMPS', 'Success', 'Investment', 'Delhi'),

(50022, 10010, '2025-01-08 11:45:00', 'Deposit', 70000, 'NEFT', 'Success', 'Salary', 'Mumbai'),
(50023, 10010, '2025-01-19 18:30:00', 'Payment', 16000, 'UPI', 'Success', 'Shopping', 'Mumbai'),

(50024, 10011, '2025-01-06 09:00:00', 'Deposit', 95000, 'NEFT', 'Success', 'Salary', 'Delhi'),
(50025, 10011, '2025-01-15 14:15:00', 'Transfer', 45000, 'UPI', 'Success', 'Investment', 'Delhi'),

(50026, 10012, '2025-01-03 10:20:00', 'Deposit', 180000, 'NEFT', 'Success', 'Salary', 'Bangalore'),
(50027, 10012, '2025-01-11 15:45:00', 'Transfer', 110000, 'IMPS', 'Success', 'Investment', 'Bangalore'),

(50028, 10013, '2025-01-02 12:00:00', 'Deposit', 300000, 'NEFT', 'Success', 'Business', 'Ahmedabad'),
(50029, 10013, '2025-01-10 20:10:00', 'Transfer', 200000, 'IMPS', 'Success', 'Business Transfer', 'Ahmedabad'),
(50030, 10013, '2025-01-18 21:30:00', 'Payment', 125000, 'UPI', 'Failed', 'Luxury Goods', 'Ahmedabad'),

(50031, 10014, '2025-01-05 09:30:00', 'Deposit', 30000, 'UPI', 'Success', 'Salary', 'Mumbai'),
(50032, 10014, '2025-01-16 17:50:00', 'Payment', 8500, 'UPI', 'Success', 'Shopping', 'Mumbai'),

(50033, 10015, '2025-01-01 10:00:00', 'Deposit', 450000, 'NEFT', 'Success', 'Business', 'Pune'),
(50034, 10015, '2025-01-08 13:15:00', 'Transfer', 350000, 'IMPS', 'Success', 'Investment', 'Pune'),
(50035, 10015, '2025-01-20 19:45:00', 'Payment', 175000, 'UPI', 'Success', 'Luxury Goods', 'Pune'),

(50036, 10016, '2025-01-12 11:20:00', 'Deposit', 100000, 'NEFT', 'Success', 'Investment', 'Mumbai'),
(50037, 10017, '2025-01-14 10:50:00', 'Deposit', 250000, 'NEFT', 'Success', 'Investment', 'Pune'),
(50038, 10018, '2025-01-07 12:40:00', 'Deposit', 150000, 'NEFT', 'Success', 'Business', 'Ahmedabad');
SELECT COUNT(*) AS total_transactions
FROM Transactions;
SELECT * FROM transactions;
INSERT INTO Loans
(loan_id, customer_id, loan_type, loan_amount, interest_rate, loan_date, tenure_months, emi_amount, loan_status, outstanding_amount)
VALUES
(7001, 101, 'Personal', 300000, 11.50, '2023-02-10', 36, 9890.00, 'Active', 185000),
(7002, 102, 'Home', 5000000, 8.25, '2021-07-15', 240, 42600.00, 'Active', 4200000),
(7003, 103, 'Business', 2500000, 10.75, '2022-04-20', 84, 42500.00, 'Active', 1800000),
(7004, 104, 'Education', 800000, 9.25, '2022-08-12', 60, 16650.00, 'Active', 550000),
(7005, 105, 'Home', 7000000, 8.10, '2020-03-18', 240, 59000.00, 'Active', 5100000),
(7006, 107, 'Business', 3000000, 11.25, '2021-11-05', 72, 57500.00, 'Overdue', 2200000),
(7007, 109, 'Personal', 500000, 12.00, '2023-06-10', 48, 13200.00, 'Active', 380000),
(7008, 112, 'Vehicle', 1200000, 9.50, '2022-09-25', 60, 25200.00, 'Active', 750000),
(7009, 113, 'Business', 4000000, 10.50, '2021-05-15', 84, 68000.00, 'Default', 3200000),
(7010, 115, 'Home', 8000000, 7.90, '2019-12-10', 240, 66000.00, 'Active', 5800000);
SELECT COUNT(*) AS total_loans
FROM Loans;
SELECT * FROM Loans;
INSERT INTO Loan_Payments
(payment_id, loan_id, payment_date, payment_amount, payment_status, days_overdue)
VALUES
(9001, 7001, '2025-01-05', 9890, 'Paid', 0),
(9002, 7002, '2025-01-07', 42600, 'Paid', 0),
(9003, 7003, '2025-01-08', 42500, 'Paid', 0),
(9004, 7004, '2025-01-10', 16650, 'Late', 12),
(9005, 7005, '2025-01-12', 59000, 'Paid', 0),
(9006, 7006, '2025-01-05', 57500, 'Late', 25),
(9007, 7006, '2025-02-05', 57500, 'Missed', 45),
(9008, 7007, '2025-01-15', 13200, 'Paid', 0),
(9009, 7008, '2025-01-18', 25200, 'Paid', 0),
(9010, 7009, '2025-01-05', 68000, 'Missed', 60),
(9011, 7010, '2025-01-08', 66000, 'Paid', 0);
SELECT * FROM Loan_Payments;
INSERT INTO Employees
(employee_id, branch_id, employee_name, designation, department, salary, joining_date)
VALUES
(3001, 1, 'Raj Malhotra', 'Branch Manager', 'Management', 1200000, '2018-04-10'),
(3002, 1, 'Nisha Sharma', 'Relationship Manager', 'Sales', 750000, '2020-06-15'),
(3003, 2, 'Amit Verma', 'Branch Manager', 'Management', 1150000, '2019-02-20'),
(3004, 2, 'Riya Kapoor', 'Loan Officer', 'Loans', 680000, '2021-08-12'),
(3005, 3, 'Sanjay Patil', 'Branch Manager', 'Management', 1100000, '2017-11-05'),
(3006, 3, 'Pallavi Joshi', 'Relationship Manager', 'Sales', 720000, '2020-03-18'),
(3007, 4, 'Vishal Shah', 'Branch Manager', 'Management', 1250000, '2016-07-10'),
(3008, 4, 'Komal Mehta', 'Risk Analyst', 'Risk', 900000, '2022-01-15'),
(3009, 5, 'Deepak Rao', 'Branch Manager', 'Management', 1180000, '2018-09-20'),
(3010, 5, 'Asha Nair', 'Risk Analyst', 'Risk', 920000, '2021-05-25');
SELECT * FROM employees;
SELECT * FROM Customers
WHERE annual_income > 1000000;
SELECT * FROM Customers
WHERE city = 'Mumbai'
AND annual_income > 1000000;
USE Banking_Management_System;
show tables;
