
Questions : Write an SQL query to create a table named Projects with the following specifications:
            • ProjectID (integer, primary key, auto-increment)
            • ProjectName (variable character, maximum 100 characters, not null, unique)
            • StartDate (date, not null)
            • EndDate (date, must be after StartDate)



create table Project(
Project_id int primary key auto_increment,
Project_name varchar(100) not null unique,
start_date date not null,
end_date date not null,
check (end_date > start_date));

insert into Project(
Project_name, start_date, end_date)
values
("Project A", "2023-01-01", "2023-12-31"),
("Project B", "2022-06-01", "2023-06-01");
