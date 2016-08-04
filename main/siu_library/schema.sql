/* siu_library/schema.sql */
/* Date  : 03 August 2016
 * Author: Ankit Pati
 */

create database siu_library;
use siu_library;

create table authors(
    author_id integer primary key not null auto_increment,
    name char(100) not null
);
insert into authors (name) values("Brian Kernighan");
insert into authors (name) values("Dennis Ritchie");
insert into authors (name) values("Ken Thompson");
insert into authors (name) values("Mike Stone");
insert into authors (name) values("P. B. Shelley");

create table department(
    id integer primary key not null auto_increment,
    name char(100) unique not null
);
insert into department (name) values("Computer Science");
insert into department (name) values("Information Technology");
insert into department (name) values("Electronics and Telecommunication");
insert into department (name) values("Mechanical Engineering");
insert into department (name) values("Civil Engineering");

create table instlib(
    id integer primary key not null auto_increment,
    name char(100) not null
);
insert into instlib (name) values("Symbiosis Institute of Technology");
insert into instlib (name) values("Symbiosis School of Biomedical Sciences");
insert into instlib (name) values("Symbiosis School of Culinary Arts");
insert into instlib (name) values("Symbiosis Institute of Business Management");
insert into instlib (name) values("Symbiosis Law School");

create table sellers(
    id integer primary key not null auto_increment,
    location char(250) not null,
    contact char(13) unique not null
);
insert into sellers (location, contact) values("Kolkata", "+919999988888");
insert into sellers (location, contact) values("Pune", "+918888899999");
insert into sellers (location, contact) values("Hyderabad", "+918888888888");
insert into sellers (location, contact) values("Bhubaneswar", "+919999999999");
insert into sellers (location, contact) values("Cuttack", "+919999911111");

create table books(
    isbn integer primary key not null,
    name char(100) not null,
    author_id integer not null,
    foreign key(author_id) references authors(author_id)
);
insert into books values(1111, "The C Programming Language", 2);
insert into books values(2222, "The C++ Programming Language", 3);
insert into books values(3333, "Law of Torts", 4);
insert into books values(4444, "The Unix Philosophy", 1);
insert into books values(5555, "The Modern Prometheus", 5);

create table buys_from(
    institute_id integer not null,
    seller_id integer not null,
    foreign key(institute_id) references instlib(id)
);
insert into buys_from values(1, 3);
insert into buys_from values(1, 2);
insert into buys_from values(2, 5);
insert into buys_from values(2, 1);
insert into buys_from values(3, 3);
insert into buys_from values(3, 1);
insert into buys_from values(4, 2);
insert into buys_from values(4, 1);
insert into buys_from values(5, 4);
insert into buys_from values(5, 3);

create table members(
    id integer primary key not null auto_increment,
    name char(100) not null,
    institute_id integer not null,
    department_id integer not null,
    foreign key(institute_id) references instlib(id),
    foreign key(department_id) references department(id)
);
insert into members (name, institute_id, department_id) values("Ankit Pati", 1, 2);
insert into members (name, institute_id, department_id) values("Tiashaa Chatterjee", 5, 5);
insert into members (name, institute_id, department_id) values("Mayank Verma", 2, 1);
insert into members (name, institute_id, department_id) values("Sahil Pandey", 4, 3);
insert into members (name, institute_id, department_id) values("Ravi Tripathi", 3, 1);

create table owns(
    institute_id integer not null,
    isbn integer not null,
    copies integer not null,
    foreign key(institute_id) references instlib(id),
    primary key(institute_id, isbn)
);
insert into owns values(1, 2222, 4);
insert into owns values(1, 3333, 9);
insert into owns values(2, 4444, 2);
insert into owns values(2, 3333, 5);
insert into owns values(3, 5555, 6);
insert into owns values(3, 2222, 7);
insert into owns values(4, 3333, 1);
insert into owns values(4, 2222, 7);
insert into owns values(5, 2222, 9);
insert into owns values(5, 4444, 8);

create table publishers(
    id integer primary key not null auto_increment,
    isbn integer not null,
    name char(100) not null,
    foreign key(isbn) references books(isbn)
);
insert into publishers (isbn, name) values(2222, "Tata McGraw Hill");
insert into publishers (isbn, name) values(1111, "Prentice Hall");
insert into publishers (isbn, name) values(3333, "Nirali Prakashan");
insert into publishers (isbn, name) values(5555, "Hello World");
insert into publishers (isbn, name) values(4444, "Sunshine");

create table sells(
    seller_id integer not null,
    publisher_id integer not null,
    foreign key(seller_id) references sellers(id),
    foreign key(publisher_id) references publishers(id)
);
insert into sells values(1, 3);
insert into sells values(1, 2);
insert into sells values(2, 2);
insert into sells values(2, 1);
insert into sells values(3, 5);
insert into sells values(3, 4);
insert into sells values(4, 4);
insert into sells values(4, 3);
insert into sells values(5, 3);
insert into sells values(5, 2);

create table staff(
    member_id integer primary key not null,
    post char(100) not null,
    salary integer not null,
    foreign key(member_id) references members(id)
);
insert into staff values(3, "Librarian", 50000);
insert into staff values(4, "Professor", 200000);

create table student(
    member_id integer primary key not null,
    gpa float not null,
    yr year not null,
    foreign key(member_id) references members(id)
);
insert into student values(1, 3.5, 3);
insert into student values(2, 3.9, 3);
insert into student values(5, 3.2, 2);
/* end of siu_library/schema.sql */
