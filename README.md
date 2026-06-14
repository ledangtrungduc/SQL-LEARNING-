# Comprehensive SQL Server Practice: From Basics to Advanced Queries
**Author:** Le Dang Trung Duc  
**Lecturer:** Le Nhat Tung, MSc
## Overview
This repository contains a structured collection of SQL scripts developed during my deep-dive practice with Microsoft SQL Server. The project utilizes the classic **Microsoft Northwind sample database** to simulate real-world data extraction, manipulation, and analytical tasks[cite: 5].

The primary goal of this repository is to demonstrate a robust understanding of relational database management, ranging from simple data retrieval to complex analytical functions and database administration commands.

## Skills & Techniques Demonstrated

Based on the scripts in this repository, the following SQL proficiencies are showcased:

### 1. Fundamental Data Retrieval & Filtering
* **Basic CRUD & Selection:** Executing `SELECT`, handling `DISTINCT` values, and limiting results with `TOP`[cite: 5].
* **Advanced Filtering:** Utilizing `WHERE` clauses with complex boolean logic (`AND`, `OR`, `NOT`), `BETWEEN`, and `IN`/`NOT IN` operators[cite: 5].
* **Pattern Matching:** Applying `LIKE` operators with wildcards (`%`, `_`, `[]`, `[^]`) for precise string extraction[cite: 5].

### 2. Data Aggregation & Grouping
* **Aggregate Functions:** Calculating summary statistics using `MIN()`, `MAX()`, `SUM()`, `AVG()`, and `COUNT()`[cite: 5].
* **Grouping Logic:** Organizing data with `GROUP BY` and applying post-aggregation filters using the `HAVING` clause[cite: 5].
* **Date/Time Functions:** Extracting specific timeframes using `YEAR()`, `MONTH()`, and `DAY()`[cite: 5].

### 3. Relational Operations & Set Theory
* **Table Joins:** Merging datasets across multiple relational tables using `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and `FULL OUTER JOIN`[cite: 5].
* **Set Operations:** Combining result sets from multiple queries using `UNION` and `UNION ALL`[cite: 5].

### 4. Advanced Analytical Queries
* **Subqueries:** Writing nested queries within `SELECT`, `FROM`, and `WHERE` clauses to dynamically filter and calculate data (e.g., finding customers with record-breaking revenues)[cite: 6].
* **Common Table Expressions (CTEs):** Simplifying complex aggregations and multi-step calculations using the `WITH` clause[cite: 6].
* **Recursive CTEs:** Handling hierarchical data structures, demonstrated through tasks like building employee management trees (ReportsTo) and generating mathematical sequences (Fibonacci, Factorials)[cite: 6].
* **Window Functions:** Performing advanced analytics without collapsing rows using `RANK()`, `DENSE_RANK()`, and `LAG()` paired with `PARTITION BY` and `ORDER BY` clauses to calculate year-over-year rankings and track previous order dates[cite: 6].

### 5. Data Definition & Manipulation (DDL/DML)
* **Database & Table Creation:** Using `CREATE DATABASE` and `CREATE TABLE` to set up new schemas.
* **Schema Modification:** Applying `ALTER TABLE` to add columns and enforce rules via `CHECK` constraints[cite: 7].
* **Data Modification:** Inserting single and multiple records with `INSERT INTO`, duplicating table structures with `SELECT INTO`, updating existing records with `UPDATE`, and safely removing data with `DELETE`[cite: 7].
## 🛠 Prerequisites & Tools
* **RDBMS:** Microsoft SQL Server.
* **IDE:** SQL Server Management Studio (SSMS) 
## Repository Structure
* `/SQL LEARNING/`: Contains all `.sql` query files categorized logically by topic.
* `README.md`: Project documentation.

*(Note: The actual Northwind database files `.mdf`/`.ldf` are not included in this repository. To run these scripts, you can download and restore the standard Northwind database directly from Microsoft's official documentation).*
