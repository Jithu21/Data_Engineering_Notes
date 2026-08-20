# Outline of the SQL overview 
## SQL Complete Revision Map

A quick-reference SQL revision guide covering core concepts, advanced SQL, optimization, and real-world problems.

## 1. SQL Functions

Functions are built-in operations used to calculate, transform, or manipulate data.

### Aggregate Functions
Used to perform calculations across multiple rows and return a summary.

- `COUNT()` — counts records
- `SUM()` — calculates total
- `AVG()` — calculates average
- `MIN()` — finds minimum
- `MAX()` — finds maximum

**Example:**
```sql
SELECT
    Department_ID,
    AVG(Salary) AS Avg_Salary
FROM Employee
GROUP BY Department_ID;
```

**Use:** Find the average salary for each department.

### String Functions
Used to modify, clean, or extract text.

- `UPPER()`
- `LOWER()`
- `LENGTH()`
- `TRIM()`
- `SUBSTR()`
- `CONCAT()`
- `REPLACE()`

**Example:**
```sql
SELECT UPPER(First_Name)
FROM Employee;
```

**Use:** Convert names into uppercase.

### Numeric Functions
Used for mathematical calculations and number manipulation.

- `ROUND()`
- `CEIL()`
- `FLOOR()`
- `ABS()`
- `MOD()`

**Example:**
```sql
SELECT ROUND(Salary, 2)
FROM Employee;
```

**Use:** Round salary values to two decimal places.

### Date Functions
Used to extract, compare, calculate, and manipulate dates.

- Current date
- Extract year/month/day
- Date addition
- Date subtraction
- Date difference
- Date formatting

**Example:**
```sql
SELECT EXTRACT(YEAR FROM Hire_Date)
FROM Employee;
```

**Use:** Find the hiring year of employees.

### NULL Functions
Used to handle missing values.

- `COALESCE()`
- `NVL()` — Oracle
- `NULLIF()`

**Example:**
```sql
SELECT COALESCE(Commission, 0)
FROM Employee;
```

**Use:** Replace NULL commission with `0`.

---

## 2. Conditional Logic

Conditional logic is used when SQL needs to make decisions based on conditions.

### CASE

The main conditional expression.

```sql
SELECT
    Employee_Name,
    CASE
        WHEN Salary >= 100000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS Salary_Category
FROM Employee;
```

**Use:** Categorize employees based on salary.

### Related Operators

- `AND` — all conditions must be true
- `OR` — at least one condition must be true
- `NOT` — reverses a condition
- `IN` — matches multiple values
- `BETWEEN` — checks a range
- `LIKE` — searches patterns
- `IS NULL` — checks missing values
- `IS NOT NULL` — checks available values

**Example:**
```sql
WHERE Department_ID IN (10, 20, 30)
```

**Use:** Filter employees belonging to specific departments.

---

## 3. Joins

Joins are used to combine data from multiple tables using related columns.

### INNER JOIN

Returns only matching records.

```sql
SELECT e.Employee_Name, d.Department_Name
FROM Employee e
INNER JOIN Department d
    ON e.Department_ID = d.Department_ID;
```

**Use:** Get employees who have a matching department.

### LEFT JOIN

Returns everything from the left table and matching data from the right.

**Use:** Find all employees, including employees without a department.

### RIGHT JOIN

Returns everything from the right table and matching data from the left.

**Use:** Find all departments, including departments without employees.

### FULL OUTER JOIN

Returns matching and unmatched records from both tables.

**Use:** Reconcile two datasets.

### CROSS JOIN

Creates every possible combination between two tables.

**Use:** Generate combinations.

### SELF JOIN

Joins a table with itself.

**Use:** Compare employees with their managers.

---

## 4. Subqueries

A subquery is a query inside another query, usually used when one query's result is needed by another.

### Subquery in WHERE

```sql
SELECT Employee_Name, Salary
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
);
```

**Use:** Find employees earning more than the overall average salary.

### Subquery in FROM

```sql
SELECT *
FROM (
    SELECT Department_ID, AVG(Salary) AS Avg_Salary
    FROM Employee
    GROUP BY Department_ID
);
```

**Use:** Treat the result of a query like a temporary table.

### Correlated Subquery

The inner query depends on the current row of the outer query.

**Use:** Compare each record against its own group.

### EXISTS

```sql
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.Customer_ID = c.Customer_ID
)
```

**Use:** Check whether a related record exists.

---

## 5. CTE — Common Table Expression

A CTE creates a temporary named result that can be used by the main query.

```sql
WITH Avg_Salary AS (
    SELECT
        Department_ID,
        AVG(Salary) AS Avg_Salary
    FROM Employee
    GROUP BY Department_ID
)
SELECT *
FROM Avg_Salary
WHERE Avg_Salary > 60000;
```

**Use:** Break a complex query into smaller and readable steps.

### CTE Use Cases

- Complex transformations
- Multiple query steps
- Aggregation
- Joining intermediate results
- Window functions
- Recursive hierarchy problems

