To **edit an existing column** in SQL, you use the `ALTER TABLE` statement with the `MODIFY COLUMN` or `CHANGE COLUMN` clause, depending on the task. Below are the common use cases for modifying an existing column in MySQL.

### 1. **Modify the Data Type or Constraints of a Column**

If you want to **change the data type** or modify the properties (such as size or constraints) of an existing column, you use the `MODIFY COLUMN` clause.

#### Syntax:
```sql
ALTER TABLE table_name
MODIFY COLUMN column_name new_column_definition;
```

- `table_name`: The name of the table you want to modify.
- `column_name`: The name of the column you want to modify.
- `new_column_definition`: The new definition of the column, which includes the data type and any constraints.

#### Example 1: Modify the Data Type of a Column

Let's say you have a `users` table with a column `age` of type `INT`, and you want to increase the size of the column to `BIGINT`.

```sql
ALTER TABLE users
MODIFY COLUMN age BIGINT;
```

#### Example 2: Modify a Column to Allow NULL Values

If a column is defined as `NOT NULL` and you want to allow `NULL` values, you can modify it like this:

```sql
ALTER TABLE users
MODIFY COLUMN email VARCHAR(100) NULL;
```

This will change the `email` column to allow `NULL` values.

#### Example 3: Change the Default Value of a Column

To modify the default value of an existing column:

```sql
ALTER TABLE users
MODIFY COLUMN status VARCHAR(20) DEFAULT 'active';
```

This will set the default value of the `status` column to `'active'` if no value is provided.

### 2. **Rename a Column**

To rename an existing column, use the `CHANGE COLUMN` clause. In addition to renaming, you must specify the column's data type again.

#### Syntax:
```sql
ALTER TABLE table_name
CHANGE COLUMN old_column_name new_column_name column_definition;
```

- `old_column_name`: The current name of the column.
- `new_column_name`: The new name of the column.
- `column_definition`: The data type and any constraints of the column (you must specify the column type even when renaming).

#### Example 1: Rename a Column

To rename the `email_address` column to `email`:

```sql
ALTER TABLE users
CHANGE COLUMN email_address email VARCHAR(100);
```

In this case, you're renaming the column `email_address` to `email` and keeping the same data type (`VARCHAR(100)`).

### 3. **Modify the Column to Set NOT NULL or NULL**

You can also change a column to either **NOT NULL** or **NULL** by modifying the constraints.

#### Example 1: Set a Column as NOT NULL

If the `phone_number` column should not allow `NULL` values:

```sql
ALTER TABLE users
MODIFY COLUMN phone_number VARCHAR(20) NOT NULL;
```

#### Example 2: Set a Column to Allow NULL

To modify the column to allow `NULL` values:

```sql
ALTER TABLE users
MODIFY COLUMN phone_number VARCHAR(20) NULL;
```

### 4. **Change Column Order (Optional)**

You can also change the position of a column in the table (if needed) using the `AFTER` clause.

#### Example: Move a Column to a Specific Position

If you want to move the `age` column to appear after the `email` column, use this syntax:

```sql
ALTER TABLE users
MODIFY COLUMN age INT AFTER email;
```

### 5. **Add a Comment to a Column**

You can also add a comment to a column to make it more descriptive. This is not modifying the column itself, but adding metadata.

#### Example: Add a Comment to a Column

```sql
ALTER TABLE users
MODIFY COLUMN email VARCHAR(100) COMMENT 'User email address';
```

### Important Notes:
- When using `MODIFY COLUMN`, you need to **redefine the column's data type** and constraints (e.g., length, NULL/NOT NULL).
- When using `CHANGE COLUMN`, you must specify the column's **new name** and its **data type** (it is necessary to specify the data type even if you are not changing it).
- `ALTER TABLE` operations can lock the table, so be cautious when modifying large tables on production environments.
- **MySQL** requires a specific syntax for the operations depending on the task (e.g., `CHANGE COLUMN` for renaming, `MODIFY COLUMN` for changing column properties).

### Conclusion:

You can use the `ALTER TABLE` command to modify an existing column in a MySQL table using the `MODIFY COLUMN` and `CHANGE COLUMN` clauses. You can change data types, set constraints, rename columns, and even reorder columns using these statements. Just remember to specify the column's new properties as needed.