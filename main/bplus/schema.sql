/* bplus/schema.sql */
/* Date  : 06 November 2016
 * Author: Ankit Pati
 */

drop database if exists bplus;
create database bplus;
use bplus;

create table hospital(
    registration_number integer primary key not null auto_increment,
    name char(100) not null,

    latitude decimal(8, 6) not null,
    longitude decimal(8, 6) not null
);

create table person(
    person_id integer primary key not null auto_increment,
    password char(100) not null,
    name char(100) not null,
    age integer not null,
    gender char not null,
    blood_group char(3) not null,
    govt_id char(100) not null
);

create table phone(
    phone_number char(20) primary key not null,
    person_id integer not null,

    foreign key(person_id) references person(person_id) on delete cascade
);

create table donor(
    person_id integer primary key not null,
    capable boolean not null,
    cost integer not null,

    latitude decimal(8, 6) not null,
    longitude decimal(8, 6) not null,

    foreign key(person_id) references person(person_id) on delete cascade
);

create table doctor(
    person_id integer primary key not null,
    hospital_registration_number integer not null,

    foreign key(person_id) references person(person_id) on delete cascade,
    foreign key(hospital_registration_number)
        references hospital(registration_number) on delete cascade
);

create table patient(
    person_id integer primary key not null,
    hospital_registration_number integer not null,
    doctor_id integer not null,

    foreign key(person_id) references person(person_id) on delete cascade,
    foreign key(hospital_registration_number)
        references hospital(registration_number) on delete cascade,
    foreign key(doctor_id) references doctor(person_id) on delete cascade
);

create table caretaker(
    person_id integer not null,
    patient_id integer,

    primary key(person_id, patient_id),
    foreign key(person_id) references person(person_id) on delete cascade,
    foreign key(patient_id) references patient(person_id) on delete cascade
);

create table request(
    patient_id integer primary key not null,
    volume integer not null,

    foreign key(patient_id) references patient(person_id) on delete cascade
);
/* end of bplus/schema.sql */
