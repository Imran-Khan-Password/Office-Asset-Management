Office Asset Management System

1. Create Database

CREATE DATABASE IF NOT EXISTS office_asset_management;
USE office_asset_management;


2. Table Creation

Department Table
CREATE TABLE department (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL
);

 Employee Table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50) NOT NULL,
    emp_email VARCHAR(50) UNIQUE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

Asset Table
CREATE TABLE asset (
    asset_id INT PRIMARY KEY AUTO_INCREMENT,
    asset_name VARCHAR(50) NOT NULL,
    asset_type VARCHAR(30),
    purchase_date DATE,
    asset_status VARCHAR(20) DEFAULT 'Available'
);

 Asset Assignment Table
CREATE TABLE asset_assignment (
    assign_id INT PRIMARY KEY AUTO_INCREMENT,
    asset_id INT,
    emp_id INT,
    assign_date DATE,
    return_date DATE,
    FOREIGN KEY (asset_id) REFERENCES asset(asset_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);


3. Data Insertion


Insert Departments
INSERT INTO department (dept_name) VALUES
('IT'),
('HR'),
('Finance');

Insert Employees
INSERT INTO employee (emp_name, emp_email, dept_id) VALUES
('Rahul Sharma', 'rahul@office.com', 1),
('Aisha Khan', 'aisha@office.com', 2),
('Vikram Patel', 'vikram@office.com', 1);

Insert Assets
INSERT INTO asset (asset_name, asset_type, purchase_date) VALUES
('Dell Laptop', 'Electronics', '2023-01-10'),
('HP Printer', 'Electronics', '2022-08-15'),
('Office Chair', 'Furniture', '2021-05-20');


4. Sample Assignment


INSERT INTO asset_assignment (asset_id, emp_id, assign_date, return_date)
VALUES
(1, 1, '2024-01-01', NULL),
(2, 2, '2024-02-10', NULL);


5. Data Retrieval Queries

 Available Assets
SELECT * FROM asset
WHERE asset_status = 'Available';

Employee with Department
SELECT e.emp_name, d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id;

Asset Assignment Details
SELECT a.asset_name, e.emp_name, aa.assign_date
FROM asset_assignment aa
JOIN asset a ON aa.asset_id = a.asset_id
JOIN employee e ON aa.emp_id = e.emp_id;


6. Advanced Queries


GROUP BY
SELECT asset_type, COUNT(*) AS total_assets
FROM asset
GROUP BY asset_type;

HAVING
SELECT asset_type, COUNT(*) AS total_assets
FROM asset
GROUP BY asset_type
HAVING COUNT(*) > 1;

Subquery
SELECT emp_name
FROM employee
WHERE emp_id IN (
    SELECT emp_id FROM asset_assignment
);


7. View Creation


CREATE VIEW asset_assignment_view AS
SELECT e.emp_name, a.asset_name, aa.assign_date, aa.return_date
FROM asset_assignment aa
JOIN employee e ON aa.emp_id = e.emp_id
JOIN asset a ON aa.asset_id = a.asset_id;

Display View
SELECT * FROM asset_assignment_view;

