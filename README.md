Office-Asset-Management


1. Project Overview
The Office Asset Management System is a database-driven project developed using MySQL as part of the Open Source Database Management System (OSDBMS) practical requirement.The purpose of this project is to design and implement a structured database system to manage office assets such as laptops, printers, and furniture. The system maintains records of departments, employees, assets, and asset assignments using relational database concepts.This project focuses on database-level implementation without a graphical user interface.


3. Problem Statement
In many offices, assets are managed manually using registers or Excel sheets. This leads to:
Data redundancy
Data inconsistency
Lack of security
Difficulty in tracking asset assignments
Slow data retrieval


4. Objectives of the Project
Design a structured relational database
Implement table relationships using Primary and Foreign Keys
Perform CRUD operations using SQL
Implement advanced queries (JOIN, GROUP BY, HAVING, Subqueries, Views)
Ensure data integrity using constraints


5. Database Design

1️.Department
Stores department details.
Primary Key: dept_id

2️.Employee
Stores employee information and department reference.
Primary Key: emp_id
Foreign Key: dept_id

3️.Asset
Stores details of office assets and their status.
Primary Key: asset_id

4️.Asset_Assignment
Manages asset allocation to employees.
Primary Key: assign_id
Foreign Keys: asset_id, emp_id

The database follows relational model principles to maintain consistency and integrity.

 How to Run the Project
Install MySQL Server and MySQL Workbench
Open MySQL Workbench
Open the file:
Source_Code/office_asset_management_full_script.sql
Execute the entire script
The database will be created automatically
Run SELECT queries to view results

6. Future Enhancements
Web-based interface integration
Automated reporting system
Asset maintenance tracking
Asset depreciation calculation
Analytics for asset usage

7. Conclusion
The Office Asset Management System successfully demonstrates how a structured relational database improves asset tracking, data accuracy, and operational efficiency. MySQL was used to implement database design, constraints, queries, security, and backup concepts effectively.
This project provides practical exposure to real-world database implementation.
