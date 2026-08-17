# Data Engineering Course 
## Day 1 of learning 
- I learned about the Git and Git hub usage and importance of the VS Code, However,At my level of understanding, Git is the Version control system, Which mean we can monitor the system usage and who handel the data from the main DB.
-  We can manage things in Visual code studio (VS Code)
## Week  of learning SQL (Aug 10,11,12,14)
- I have learned the SQL  for about 4 days.
- In that i have learned about the some basic syntax and work flow of the structured query language 
- SQL (Structured Query Language) is a standard language used to store, retrieve, update, and manage data in relational databases. It allows users to create databases, define tables, insert records, modify data, delete data, and query information efficiently.
- we know the basic concept which is SELECT, FROM ,WHERE statement and aggregate function to use it in the SQL and purpose of the function we know that.
        
### Different Types of Table Creation
-  #### 1.Normal Table. 
- Definition:  
        A Normal Table is a regular database table used to store data permanently. The data remains in the table until it is explicitly updated, deleted, or the table is dropped.
- #### 2.CTAS (Create Table As Select). 
- Definition:  
        CTAS (Create Table As Select) is used to create a new table from the result of a SELECT query. The new table will contain the data returned by the query.
- Suppose we already have a table named employees_day with 50 records. We can use this table to create another table for experimentation without affecting the original data.
    

```sql
CREATE TABLE new_table_name AS
SELECT column_name(s)
FROM existing_table
WHERE condition;
```
- #### 3. Temporary Table
Definition:  
- A Temporary Table is used to store data temporarily. The table exists only for the duration of the current database session and is automatically removed when the session ends.
- For example, if you create a temporary table in Jupyter Notebook, it will only be available in that Jupyter SQL session. It will not be visible in another session, such as MySQL Workbench.

Syntax. 
```sql
CREATE TEMPORARY TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype;
```