### Recursive CTE

Used when data has a hierarchical relationship.

**Example:** Employee → Manager → Senior Manager.

---

## 6. Window Functions

Window functions perform calculations across related rows without collapsing the individual rows.

### Basic Structure

```sql
FUNCTION() OVER (
    PARTITION BY ...
    ORDER BY ...
)
```

### Ranking Functions

#### ROW_NUMBER()

```sql
ROW_NUMBER() OVER (
    ORDER BY Salary DESC
)
```

**Use:** Give every employee a unique position.

#### RANK()

```sql
RANK() OVER (
    ORDER BY Salary DESC
)
```

**Use:** Rank employees while giving tied employees the same rank.

#### DENSE_RANK()

**Use:** Rank tied values without leaving gaps.

### Previous / Next Row

#### LAG()

```sql
LAG(Salary) OVER (
    ORDER BY Employee_ID
)
```

**Use:** Compare the current salary with the previous employee's salary.

#### LEAD()

**Use:** Compare the current row with the next row.

### Aggregate Window Functions

#### SUM() OVER()

**Use:** Calculate running totals without grouping the rows.

#### AVG() OVER()

**Use:** Calculate a moving/group average while keeping individual records.

### PARTITION BY

```sql
AVG(Salary) OVER (
    PARTITION BY Department_ID
)
```

**Use:** Calculate the average salary separately for each department.

---

## 7. GROUP BY & HAVING

### GROUP BY

Used to create groups before performing aggregate calculations.

```sql
SELECT Department_ID, COUNT(*)
FROM Employee
GROUP BY Department_ID;
```

**Use:** Count employees in each department.

### HAVING

Used to filter aggregated groups.

```sql
SELECT Department_ID, COUNT(*)
FROM Employee
GROUP BY Department_ID
HAVING COUNT(*) > 10;
```

**Use:** Find departments having more than 10 employees.

**Remember:**

- `WHERE` → filters rows
- `HAVING` → filters groups

---

## 8. Set Operators

Used to combine or compare results from multiple SELECT queries.

### UNION

Combines results and removes duplicates.

### UNION ALL

Combines results and keeps duplicates.

### INTERSECT

Returns records present in both results.

### MINUS — Oracle

Returns records present in the first query but not the second.

**Example:**
```sql
SELECT Customer_ID FROM Customers_2025
UNION
SELECT Customer_ID FROM Customers_2026;
```

**Use:** Combine customers from two datasets.

---

## 9. Data Manipulation

Used to change data inside tables.

### INSERT

Adds records.

```sql
INSERT INTO Employee
VALUES (101, 'John', 50000);
```

### UPDATE

Changes existing records.

```sql
UPDATE Employee
SET Salary = 55000
WHERE Employee_ID = 101;
```

### DELETE

Removes records.

```sql
DELETE FROM Employee
WHERE Employee_ID = 101;
```

### MERGE

Used to insert new records and update existing records in one operation.

---

## 10. DDL — Data Definition Language

Used to create or modify database structures.

- `CREATE`
- `ALTER`
- `DROP`
- `TRUNCATE`
- `RENAME`

**Example:**
```sql
CREATE TABLE Employee (
    Employee_ID NUMBER,
    Employee_Name VARCHAR2(100),
    Salary NUMBER
);
```

**Use:** Create the structure of an employee table.

---

## 11. Constraints

Constraints are rules used to maintain data accuracy and integrity.

- `PRIMARY KEY` — uniquely identifies a record
- `FOREIGN KEY` — establishes relationships
- `UNIQUE` — prevents duplicate values
- `NOT NULL` — prevents missing values
- `CHECK` — enforces a condition
- `DEFAULT` — provides a default value

**Example:**
```sql
Employee_ID NUMBER PRIMARY KEY
```

**Use:** Ensure every employee has a unique ID.

---

## 12. Views

A view is a saved SQL query that behaves like a virtual table.

```sql
CREATE VIEW Employee_Summary AS
SELECT Employee_ID, Employee_Name, Salary
FROM Employee;
```

**Use:** Simplify repeated queries and control access to data.

---

## 13. Temporary Tables

Temporary tables store intermediate data temporarily.

```sql
CREATE GLOBAL TEMPORARY TABLE Temp_Employee (
    Employee_ID NUMBER,
    Salary NUMBER
);
```

**Use:** Store intermediate results during data processing.

---

## 14. Transactions

Transactions control how database changes are saved or undone.

- `COMMIT` — permanently save changes
- `ROLLBACK` — undo changes
- `SAVEPOINT` — create a rollback point

**Example:**
```sql
UPDATE Employee
SET Salary = Salary * 1.10;

ROLLBACK;
```

**Use:** Undo the salary update if something goes wrong.

---

## 15. Keys

Keys are used to identify records and establish relationships.

- Primary Key
- Foreign Key
- Candidate Key
- Composite Key
- Unique Key

