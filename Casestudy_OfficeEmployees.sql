
create database assignments2;
use assignments2;


create table location
(location_ID int primary key,
City varchar(50)
);

insert into location(location_ID, City)
values
(122,'New York'),
(123, 'Dallas'),
(124, 'Chicago'),
(167, 'Boston');




create table Department(
Department_Id int primary key,
Name varchar(50),
Location_Id int,
foreign key (Location_Id) references Location(Location_Id)
);

insert into Department values
(10, 'Accounting', 122),
(20, 'Sales', 124),
(30, 'Research', 123),
(40, 'Operations', 167);




create table Job(
Job_ID int primary key,
Designation varchar(50));

insert into Job values
(667, 'Clerk'),
(668, 'Staff'),
(669, 'Analyst'),
(670, 'Sales Person'),
(671, 'Manager'),
(672, 'President');




create table Employee(
Employee_Id int primary key,
Last_Name varchar(50),
First_Name varchar(50),
Middle_Name varchar(50),
Job_Id int,
Hire_Date date,
Salary decimal(10,2),
Comm decimal(10,2),
Department_Id int,
Foreign key (Job_Id) references Job(Job_Id),
Foreign key (Department_Id) references Department(Department_Id)
)

insert into Employee values
(7369, 'Smith', 'John', 'Q', 667, '1984-12-17', 800, Null, 20),
(7499, 'Allen', 'Kevin', 'J', 670, '1985-02-20', 1600, 300, 30),
(755, 'Doyle', 'Jean', 'K', 671, '1985-04-04', 2850, NULL, 30),
(756, 'Dennis', 'Lynn', 'S', 671, '1985-05-15', 2750, NULL, 30),
(757, 'Baker', 'Leslie', 'D', 671, '1985-06-10', 2200, NULL, 40),
(7521, 'Wark', 'Cynthia', 'D', 670, '1985-02-22', 1250, 50, 30);



						--Simple Questions-
--1. List all the employee details.
select * from Employee

--2. List all the department details.
select * from Department

--3. List all job details.
select * from Job

--4. List all the locations.
select * from Location

--5. List out the First Name, Last Name, Salary, Commission for all Employees.
select First_Name,Last_Name,Salary,Comm from Employee

--6. List out the Employee ID, Last Name, Department ID for all employees and
--alias Em-ployee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id".

select Employee_Id as ID_of_the_Employee,Last_Name as name_of_employee ,Department_Id as dep_id from Employee


--7. List out the annual salary of the employees with their names only.
select First_Name, Last_Name, (Salary*12) as annual_salary from Employee



				---Where---
--1. List the details about "Smith".
select * from employee where Last_Name='Smith';

--2. List out the employees who are working in department 20.
select * from employee where Department_Id=20;

--3. List out the employees who are earning salary between 2000 and 3000.
select * from employee where salary between 2000 and 3000;

--4. List out the employees who are working in department 10 or 20.
select * from employee where department_id = 10 or department_id = 20

--5.- Find out the employees who are not working in department 10 or 30.
select * from employee where department_id!=10 and department_id!=30

--6. List out the employees whose name starts with 'L
select * from employee where First_Name like 'L%'

--7. List out the employees whose name starts with 'L' and ends with 'E'.
select * from Employee where First_Name like 'l%e'

--8. List out the employees whose name length is 4 and start with 'J'.
select * from employee where First_Name like'J%' and len(First_Name)=4

or

select * from Employee where First_Name like 'J___'

--9. List out the employees who are working in department 30 and draw the salaries more than 2500.
select * from employee where department_id=30 and salary>2500

--10. List out the employees who are not receiving commission.
select * from Employee where Comm = null

						--Order by--
--1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
select Employee_Id,Last_Name from Employee
order by Employee_Id

--2. List out the Employee ID and Name in descending order based on salary.
select Employee_Id,First_Name,Last_Name,Salary from Employee
order by Salary desc

--3. List out the employee details according to their Last Name in ascending-order.
select * from Employee order by Last_Name

--4. List out the employee details according to their Last Name in ascending order and 
--then Department ID in descending order.
select * from Employee order by Last_Name asc, Department_Id desc


					---Group by and having--
--1. List out the department wise maximum salary, minimum salary and average salary of the employees.
select 
     department_id,
     max(salary) as maxsalary,
	 min(salary) as minsalary,
	 avg(salary) as avgsalary
from employee
group by department_id

--2. List out the job wise maximum salary, minimum salary and average salary of the employees.
select Job_Id,MAX(Salary) as max_sal,min(Salary) as min_sal,AVG(Salary) as avg_sal from Employee
group by Job_Id

--3. List out the number of employees who joined each month in ascending order.
select count(employee_id) as no_of_joinees, month(hire_date) as month_of_hier from employee
group by month(hire_date)
order by month(hire_date)

