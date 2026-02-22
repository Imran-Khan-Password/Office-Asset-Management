Office-Asset-Management


1. Project Overview
The Office Asset Management System is a relational database project developed using MySQL.The system is designed to manage office assets such as laptops, printers, and furniture, along with employee and department information.The project demonstrates practical implementation of database design, constraints, relationships, and advanced SQL queries.This system is database-driven and does not include a graphical user interface.



2. Problem Statement
In many offices, assets are managed manually using registers or Excel sheets. This leads to:
Data redundancy
Inconsistency in records
Poor tracking of assigned assets
Lack of security and integrity
Slow data retrieval


3. Objectives of the Project
The primary objective of this project is to design and implement a structured relational database using MySQL. It aims to demonstrate proper table design, enforce data integrity using constraints, implement relationships through foreign keys, and perform both basic and advanced SQL queries. The project also focuses on maintaining data accuracy and understanding real-world database implementation.
Design a structured relational database
Implement table relationships using Primary and Foreign Keys
Perform CRUD operations using SQL
Implement advanced queries (JOIN, GROUP BY, HAVING, Subqueries, Views)
Ensure data integrity using constraints


4. Database Design
The database consists of four main tables:

1. Department
Stores department details.
dept_id (Primary Key)
dept_name (UNIQUE, NOT NULL)

2️. Employee
Stores employee information.
emp_id (Primary Key)
emp_name
emp_email (UNIQUE, NOT NULL)
dept_id (Foreign Key → Department)
Foreign key uses:
ON DELETE CASCADE
ON UPDATE CASCADE

3️.Asset
Stores asset details.
asset_id (Primary Key)
asset_name
asset_type
purchase_date
asset_status (ENUM)
Asset status values:
Available
Assigned
Under Maintenance

4️. Asset_Assignment
Manages relationship between assets and employees.
assign_id (Primary Key)
asset_id (Foreign Key → Asset)
emp_id (Foreign Key → Employee)
assign_date
return_date
Uses ON DELETE CASCADE to maintain consistency.

5. Key Features Implemented
Database Creation
CREATE DATABASE
Table Constraints
PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
ENUM
ON DELETE CASCADE
ON UPDATE CASCADE

Data Manipulation
INSERT statements
UPDATE asset status after assignment

Basic Queries
SELECT with WHERE
INNER JOIN
Multiple JOIN

Advanced Queries
GROUP BY
HAVING
Subquery
View creation
View


5. How the System Works
Database is created.
Tables are created with constraints.
Departments, employees, and assets are inserted.
Assets are assigned to employees.
Asset status is updated to 'Assigned'.
Queries retrieve asset and employee details.
A view is created for simplified reporting.

6. How to Run the Project
Install MySQL Server and MySQL Workbench.
Open MySQL Workbench.
Open the file:
Source_Code/office_asset_management_full_script.sql
Execute the full script.
The database and tables will be created automatically.
Run SELECT queries to view results.

7. Conclusion
The Office Asset Management System demonstrates how a properly structured relational database improves data accuracy, consistency, and asset tracking efficiency.MySQL was used to implement real-world database concepts including constraints, relationships, cascading rules, and advanced query techniques.This project provides practical exposure to database management systems and SQL implementation.

8. Future Scope and Conclusion
The system can be enhanced by integrating it with a web-based interface for easier accessibility and user interaction. Additional features such as maintenance tracking, automated reporting, and analytics can further improve its functionality. Overall, the project successfully demonstrates practical implementation of relational database concepts using MySQL and SQL.
