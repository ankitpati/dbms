/* siu_library/schema.sql */
/* Date  : 03 August 2016
 * Author: Ankit Pati
 */

drop database if exists siu_library;
create database siu_library;
use siu_library;

create table library(
    lid integer primary key not null auto_increment,
    lname char(100) not null,
    city char(100) not null
);

create table books(
    bid integer primary key not null,
    bname char(100) not null,
    totalcopies integer not null,
    lid integer not null,
    price integer not null,
    foreign key(lid) references library(lid) on delete cascade
);

create table author(
    aid integer primary key not null auto_increment,
    aname char(100) not null
);

create table publisher(
    pid integer primary key not null auto_increment,
    pname char(100) not null
);

create table seller(
    slid integer primary key not null auto_increment,
    slname char(100) not null,
    city char(100) not null
);

create table books_by(
    bid integer not null,
    aid integer not null,
    pid integer not null,
    unique(bid, aid, pid),
    foreign key(bid) references books(bid) on delete cascade,
    foreign key(aid) references author(aid) on delete cascade,
    foreign key(pid) references publisher(pid) on delete cascade
);

create table department(
    deptid integer primary key not null auto_increment,
    deptname char(100) not null,
    institutename char(100) not null,
    unique(deptname, institutename)
);

create table student(
    sid integer primary key not null,
    sname char(100) not null,
    deptid integer not null,
    foreign key(deptid) references department(deptid) on delete cascade
);

create table staff(
    stid integer primary key not null,
    stname char(100) not null,
    deptid integer not null,
    foreign key(deptid) references department(deptid) on delete cascade
);

create table purchase(
    prid integer primary key not null auto_increment,
    lid integer not null,
    slid integer not null,
    pid integer not null,
    bid integer not null,
    month integer not null,
    foreign key(lid) references library(lid) on delete cascade,
    foreign key(slid) references seller(slid) on delete cascade,
    foreign key(pid) references publisher(pid) on delete cascade,
    foreign key(bid) references books(bid) on delete cascade
);

create table issue(
    issueid integer primary key not null auto_increment,
    memid integer not null,
    bid integer not null,
    lid integer not null,
    issuedate date not null,
    returndate date not null,
    foreign key(bid) references books(bid) on delete cascade,
    foreign key(lid) references library(lid) on delete cascade
);

create table sells(
    slid integer not null,
    pid integer not null,
    unique(slid, pid),
    foreign key(slid) references seller(slid) on delete cascade,
    foreign key(pid) references publisher(pid) on delete cascade
);

create table book_log(
    tid integer primary key not null auto_increment,
    bid integer not null,
    bname char(100) not null,
    lid integer not null,
    price integer not null,
    totalcopies integer not null,
    changedon datetime not null,
    action char(100) not null
);

create table books_by_log(
    tid integer primary key not null auto_increment,
    bid integer not null,
    aid integer not null,
    pid integer not null,
    changedon datetime not null,
    action char(100) not null
);

create table purchase_log(
    tid integer primary key not null auto_increment,
    prid integer not null,
    lid integer not null,
    slid integer not null,
    pid integer not null,
    bid integer not null,
    month integer not null,
    changedon datetime not null,
    action char(100) not null
);
/* end of siu_library/schema.sql */
