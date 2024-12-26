The error you're encountering, **"this is incompatible with sql_mode=only_full_group_by"**, occurs because MySQL's `sql_mode` includes the `ONLY_FULL_GROUP_BY` setting, which enforces stricter rules on `GROUP BY` queries.

When `ONLY_FULL_GROUP_BY` is enabled, MySQL requires that any columns in the `SELECT` clause that are not aggregated (i.e., not used in functions like `SUM()`, `COUNT()`, etc.) must be part of the `GROUP BY` clause. 

### Example of the issue:
Suppose you have a query like this:

```sql
SELECT department_id, department_name, SUM(salary)
FROM employees
GROUP BY department_id;
```

In this case, `department_name` is not part of the `GROUP BY` clause, and this query will throw an error when `ONLY_FULL_GROUP_BY` is enabled, because `department_name` is not functionally dependent on `department_id` (i.e., it could vary for different rows within the same `department_id`).

### Solutions:

#### 1. **Add all non-aggregated columns to the `GROUP BY` clause:**

To resolve the error, add all columns that are selected but not aggregated to the `GROUP BY` clause.

```sql
SELECT department_id, department_name, SUM(salary)
FROM employees
GROUP BY department_id, department_name;
```

This ensures that `department_name` is functionally dependent on `department_id`, which satisfies the `ONLY_FULL_GROUP_BY` requirement.

#### 2. **Use Aggregate Functions on Non-Aggregated Columns:**

Alternatively, you can apply aggregate functions (e.g., `MAX()`, `MIN()`, `GROUP_CONCAT()`) to the non-aggregated columns. For instance, if you're okay with picking any arbitrary `department_name` for each department:

```sql
SELECT department_id, MAX(department_name), SUM(salary)
FROM employees
GROUP BY department_id;
```

In this case, `MAX(department_name)` will pick the department name for each `department_id` group, which complies with the rule.

#### 3. **Disable `ONLY_FULL_GROUP_BY` (Not Recommended for Production):**

If you want to disable the `ONLY_FULL_GROUP_BY` setting entirely (not recommended in production environments for data consistency reasons), you can adjust the SQL mode.

- **Temporarily disable** for the session:

  ```sql
  SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION';
  ```

  This will disable `ONLY_FULL_GROUP_BY` for the current session.

- **Permanently disable** in the MySQL configuration (`my.cnf` or `my.ini` file):

  Under the `[mysqld]` section, add or modify the following line:

  ```ini
  sql_mode = "NO_ENGINE_SUBSTITUTION"
  ```

  Then restart MySQL for the change to take effect.

#### 4. **Using `ANY_VALUE()` (MySQL 5.7+):**

If you want to ignore the aggregation rule for a specific column (but without aggregating), you can use the `ANY_VALUE()` function, which tells MySQL to allow any value from the group, regardless of aggregation:

```sql
SELECT department_id, ANY_VALUE(department_name), SUM(salary)
FROM employees
GROUP BY department_id;
```

This tells MySQL that it's okay to pick any value of `department_name` from the rows that share the same `department_id`.

---

### Conclusion:

The **"incompatible with sql_mode=only_full_group_by"** error is caused by MySQL enforcing stricter `GROUP BY` rules. The best solution is to modify your query to ensure that any columns in the `SELECT` clause that are not aggregated are included in the `GROUP BY` clause. You can also use `ANY_VALUE()` to select non-aggregated values, or adjust your session settings if needed. However, altering the `sql_mode` should be approached cautiously, as it could lead to unintended consequences in data consistency.