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
