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

create table department(
    id integer primary key not null auto_increment,
    name char(100) unique not null
);

create table instlib(
    id integer primary key not null auto_increment,
    name char(100) not null,
    location char(250) not null
);

create table sellers(
    id integer primary key not null auto_increment,
    location char(250) not null,
    contact char(13) unique not null
);

create table books(
    isbn integer primary key not null,
    name char(100) not null,
    author_id integer not null,
    foreign key(author_id) references authors(author_id)
);

create table buys_from(
    institute_id integer not null,
    seller_id integer not null,
    foreign key(institute_id) references instlib(id)
);

create table members(
    id integer primary key not null auto_increment,
    name char(100) not null,
    institute_id integer not null,
    department_id integer not null,
    foreign key(institute_id) references instlib(id),
    foreign key(department_id) references department(id)
);

create table owns(
    institute_id integer not null,
    isbn integer not null,
    copies integer not null,
    foreign key(institute_id) references instlib(id),
    primary key(institute_id, isbn)
);

create table publishers(
    id integer primary key not null auto_increment,
    isbn integer not null,
    name char(100) not null,
    foreign key(isbn) references books(isbn)
);

create table sells(
    seller_id integer not null,
    publisher_id integer not null,
    foreign key(seller_id) references sellers(id),
    foreign key(publisher_id) references publishers(id)
);

create table staff(
    member_id integer primary key not null,
    post char(100) not null,
    salary integer not null,
    foreign key(member_id) references members(id)
);

create table student(
    member_id integer primary key not null,
    gpa float not null,
    yr year not null,
    foreign key(member_id) references members(id)
);
/* end of siu_library/schema.sql */
