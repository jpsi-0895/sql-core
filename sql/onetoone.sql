

-- create users table

CREATE table users(
    id INT AUTO_INCREMENT PRIMARY key,
    name varchar(100) not null,
    email varchar(100) not null UNIQUE
);


create table user_profiles (
id int AUTO_INCREMENT PRIMARY key,
user_id int UNIQUE,
address varchar(200),
phone_number varchar(20)
foreign key (user_id) references users(id) on delete cascade,
); 