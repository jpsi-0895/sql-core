In MySQL, starting with version **8.0**, **roles** are a way to manage privileges more efficiently by grouping multiple privileges under a single entity. Instead of granting privileges individually to users, you can create a **role** that encapsulates the necessary privileges and then assign that role to users. This simplifies privilege management, especially in large systems.

### In-built Roles in MySQL (8.0+)

MySQL provides several **predefined roles** (built-in roles) that come with specific privileges designed for common use cases. These roles allow you to assign a set of permissions to users without having to specify each privilege individually.

#### Common In-built Roles in MySQL

1. **`DBA`**: This is the most powerful role in MySQL. It grants all the privileges necessary to perform any administrative task.
2. **`SELECT`**: Grants permission to `SELECT` data from tables.
3. **`INSERT`**: Grants permission to insert data into tables.
4. **`UPDATE`**: Grants permission to update data in tables.
5. **`DELETE`**: Grants permission to delete data from tables.
6. **`ALL PRIVILEGES`**: A special role that grants **all available privileges** on a database.

#### List of Built-in Roles (in MySQL 8.0)

MySQL 8.0 has several built-in roles, including but not limited to:

1. **`DBA`**:
   - Grants the full set of privileges, allowing the user to perform almost any administrative operation (equivalent to `root` in older MySQL versions).
   
2. **`SELECT`**:
   - Grants permission to run `SELECT` queries on tables.

3. **`INSERT`**:
   - Grants permission to insert records into tables.

4. **`UPDATE`**:
   - Grants permission to modify records in tables.

5. **`DELETE`**:
   - Grants permission to delete records from tables.

6. **`SUPER`**:
   - Grants permission to perform server administrative tasks such as starting/stopping replication, managing connections, and other operations that require server privileges.

7. **`REPLICATION CLIENT`**:
   - Grants permission to query master/slave status (`SHOW MASTER STATUS`, `SHOW SLAVE STATUS`).

8. **`REPLICATION SLAVE`**:
   - Grants permission to configure a replication slave.

9. **`PROCESS`**:
   - Grants permission to view the processes running on the MySQL server.

10. **`SHUTDOWN`**:
   - Grants permission to shut down the MySQL server.

11. **`FILE`**:
   - Grants permission to read and write files on the server.

12. **`TRIGGER`**:
   - Grants permission to create and drop triggers.

13. **`CREATE TEMPORARY TABLES`**:
   - Grants permission to create temporary tables.

14. **`LOCK TABLES`**:
   - Grants permission to lock tables.

15. **`EVENT`**:
   - Grants permission to create, alter, and drop events in the event scheduler.

---

### **How to Use Built-in Roles**

You can **create roles**, **assign roles to users**, and **grant/revoke** privileges with roles.

### 1. **Viewing All Roles**

To see a list of all roles available in your MySQL instance, you can query the `information_schema.role_table_grants` table or use the following query:

```sql
SELECT * FROM information_schema.user_roles;
```

Alternatively, you can query `mysql.roles_mapping` to see roles and their mappings.

### 2. **Creating and Granting Built-in Roles**

#### Granting a Role to a User

You can grant built-in roles (or any custom roles) to a user using the `GRANT` statement.

#### Example: Grant `DBA` Role to a User
```sql
GRANT DBA TO 'user1'@'localhost';
```

This will grant all privileges associated with the `DBA` role to the user `user1`.

#### Example: Grant `SELECT` and `INSERT` Roles to a User
```sql
GRANT SELECT, INSERT TO 'user2'@'localhost';
```

This will grant only `SELECT` and `INSERT` privileges to the user `user2`.

### 3. **Assigning Multiple Roles to a User**

You can also assign multiple roles to a user:

```sql
GRANT DBA, SELECT, INSERT TO 'user3'@'localhost';
```

This grants the `DBA`, `SELECT`, and `INSERT` roles to `user3`.

### 4. **Setting a Default Role for a User**

You can assign a **default role** to a user. A default role is a role that is automatically enabled when the user connects to MySQL.

```sql
SET DEFAULT ROLE DBA TO 'user1'@'localhost';
```

This will set the `DBA` role as the default role for `user1`.

### 5. **Revoking a Role from a User**

To revoke a role from a user, you can use the `REVOKE` statement.

```sql
REVOKE DBA FROM 'user1'@'localhost';
```

This command will revoke the `DBA` role from `user1`.

### 6. **Dropping a Role**

If you no longer need a custom role (not built-in), you can drop it using the `DROP ROLE` statement:

```sql
DROP ROLE 'custom_role';
```

Built-in roles cannot be dropped as they are predefined by MySQL.

### 7. **Managing Privileges Using Roles**

When you create a custom role or use built-in roles, the role contains a set of privileges that can be granted to users. You can **grant** or **revoke** privileges from a role, just like you would with an individual user.

For example, to add the ability to create tables to the `DBA` role:

```sql
GRANT CREATE ON *.* TO 'DBA';
```

This adds the `CREATE` privilege to the `DBA` role, so users assigned to this role can now create tables.

---

### **Example Scenario**

1. **Creating Roles for Specific Applications**:
   Let's say you have an application that needs read-only access to a specific database. You can create a role with just `SELECT` privileges and assign it to the user for that application.

   ```sql
   CREATE ROLE 'readonly';
   GRANT SELECT ON 'my_database'.* TO 'readonly';
   ```

2. **Assigning Roles to Users**:
   Now, assign the `readonly` role to the user:

   ```sql
   GRANT 'readonly' TO 'app_user'@'localhost';
   ```

3. **Revoking a Role**:
   If you want to remove the `readonly` role from the user:

   ```sql
   REVOKE 'readonly' FROM 'app_user'@'localhost';
   ```

---

### **Conclusion**

Built-in roles in MySQL 8.0+ are a powerful way to manage user privileges more easily. By grouping related privileges into roles, you can streamline privilege management and ensure that users only have the permissions they need. MySQL's built-in roles cover a variety of administrative and user access needs, but you can also create custom roles to suit specific use cases.