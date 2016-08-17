/* siu_library/schema.sql */
/* Date  : 03 August 2016
 * Author: Ankit Pati
 */

drop database siu_library;
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
    foreign key(lid) references library(lid)
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
    foreign key(bid) references books(bid),
    foreign key(aid) references author(aid),
    foreign key(pid) references publisher(pid)
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
    foreign key(deptid) references department(deptid)
);

create table staff(
    stid integer primary key not null,
    stname char(100) not null,
    deptid integer not null,
    foreign key(deptid) references department(deptid)
);

create table purchase(
    prid integer primary key not null auto_increment,
    lid integer not null,
    slid integer not null,
    pid integer not null,
    bid integer not null,
    month integer not null,
    foreign key(lid) references library(lid),
    foreign key(slid) references seller(slid),
    foreign key(pid) references publisher(pid),
    foreign key(bid) references books(bid)
);

create table issue(
    issueid integer primary key not null auto_increment,
    memid integer not null,
    bid integer not null,
    lid integer not null,
    issuedate date not null,
    returndate date not null,
    foreign key(bid) references books(bid),
    foreign key(lid) references library(lid)
);

create table sells(
    slid integer not null,
    pid integer not null,
    unique(slid, pid),
    foreign key(slid) references seller(slid),
    foreign key(pid) references publisher(pid)
);
/* end of siu_library/schema.sql */