--4. List out the number of employees for each month and year in ascending order
--based on the year and month.
select YEAR(Hire_Date) as year_hd,MONTH(Hire_Date) as month_hd,COUNT(*) as c_emp from Employee
group by YEAR(Hire_Date),MONTH(Hire_Date)
order by YEAR(Hire_Date),MONTH(Hire_Date)

--5. List out the Department ID having at least four employees.
select Department_Id,COUNT(*) as count_emp from Employee
group by Department_Id
having COUNT(*)>=4

--6. How many employees joined in February month.
select MONTH(Hire_Date) as month_hd,COUNT(*) as c_emp from Employee
where MONTH(Hire_Date)=2
group by MONTH(Hire_Date)

--7. How many employees joined in May or June month.
select COUNT(*) from Employee
where MONTH(Hire_Date) in (5,6)

--8. How many employees joined in 1985?
select COUNT(*) as no_of_emp from Employee
where YEAR(Hire_Date)=1985

--9. How many employees joined each month in 1985?
select month(Hire_Date) as month_hd,COUNT(*) as no_of_emp from Employee
where YEAR(Hire_Date)=1985
group by MONTH(Hire_Date)

--10. How many employees were joined in April 1985?
select COUNT(*) as no_of_emp from Employee
where MONTH(Hire_Date)=4 and YEAR(Hire_Date)=1985

--11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
select Department_Id,count(*) as no_of_emp from Employee
where MONTH(Hire_Date)=4 and YEAR(Hire_Date)=1985
group by Department_Id
having COUNT(*)>=3

					---Joins---
--1. List out employees with their department names.
select * from Employee
inner join Department
on Employee.Department_Id=Department.Department_Id

--2. Display employees with their designations.
select * from Employee
inner join Job
on Employee.Job_Id=Job.Job_ID

--3. Display the employees with their department names and city.
select * from Employee
join Department
on Employee.Department_Id=Department.Department_Id
join Location
on Department.Location_Id=Location.Location_ID

--4. How many employees are working in different departments? Display with department names.
select Name,COUNT(Employee_Id) as no_of_emp from Department
left join Employee
on Department.Department_Id=Employee.Department_Id
group by Name

--5. How many employees are working in the sales department?
select Name,COUNT(*) as no_of_emp from Department
inner join Employee
on Department.Department_Id=Employee.Department_Id
where Name='Sales'
group by Name

--6. Which is the department having greater than or equal to 5 employees and 
--display the department names in ascending order.
select Name,COUNT(Name) as no_of_emp from Department
inner join Employee
on Department.Department_Id=Employee.Department_Id
group by Name
having COUNT(*)>=5
order by Name

--7. How many jobs are there in the organization? Display withdesignations.
SELECT 
    Designation,
    COUNT(*) AS NumberOfJobs
FROM JOB
GROUP BY Designation;

 --8. How many employees are working in "New York"?
select count(*) as noofnyers from employee
join Department
on Employee.Department_Id=Department.Department_Id
join Location
on Department.Location_Id=Location.Location_ID
where City='New York' 

-- 9. Display the employee details with salary grades. Use conditional statementto
 --create a grade column.
 SELECT 
    Employee_Id,
    First_Name,
    Last_Name,
    Salary,
    CASE 
        WHEN Salary >= 3000 THEN 'A'
        WHEN Salary >= 2000 THEN 'B'
        WHEN Salary >= 1000 THEN 'C'
        ELSE 'D'
    END AS Grade
FROM EMPLOYEE;

--10. List out the number of employees grade wise. Use conditional statementto
 --create a grade column.
 SELECT
    CASE
        WHEN Salary >= 3000 THEN 'A'
        WHEN Salary >= 2000 THEN 'B'
        WHEN Salary >= 1000 THEN 'C'
        ELSE 'D'
    END AS Grade,
    COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
GROUP BY
    CASE
        WHEN Salary >= 3000 THEN 'A'
        WHEN Salary >= 2000 THEN 'B'
        WHEN Salary >= 1000 THEN 'C'
        ELSE 'D'
    END
ORDER BY Grade;

--11.Display the employee salary grades and the number ofemployees
 --between 2000 to 5000 range of salary
 SELECT
    CASE
        WHEN Salary >= 3000 THEN 'A'
        WHEN Salary >= 2000 THEN 'B'
        WHEN Salary >= 1000 THEN 'C'
        ELSE 'D'
    END AS Grade,
    COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
WHERE Salary BETWEEN 2000 AND 5000
GROUP BY
    CASE
        WHEN Salary >= 3000 THEN 'A'
        WHEN Salary >= 2000 THEN 'B'
        WHEN Salary >= 1000 THEN 'C'
        ELSE 'D'
    END
ORDER BY Grade;

--12. Display all employees in sales or operation departments.
select  * from Department
inner join Employee
on Department.Department_Id=Employee.Department_Id
where Name in ('Sales','Operations')


                --SET Operators
