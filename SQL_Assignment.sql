
--- This is the Department table.
CREATE TABLE departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50),
    location VARCHAR2(50)
);

SELECT
    *
FROM
    departments
    

--- This is the employees table.
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    dept_id NUMBER,
    manager_id NUMBER,
    salary NUMBER(10,2),
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


SELECT 
    *
FROM
    employees
    
    
---This is the customer table.
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50),
    city VARCHAR2(50)
);

SELECT
    *
FROM
    customers
    

---This is the Order table.
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    order_date DATE,
    amount NUMBER(10,2),
    status VARCHAR2(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

SELECT
    *
FROM
    orders
    
    
    
    
------------- Department values --------------

INSERT INTO departments VALUES
(1, 'IT', 'Chennai'),
(2, 'HR', 'Chennai'),
(3, 'Finance', 'Bangalore'),
(4, 'Sales', 'Hyderabad');

--------- Employees values ------------

INSERT INTO employees
    (emp_id, emp_name, dept_id, manager_id, salary, hire_date)
VALUES
    (101, 'Arun', 1, NULL, 75000, TO_DATE('2022-01-10', 'YYYY-MM-DD'));

INSERT INTO employees
    (emp_id, emp_name, dept_id, manager_id, salary, hire_date)
VALUES
    (102, 'Bala', 1, 101, 60000, TO_DATE('2023-03-15', 'YYYY-MM-DD'));

INSERT INTO employees
    (emp_id, emp_name, dept_id, manager_id, salary, hire_date)
VALUES
    (103, 'Charan', 1, 101, 65000, TO_DATE('2021-07-20', 'YYYY-MM-DD'));

INSERT INTO employees
    (emp_id, emp_name, dept_id, manager_id, salary, hire_date)
VALUES
    (104, 'Divya', 2, NULL, 55000, TO_DATE('2022-08-01', 'YYYY-MM-DD'));

INSERT INTO employees
    (emp_id, emp_name, dept_id, manager_id, salary, hire_date)
VALUES
    (105, 'Esha', 2, 104, 48000, TO_DATE('2024-02-12', 'YYYY-MM-DD'));

INSERT INTO employees
    (emp_id, emp_name, dept_id, manager_id, salary, hire_date)
VALUES
    (106, 'Farhan', 3, NULL, 70000, TO_DATE('2020-11-05', 'YYYY-MM-DD'));

INSERT INTO employees
    (emp_id, emp_name, dept_id, manager_id, salary, hire_date)
VALUES
    (107, 'Gokul', 3, 106, 52000, TO_DATE('2023-06-18', 'YYYY-MM-DD'));

INSERT INTO employees
    (emp_id, emp_name, dept_id, manager_id, salary, hire_date)
VALUES
    (108, 'Hema', 4, NULL, 62000, TO_DATE('2021-09-25', 'YYYY-MM-DD'));

INSERT INTO employees
    (emp_id, emp_name, dept_id, manager_id, salary, hire_date)
VALUES
    (109, 'Isha', 4, 108, 45000, TO_DATE('2024-01-08', 'YYYY-MM-DD'));

INSERT INTO employees
    (emp_id, emp_name, dept_id, manager_id, salary, hire_date)
VALUES
    (110, 'Jai', 4, 108, 50000, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
    
    
-------- Customers values --------------------

INSERT INTO customers
    (customer_id, customer_name, city)
VALUES
    (1, 'Kumar', 'Chennai');

INSERT INTO customers
    (customer_id, customer_name, city)
VALUES
    (2, 'Lakshmi', 'Bangalore');

INSERT INTO customers
    (customer_id, customer_name, city)
VALUES
    (3, 'Manoj', 'Chennai');

INSERT INTO customers
    (customer_id, customer_name, city)
VALUES
    (4, 'Nisha', 'Hyderabad');

INSERT INTO customers
    (customer_id, customer_name, city)
VALUES
    (5, 'Praveen', 'Coimbatore');

INSERT INTO customers
    (customer_id, customer_name, city)
VALUES
    (6, 'Ravi', 'Chennai');
    
    
----------- Orders values ---------

INSERT INTO orders
    (order_id, customer_id, order_date, amount, status)
VALUES
    (1001, 1, TO_DATE('2026-01-05', 'YYYY-MM-DD'), 2500, 'Completed');

INSERT INTO orders
    (order_id, customer_id, order_date, amount, status)
VALUES
    (1002, 1, TO_DATE('2026-02-10', 'YYYY-MM-DD'), 1800, 'Completed');

INSERT INTO orders
    (order_id, customer_id, order_date, amount, status)
VALUES
    (1003, 2, TO_DATE('2026-01-15', 'YYYY-MM-DD'), 3200, 'Completed');

INSERT INTO orders
    (order_id, customer_id, order_date, amount, status)
VALUES
    (1004, 3, TO_DATE('2026-02-01', 'YYYY-MM-DD'), 1500, 'Pending');

INSERT INTO orders
    (order_id, customer_id, order_date, amount, status)
VALUES
    (1005, 3, TO_DATE('2026-03-12', 'YYYY-MM-DD'), 4000, 'Completed');

INSERT INTO orders
    (order_id, customer_id, order_date, amount, status)
VALUES
    (1006, 4, TO_DATE('2026-01-20', 'YYYY-MM-DD'), 2100, 'Completed');

INSERT INTO orders
    (order_id, customer_id, order_date, amount, status)
VALUES
    (1007, 4, TO_DATE('2026-03-05', 'YYYY-MM-DD'), 2800, 'Cancelled');

INSERT INTO orders
    (order_id, customer_id, order_date, amount, status)
VALUES
    (1008, 5, TO_DATE('2026-02-18', 'YYYY-MM-DD'), 1700, 'Completed');

INSERT INTO orders
    (order_id, customer_id, order_date, amount, status)
VALUES
    (1009, 6, TO_DATE('2026-03-10', 'YYYY-MM-DD'), 3500, 'Completed');

INSERT INTO orders
    (order_id, customer_id, order_date, amount, status)
VALUES
    (1010, 6, TO_DATE('2026-03-20', 'YYYY-MM-DD'), 1200, 'Pending');


COMMIT;






---------- Assignement Questions --------------------

-- 1. Create a new table named high_salary_employees using CTAS. Store emp_id, emp_name, dept_id and salary for employees whose salary is greater than 60000. 

CREATE TABLE High_salary_employees AS
SELECT
    emp_id,emp_name,dept_id,salary
FROM
    employees
Where 
    salary > 60000;


-- 2. Create a table named chennai_customers using CTAS containing customers who are from Chennai. 

CREATE TABLE Chennai_customers AS
SELECT
    *
FROM
    customers
WHERE
    city = 'Chennai';

-- 3. Create a table named department_salary_summary using CTAS. It should contain each dept_id and the average salary of employees in that department. 

CREATE TABLE department_salary_summary AS
SELECT
    d.dept_id, AVG(e.salary) Average_salary
FROM
    departments d
JOIN 
    employees e
    ON d.dept_id = e.dept_id
GROUP BY
    d.dept_id;


SELECT
    *
FROM
    department_salary_summary


-- 4. Create a table named completed_orders using CTAS containing only completed orders. Include order_id, customer_id, order_date and amount. 

CREATE TABLE Completed_orders AS
SELECT
    order_id,customer_id,order_date,amount
FROM
    orders
WHERE
    status = 'Completed';


SELECT
    *
FROM
    Completed_orders
    

-- 5. Write an INNER JOIN query to display employee name, department name and salary for every employee. 

SELECT
    e.emp_name ,d.dept_name,e.salary
FROM
    employees e
INNER JOIN
    departments d
    ON e.dept_id = d.dept_id;
    

-- 6.Write a LEFT JOIN query to display every department and the employees working in it. Departments with no employees should also appear. 

SELECT
    d.dept_name,e.emp_name
FROM
    employees e
LEFT JOIN
    departments d
    ON e.dept_id = d.dept_id;
    
    
-- 7. Write a query using JOINs to display customer name, order id, order date and order amount. 

SELECT
    C.customer_name, O.order_id, O.order_date, O.amount
FROM
    customers C
INNER JOIN
    orders O
    ON C.customer_id = O.customer_id;
    

-- 8. Write a query to find the total order amount for each customer. Display customer name and total amount.Include customers who have placed no orders. 

SELECT
    C.customer_name, SUM(O.amount) Total_order_amount
FROM
    customers C
LEFT JOIN
    orders O
    ON C.customer_id = O.customer_id 
GROUP BY
    C.customer_name
    
    
-- 9. Write a self JOIN on the employees table to display each employee's name and their manager's name. Ignore employees who do not have a manager. 

SELECT
    e.emp_name AS employee_name,
    m.emp_name AS manager_name
FROM employees e
INNER JOIN employees m
    ON e.manager_id = m.emp_id;
    

-- 10. Find employees whose salary is greater than the average salary of their own department. Display employee name, department id and salary.

SELECT
    emp_name, dept_id, salary
FROM
    employees
WHERE
    salary >
        (SELECT
            AVG(salary)
        FROM
            employees
        ); -- similar to 12 question


-- 11. Find the employee or employees who have the highest salary in the company using a subquery. 

SELECT
    *
FROM
    employees 
ORDER BY  
    salary DESC
FETCH FIRST 1 ROW ONLY

-- OR--

SELECT
    *
FROM
    (SELECT
        *
    FROM
        employees 
    ORDER BY  
        salary DESC
    )
WHERE rownum = 1;



-- 12. Find all employees whose salary is greater than the overall average salary.

SELECT
    *
FROM
    employees
WHERE 
    salary >
        (SELECT
            avg(salary)
        FROM
            employees
        );


-- 13. Find customers who have placed at least one order using a subquery. Do not use JOIN. 

SELECT
    c.customer_name
FROM 
    customers c
WHERE EXISTS (
    SELECT 1
    FROM 
        orders o
    WHERE 
        o.customer_id = c.customer_id
);


-- 14. Find the second-highest salary from the employees table using a subquery.

    
SELECT 
emp_name,MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
)
GROUP BY
    emp_name
ORDER BY
    MAX(salary) DESC
FETCH FIRST 1 ROW ONLY


-- 15. Display each employee's salary along with the average salary of their department using AVG() OVER(PARTITION BY ...). 

SELECT
    e.*,
    ROUND(AVG(e.salary) OVER (
    PARTITION BY e.dept_id),2) AS avg_salary
FROM employees e;



Commit;




    
    
    

    


