/* siu_library/schema.sql */
/* Date  : 03 August 2016
 * Author: Ankit Pati
 */

use siu_library;

insert into authors (name) values("Brian Kernighan");
insert into authors (name) values("Dennis Ritchie");
insert into authors (name) values("Ken Thompson");
insert into authors (name) values("Mike Stone");
insert into authors (name) values("P. B. Shelley");

insert into department (name) values("Computer Science");
insert into department (name) values("Information Technology");
insert into department (name) values("Electronics and Telecommunication");
insert into department (name) values("Mechanical Engineering");
insert into department (name) values("Civil Engineering");

insert into instlib (name, location) values("Symbiosis Institute of Technology", "Pune");
insert into instlib (name, location) values("Symbiosis School of Biomedical Sciences", "Pune");
insert into instlib (name, location) values("Symbiosis School of Culinary Arts", "Kolkata");
insert into instlib (name, location) values("Symbiosis Institute of Business Management", "Hyderabad");
insert into instlib (name, location) values("Symbiosis Law School", "Bhubaneswar");

insert into sellers (location, contact) values("Kolkata", "+919999988888");
insert into sellers (location, contact) values("Pune", "+918888899999");
insert into sellers (location, contact) values("Hyderabad", "+918888888888");
insert into sellers (location, contact) values("Bhubaneswar", "+919999999999");
insert into sellers (location, contact) values("Cuttack", "+919999911111");

insert into books values(1111, "The C Programming Language", 2);
insert into books values(2222, "The C++ Programming Language", 3);
insert into books values(3333, "Law of Torts", 4);
insert into books values(4444, "The Unix Philosophy", 1);
insert into books values(5555, "The Modern Prometheus", 5);

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

insert into members (name, institute_id, department_id) values("Ankit Pati", 1, 2);
insert into members (name, institute_id, department_id) values("Tiashaa Chatterjee", 5, 5);
insert into members (name, institute_id, department_id) values("Mayank Verma", 2, 1);
insert into members (name, institute_id, department_id) values("Sahil Pandey", 4, 3);
insert into members (name, institute_id, department_id) values("Ravi Tripathi", 3, 1);

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

insert into publishers (isbn, name) values(2222, "Tata McGraw Hill");
insert into publishers (isbn, name) values(1111, "Prentice Hall");
insert into publishers (isbn, name) values(3333, "Nirali Prakashan");
insert into publishers (isbn, name) values(5555, "Hello World");
insert into publishers (isbn, name) values(4444, "Sunshine");

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

insert into staff values(3, "Librarian", 50000);
insert into staff values(4, "Professor", 200000);

insert into student values(1, 3.5, 3);
insert into student values(2, 3.9, 3);
insert into student values(5, 3.2, 2);
/* end of siu_library/schema.sql */
