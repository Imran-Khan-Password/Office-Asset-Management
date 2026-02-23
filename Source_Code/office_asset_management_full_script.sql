-- 1. Create Database
DROP DATABASE IF EXISTS office_asset_management;
CREATE DATABASE office_asset_management;
USE office_asset_management;

-- 2. Table Creation
CREATE TABLE department (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50) NOT NULL,
    emp_email VARCHAR(100) NOT NULL UNIQUE,
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id)
        REFERENCES department(dept_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE asset (
    asset_id INT PRIMARY KEY AUTO_INCREMENT,
    asset_name VARCHAR(50) NOT NULL,
    asset_type VARCHAR(30) NOT NULL,
    purchase_date DATE NOT NULL,
    asset_status ENUM('Available','Assigned','Under Maintenance')
        DEFAULT 'Available'
);

CREATE TABLE asset_assignment (
    assign_id INT PRIMARY KEY AUTO_INCREMENT,
    asset_id INT NOT NULL,
    emp_id INT NOT NULL,
    assign_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (asset_id)
        REFERENCES asset(asset_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (emp_id)
        REFERENCES employee(emp_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 3. Data Insertion
INSERT INTO department (dept_name) VALUES
('IT'),
('HR'),
('Finance');

INSERT INTO employee (emp_name, emp_email, dept_id) VALUES
('Rahul Sharma', 'rahul@office.com', 1),
('Aisha Khan', 'aisha@office.com', 2),
('Vikram Patel', 'vikram@office.com', 1);

INSERT INTO asset (asset_name, asset_type, purchase_date) VALUES
('Dell Laptop', 'Electronics', '2023-01-10'),
('HP Printer', 'Electronics', '2022-08-15'),
('Office Chair', 'Furniture', '2021-05-20');

-- 4. Transaction - Asset Assignment
START TRANSACTION;

SELECT asset_status
FROM asset
WHERE asset_id = 1
FOR UPDATE;

UPDATE asset
SET asset_status = 'Assigned'
WHERE asset_id = 1
AND asset_status = 'Available';

INSERT INTO asset_assignment (asset_id, emp_id, assign_date, return_date)
VALUES (1, 1, CURDATE(), NULL);

COMMIT;

-- 5. Basic Queries
SELECT * FROM asset
WHERE asset_status = 'Available';

SELECT e.emp_name, e.emp_email, d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id;

SELECT a.asset_name, e.emp_name, aa.assign_date, aa.return_date
FROM asset_assignment aa
JOIN asset a ON aa.asset_id = a.asset_id
JOIN employee e ON aa.emp_id = e.emp_id;

-- 6. Advanced Queries
SELECT asset_type, COUNT(*) AS total_assets
FROM asset
GROUP BY asset_type;

SELECT asset_type, COUNT(*) AS total_assets
FROM asset
GROUP BY asset_type
HAVING COUNT(*) > 1;

SELECT emp_name
FROM employee
WHERE emp_id IN (
    SELECT emp_id FROM asset_assignment
);

-- 7. View Creation
CREATE OR REPLACE VIEW asset_assignment_view AS
SELECT e.emp_name, a.asset_name, aa.assign_date, aa.return_date
FROM asset_assignment aa
JOIN employee e ON aa.emp_id = e.emp_id
JOIN asset a ON aa.asset_id = a.asset_id;

SELECT * FROM asset_assignment_view;
