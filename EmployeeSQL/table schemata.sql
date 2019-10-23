-- drop table title;
-- drop table salaries;
-- drop table employees;
-- drop table dept_manager;
-- drop table dept_employees;
-- drop table departments;

create table employees (
	emp_no int not null,
	birth_date date not null,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	gender varchar(1) not null,
	hire_date date not null,
	primary key (emp_no)
);

create table departments (
	dept_no varchar(10) not null,
	dept_name varchar(20) not null unique,
	primary key (dept_no)
);

create table dept_manager (
	dept_no varchar(10) not null,
    foreign key (dept_no) references departments(dept_no),
	emp_no int not null,
    foreign key (emp_no) references employees(emp_no),
	from_date date not null,
	to_date date not null
);

create table dept_employees (
	emp_no int not null,
    foreign key (emp_no) references employees(emp_no),
	dept_no varchar(10) not null,
    foreign key (dept_no) references departments(dept_no),
	from_date date not null,
	to_date date not null
);

create table title (
	emp_no int not null,
	title varchar(25) not null,
	from_date date not null,
	to_date date not null,	
	primary key (emp_no, title, from_date)
);

create table salaries (
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
    primary key (emp_no, from_date)
);
