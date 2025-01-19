-- First drop tables with foreign key dependencies
DROP TABLE IF EXISTS return_status;
DROP TABLE IF EXISTS issued_status;

-- Then drop the main tables
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS branch;

-- Now create the tables
CREATE TABLE branch(
    branch_id varchar(10) primary key,
    manager_id varchar(10),
    branch_address varchar(55),
    contact_no varchar(15)
);

CREATE TABLE employees(
    emp_id varchar(10) primary key,
    emp_name varchar(25),
    position varchar(25),
    salary int,
    branch_id varchar(25) --fk
);

CREATE TABLE books(
    isbn varchar(50) primary key,
    book_title varchar(80),
    category varchar(30),
    rental_price float,
    status varchar(10),
    author varchar(30),
    publisher varchar(30)
);

CREATE TABLE members(
    member_id varchar(20) primary key,
    member_name varchar(30),
    member_address varchar(75),
    reg_date date
);

CREATE TABLE issued_status(
    issued_id varchar(10) primary key,
    issued_member_id varchar(30), --fk
    issued_book_name varchar(80),
    issued_date date,
    issued_book_isbn varchar(50), --fk
    issued_emp_id varchar(10) --fk
);

CREATE TABLE return_status(
    return_id varchar(10) primary key,
    issued_id varchar(10),
    return_book_name varchar(75),
    ireturn_date date,
    return_book_isbn varchar(20)    
);

-- Add foreign key constraints
ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employee
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);