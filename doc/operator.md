SQL operators are used to perform operations on values in queries, allowing for comparison, logical evaluation, or mathematical calculations. Below is a list of commonly used SQL operators:

### 1. **Comparison Operators**
These operators are used to compare two values:

- `=`: Equal to
- `!=` or `<>`: Not equal to
- `>`: Greater than
- `<`: Less than
- `>=`: Greater than or equal to
- `<=`: Less than or equal to
- `BETWEEN`: Checks if a value is within a range (inclusive).
- `IN`: Checks if a value matches any value in a list or subquery.
- `LIKE`: Searches for a specified pattern in a column.
- `IS NULL`: Checks if a value is NULL.
- `IS NOT NULL`: Checks if a value is NOT NULL.
- `EXISTS`: Checks whether a subquery returns any results.

#### Examples:
```sql
SELECT * FROM employees WHERE salary >= 50000;
SELECT * FROM employees WHERE department_id IN (1, 2, 3);
SELECT * FROM products WHERE product_name LIKE 'A%';
```

### 2. **Logical Operators**
These operators are used to combine multiple conditions in a `WHERE` clause:

- `AND`: Returns true if both conditions are true.
- `OR`: Returns true if at least one of the conditions is true.
- `NOT`: Reverses the result of a condition.

#### Examples:
```sql
SELECT * FROM employees WHERE department_id = 1 AND salary > 60000;
SELECT * FROM products WHERE price > 100 OR category = 'Electronics';
SELECT * FROM employees WHERE NOT department_id = 1;
```

### 3. **Arithmetic Operators**
These operators are used to perform mathematical operations:

- `+`: Addition
- `-`: Subtraction
- `*`: Multiplication
- `/`: Division
- `%`: Modulus (returns the remainder of a division)

#### Examples:
```sql
SELECT price * quantity AS total_price FROM sales;
SELECT salary + bonus AS total_salary FROM employees;
SELECT 10 / 3 AS division_result;
```

### 4. **String Operators**
These operators are used to perform operations on string data:

- `||` or `CONCAT()`: Concatenates two or more strings.
- `CONCAT_WS()`: Concatenates strings with a separator.
- `SUBSTRING()`: Extracts a substring from a string.
- `LENGTH()` or `CHAR_LENGTH()`: Returns the length of a string.
- `UPPER()`: Converts a string to uppercase.
- `LOWER()`: Converts a string to lowercase.
- `TRIM()`: Removes leading and trailing spaces from a string.

#### Examples:
```sql
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
SELECT SUBSTRING(description, 1, 50) AS short_desc FROM products;
SELECT LENGTH(name) FROM users;
```

### 5. **Set Operators**
Set operators are used to combine the results of two or more queries:

- `UNION`: Combines the results of two queries and removes duplicates.
- `UNION ALL`: Combines the results of two queries and includes duplicates.
- `INTERSECT`: Returns only the rows that appear in both queries.
- `EXCEPT` or `MINUS`: Returns rows from the first query that do not appear in the second query.

#### Examples:
```sql
SELECT city FROM customers
UNION
SELECT city FROM suppliers;

SELECT product_name FROM products
EXCEPT
SELECT product_name FROM discontinued_products;
```

### 6. **Aggregate Operators**
These operators are used with aggregate functions to summarize data:

- `COUNT()`: Counts the number of rows.
- `SUM()`: Adds up values in a column.
- `AVG()`: Calculates the average value in a column.
- `MIN()`: Finds the minimum value.
- `MAX()`: Finds the maximum value.

#### Examples:
```sql
SELECT COUNT(*) FROM employees WHERE department_id = 2;
SELECT AVG(salary) FROM employees;
SELECT MAX(salary) FROM employees WHERE department_id = 3;
```

### 7. **Bitwise Operators**
These operators are used to perform bit-level operations on integer values:

- `&`: Bitwise AND
- `|`: Bitwise OR
- `^`: Bitwise XOR
- `~`: Bitwise NOT
- `<<`: Bitwise LEFT SHIFT
- `>>`: Bitwise RIGHT SHIFT

#### Example:
```sql
SELECT 5 & 3;  -- 1 (0101 & 0011 = 0001)
SELECT 5 | 3;  -- 7 (0101 | 0011 = 0111)
```

### 8. **NULL Operators**
These operators are used for handling `NULL` values:

- `IS NULL`: Checks if a value is `NULL`.
- `IS NOT NULL`: Checks if a value is not `NULL`.
- `COALESCE()`: Returns the first non-NULL value from a list of arguments.
- `IFNULL()`: Returns the second argument if the first is `NULL`.

#### Examples:
```sql
SELECT * FROM employees WHERE hire_date IS NULL;
SELECT COALESCE(salary, 0) FROM employees;
```

### 9. **Date and Time Operators**
These operators are used for manipulating date and time data:

- `DATEDIFF()`: Returns the difference between two dates.
- `DATE_ADD()` or `ADDDATE()`: Adds a specified time interval to a date.
- `DATE_SUB()` or `SUBDATE()`: Subtracts a specified time interval from a date.
- `NOW()`: Returns the current date and time.
- `CURDATE()`: Returns the current date.

#### Examples:
```sql
SELECT DATEDIFF('2024-12-25', '2024-12-20'); -- 5
SELECT DATE_ADD(NOW(), INTERVAL 5 DAY);
SELECT CURDATE();
```

### 10. **Case Expressions**
`CASE` expressions allow you to create conditional logic directly in SQL:

- `CASE` (Simple and Searched Case)

#### Example:
```sql
SELECT product_name,
       CASE
           WHEN price > 100 THEN 'Expensive'
           WHEN price BETWEEN 50 AND 100 THEN 'Affordable'
           ELSE 'Cheap'
       END AS price_category
FROM products;
```

### 11. **JSON Operators** (for databases that support JSON, such as MySQL 5.7+ or PostgreSQL)
- `->`: Extracts a value from a JSON document (PostgreSQL/MySQL).
- `->>`: Extracts a value as text from a JSON document (PostgreSQL/MySQL).
- `JSON_EXTRACT()`: Extracts values from a JSON document (MySQL).
- `JSON_SET()`: Modifies JSON data (MySQL).
  
#### Example:
```sql
SELECT JSON_EXTRACT(data, '$.name') FROM users;
SELECT '{"name": "John", "age": 30}'->>'$.name';
```

---

### Conclusion

SQL operators play a crucial role in querying and manipulating data in relational databases. Whether performing comparisons, logical evaluations, mathematical calculations, or string manipulations, understanding and using these operators effectively can significantly enhance your SQL query performance and flexibility.