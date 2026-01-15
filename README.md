# Office Employee Management: SQL Case Study

This project presents a complete database solution for managing an organization's internal structure. It focuses on the relationships between Employees, их Jobs, Departments, and Locations, providing a framework for high-level HR reporting and salary analytics.

## Overview

The database is built on a normalized schema consisting of four primary tables. The project demonstrates the ability to extract complex insights through correlated subqueries and multi-level data relationships.



## Database Architecture

The system is built around four interconnected entities:
1. **Location:** Tracks physical office sites (e.g., New York, Dallas).
2. **Department:** Categorizes teams (Accounting, Sales, Research) and links them to Locations.
3. **Job:** Defines roles and designations (Clerk, Analyst, Manager, President).
4. **Employee:** The core table containing staff details, hire dates, and salary info, linked to all other entities.

## Key SQL Features & Analytical Tasks

### 1. Complex Joins & Filtering
The project moves beyond simple queries to provide specific business views:
- **Regional Reporting:** Listing employees based in specific cities (e.g., Chicago).
- **Categorical Analysis:** Filtering employees by salary ranges and hire date patterns (e.g., joined in Jan 1985).
- **Staffing Summaries:** Displaying employee names alongside their specific department and job designation.

### 2. Advanced Subqueries
I implemented several "Top-N" and comparative analysis queries:
- **Salary Ranking:** Identifying the 2nd and Nth highest-paid employees using nested `SELECT` statements.
- **Comparative Metrics:** Listing employees who earn more than the average salary of a specific department.
- **Existence Checks:** Identifying departments that currently have no assigned employees using the `NOT EXISTS` operator.



### 3. Data Transformation & String Logic
- **Name Formatting:** Using string manipulation to display employee names in various formats.
- **Hire Date Analysis:** Extracting month and year from temporal data to identify seasonal hiring trends.

### 4. Set Operators & Aggregations
- Utilizing `UNION` and `INTERSECT` to manage and compare IDs across different organizational branches.
- Calculating department-wise salary maximums, minimums, and averages to assist in budget planning.



## Tech Stack
- **Language:** T-SQL (MS SQL Server)
- **Core Concepts:** Subqueries (Correlated & Non-correlated), Joins, Aggregate Functions, DDL/DML, and Data Normalization.

## How to Run

1. **Environment Setup:** Create the database using:
   ```sql
   CREATE DATABASE assignments2;
   USE assignments2;

2. **Table Creation:**
   Run the DDL scripts for Location, Department, Job, and Employee in order.

3. **Data Ingestion:**
   Run the INSERT commands to populate the sample office data.

4. **Run Analytics**:
   Execute the case study queries (Questions 1-12) to generate HR reports and salary insights.
