-- adding field if table exiting
alter table employees 
add column uuid int default 0;
-- ALTER TABLE table_name
-- ADD COLUMN column_name column_definition [AFTER existing_column] [FIRST];