**Example:**
```text
Employee
Employee_ID → Primary Key

Department
Department_ID → Primary Key

Employee.Department_ID
        ↓
Department.Department_ID
```

**Use:** Connect employee data with department data.

---

## 16. Indexes

Indexes are structures used to speed up data retrieval.

```sql
CREATE INDEX idx_employee_name
ON Employee(Employee_Name);
```

**Use:** Improve performance when frequently searching by employee name.

---

## 17. Query Execution Order

This explains how SQL logically processes a query.

```text
FROM
JOIN
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
FETCH / LIMIT
```

**Example:**
```sql
SELECT Department_ID, AVG(Salary)
FROM Employee
WHERE Salary > 30000
GROUP BY Department_ID
HAVING AVG(Salary) > 50000
ORDER BY AVG(Salary) DESC;
```

**Use:** Understand why SQL behaves differently depending on where a condition is written.

---

## 18. Query Optimization

Used to make SQL queries execute faster and use fewer resources.

### Main Areas

- Indexes
- Execution plans
- `EXPLAIN`
- Join optimization
- Filtering early
- Avoiding `SELECT *`
- Reducing unnecessary joins
- Query rewriting
- Partitioning

**Example:**
```sql
EXPLAIN PLAN FOR
SELECT *
FROM Employee
WHERE Department_ID = 10;
```

**Use:** Identify why a query is slow.

---

## 19. Data Cleaning with SQL

Used to identify and fix poor-quality data.

### Main Areas

- NULL handling
- Duplicate detection
- Invalid values
- Standardization
- String cleaning
- Date cleaning
- Missing records
- Data validation

**Example:**
```sql
SELECT Employee_Name
FROM Employee
WHERE Employee_Name IS NULL;
```

**Use:** Identify records with missing employee names.

---

## 20. Real-World SQL Problems

This is where multiple SQL concepts are combined.

| Problem | Common SQL Concepts |
|---|---|
| Second-highest salary | `DENSE_RANK()` / Subquery |
| Top 3 employees per department | `PARTITION BY` + `DENSE_RANK()` |
| Employees above department average | CTE + `JOIN` / Window Function |
| Customers who never ordered | `LEFT JOIN` / `NOT EXISTS` |
| Monthly revenue | Date Functions + `GROUP BY` |
| Month-over-month growth | `LAG()` |
| Running revenue total | `SUM() OVER()` |
| Duplicate records | `GROUP BY` / `ROW_NUMBER()` |
| Source vs target mismatch | `FULL JOIN` / `MINUS` |

---

# SQL Core Map

```text
SQL
│
├── 1. Fundamentals
│   ├── SELECT
│   ├── WHERE
│   ├── ORDER BY
│   └── DISTINCT
│
├── 2. Functions
│   ├── Aggregate
│   ├── String
│   ├── Numeric
│   ├── Date
│   └── NULL
│
├── 3. Conditional Logic
│   ├── CASE
│   ├── AND / OR / NOT
│   ├── IN
│   ├── BETWEEN
│   ├── LIKE
│   └── NULL checks
│
├── 4. Aggregation
│   ├── GROUP BY
│   └── HAVING
│
├── 5. Joins
│   ├── INNER
│   ├── LEFT
│   ├── RIGHT
│   ├── FULL
│   ├── CROSS
│   └── SELF
│
├── 6. Subqueries
│   ├── WHERE
│   ├── FROM
│   ├── SELECT
│   ├── Correlated
│   └── EXISTS
│
├── 7. CTE
│   └── Recursive CTE
│
├── 8. Window Functions
│   ├── ROW_NUMBER
│   ├── RANK
│   ├── DENSE_RANK
│   ├── LAG
│   ├── LEAD
│   ├── SUM
│   └── AVG
│
├── 9. Set Operators
│   ├── UNION
│   ├── UNION ALL
│   ├── INTERSECT
│   └── MINUS
│
├── 10. DML / DDL
│   ├── INSERT
│   ├── UPDATE
│   ├── DELETE
│   ├── MERGE
│   ├── CREATE
│   ├── ALTER
│   ├── DROP
│   └── TRUNCATE
│
├── 11. Database Objects
│   ├── Views
│   ├── Temporary Tables
│   └── Indexes
│
├── 12. Transactions
│   ├── COMMIT
│   ├── ROLLBACK
│   └── SAVEPOINT
│
├── 13. Optimization
│   ├── EXPLAIN
│   ├── Execution Plan
│   ├── Indexing
│   └── Query Tuning
│
└── 14. Real-World Problems
    ├── Duplicates
    ├── Missing Data
    ├── Ranking
    ├── Running Totals
    ├── Growth
    └── Reconciliation
```

## Revision Priority

**High Priority:** Joins → GROUP BY/HAVING → CASE → Subqueries → CTE → Window Functions

**Next:** Functions → Set Operators → Views → Data Cleaning → Query Execution

**Advanced:** Indexes → Query Optimization → Transactions → Data Engineering SQL