-- 1. List out the distinct jobs in sales and accounting departments.
SELECT DISTINCT j.Designation
FROM EMPLOYEE e
JOIN JOB j ON e.Job_Id = j.Job_Id
WHERE e.Department_Id IN (10, 20);

 --2. List out all the jobs in sales and accounting departments.
 SELECT 
    d.Name AS Department,
    j.Designation AS Job,
    e.Employee_Id,
    e.First_Name,
    e.Last_Name
FROM 
    EMPLOYEE e
JOIN 
    DEPARTMENT d ON e.Department_Id = d.Department_Id
JOIN 
    JOB j ON e.Job_Id = j.Job_Id
WHERE 
    d.Name IN ('Sales', 'Accounting');

OR

SELECT Job_Id
FROM EMPLOYEE
WHERE Department_Id = (
    SELECT Department_Id FROM DEPARTMENT WHERE Name = 'Sales'
)
UNION
SELECT Job_Id
FROM EMPLOYEE
WHERE Department_Id = (
    SELECT Department_Id FROM DEPARTMENT WHERE Name = 'Accounting'
);

--3. List out the common jobs in research and accounting
--departments in ascending order.

SELECT Job_Id
FROM EMPLOYEE
WHERE Department_Id = 10   -- Accounting

INTERSECT

SELECT Job_Id
FROM EMPLOYEE
WHERE Department_Id = 30   -- Research

ORDER BY Job_Id ASC;



                      --Subqueries:
 --1. Display the employees list who got the maximum salary.
 SELECT *
FROM EMPLOYEE
WHERE Salary = (
    SELECT MAX(Salary) FROM EMPLOYEE
);

--2. Display the employees who are working in the salesdepartment.
SELECT *
FROM EMPLOYEE
WHERE Department_Id = (
    SELECT Department_Id
    FROM DEPARTMENT
    WHERE Name = 'Sales'
);

-- 3. Display the employees who are working as 'Clerk'.
SELECT *
FROM EMPLOYEE
WHERE Job_Id = (
    SELECT Job_Id
    FROM JOB
    WHERE Designation = 'Clerk'
);

-- 4. Display the list of employees who are living in "New York".
SELECT *
FROM EMPLOYEE
WHERE Department_Id = (
    SELECT Department_Id
    FROM DEPARTMENT
    WHERE Location_Id = (
        SELECT Location_Id
        FROM LOCATION
        WHERE City = 'New York'
    )
);

-- 5. Find out the number of employees working in the salesdepartment.
SELECT COUNT(*) AS Num_Employees
FROM EMPLOYEE
WHERE Department_Id = (
    SELECT Department_Id
    FROM DEPARTMENT
    WHERE Name = 'Sales'
);

-- 6. Update the salaries of employees who are working as clerks on the basisof
-- 10%.
UPDATE EMPLOYEE
SET Salary = Salary * 1.10
WHERE Job_Id = (
    SELECT Job_Id
    FROM JOB
    WHERE Designation = 'Clerk'
);

-- 7. Delete the employees who are working in the accountingdepartment.
DELETE FROM EMPLOYEE
WHERE Department_Id = (
    SELECT Department_Id
    FROM DEPARTMENT
    WHERE Name = 'Accounting'
);

-- 8. Display the second highest salary drawing employee details.
SELECT *
FROM EMPLOYEE
WHERE Salary = (
    SELECT MAX(Salary)
    FROM EMPLOYEE
    WHERE Salary < (SELECT MAX(Salary) FROM EMPLOYEE)
);

 --9. Display the nth highest salary drawing employee details.
 SELECT *
FROM EMPLOYEE e1
WHERE (
    SELECT COUNT(DISTINCT e2.Salary)
    FROM EMPLOYEE e2
    WHERE e2.Salary > e1.Salary
) = 2;  -- 3rd highest salary (N-1)


-- 10. List out the employees who earn more than every employee in department30.
SELECT *
FROM EMPLOYEE
WHERE Salary > (
    SELECT MAX(Salary)
    FROM EMPLOYEE
    WHERE Department_Id = 30
);

-- 11. List out the employees who earn more than the lowest salaryin department.

 . Employees Who Earn More Than the Lowest Salary in Their Department

 SELECT *
FROM EMPLOYEE e1
WHERE Salary > (
    SELECT MIN(Salary)
    FROM EMPLOYEE e2
    WHERE e2.Department_Id = e1.Department_Id
);


 --12. Find out which department has no employees.
 SELECT *
FROM DEPARTMENT d
WHERE NOT EXISTS (
    SELECT 1
    FROM EMPLOYEE e
    WHERE e.Department_Id = d.Department_Id
);

-- 13. Find out the employees who earn greater than the average salaryfor
-- their department
SELECT *
FROM EMPLOYEE e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM EMPLOYEE
    WHERE Department_Id = e.Department_Id
);

