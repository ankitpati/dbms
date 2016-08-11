/* siu_library/schema.sql */
/* Date  : 03 August 2016
 * Author: Ankit Pati
 */

use siu_library;

insert into library (lname, city) values("SIT", "Pune");
insert into library (lname, city) values("SSBS", "Pune");
insert into library (lname, city) values("SSCA", "Kolkata");
insert into library (lname, city) values("SIBM", "Hyderabad");
insert into library (lname, city) values("SLS", "Bhubaneswar");

insert into books values(1111, "The C Programming Language", 2, 1);
insert into books values(2222, "The C++ Programming Language", 3, 1);
insert into books values(3333, "Law of Torts", 4, 5);
insert into books values(4444, "The Unix Philosophy", 1, 1);
insert into books values(5555, "The Modern Prometheus", 5, 4);

insert into author (aname) values("Brian Kernighan");
insert into author (aname) values("Dennis Ritchie");
insert into author (aname) values("Ken Thompson");
insert into author (aname) values("Mike Stone");
insert into author (aname) values("P. B. Shelley");

insert into publisher (pname) values("Tata McGraw Hill");
insert into publisher (pname) values("Prentice Hall");
insert into publisher (pname) values("Nirali Prakashan");
insert into publisher (pname) values("Hello World");
insert into publisher (pname) values("Sunshine");

insert into seller (slname, city) values("National Book Store", "Kolkata");
insert into seller (slname, city) values("College Book Store", "Pune");
insert into seller (slname, city) values("Crossword", "Hyderabad");
insert into seller (slname, city) values("City Book Store", "Bhubaneswar");
insert into seller (slname, city) values("Golden Books", "Cuttack");

insert into books_by values(1111, 3, 4);
insert into books_by values(1111, 2, 2);
insert into books_by values(2222, 5, 5);
insert into books_by values(2222, 1, 1);
insert into books_by values(3333, 3, 4);
insert into books_by values(3333, 1, 1);
insert into books_by values(4444, 2, 2);
insert into books_by values(4444, 1, 2);
insert into books_by values(5555, 4, 3);
insert into books_by values(5555, 3, 3);

insert into department (deptname, institutename) values("Information Technology", "SIT");
insert into department (deptname, institutename) values("Computer Science", "SIT");
insert into department (deptname, institutename) values("Nutrition", "SSBS");
insert into department (deptname, institutename) values("Medicine", "SSBS");
insert into department (deptname, institutename) values("Torts", "SLS");
insert into department (deptname, institutename) values("Common Law", "SLS");
insert into department (deptname, institutename) values("Cuisine", "SSCA");
insert into department (deptname, institutename) values("Nutrition", "SSCA");
insert into department (deptname, institutename) values("Accounting", "SIBM");
insert into department (deptname, institutename) values("Communication", "SIBM");

insert into student values(543, "Tiashaa Chatterjee", 6);
insert into student values(506, "Ankit Pati", 1);
insert into student values(412, "Sahil Pandey", 9);
insert into student values(125, "Ravi Tripathi", 5);
insert into student values(445, "Mayank Verma", 4);

insert into staff values(14, "Pradeep Bhattacharya", 6);
insert into staff values(43, "Subho Das", 1);
insert into staff values(42, "Sanjay Basak", 9);
insert into staff values(48, "Ahmed Raza", 8);
insert into staff values(79, "Chandan Chatterjee", 7);

insert into purchase (lid, slid, pid, bid, month) values(1, 2, 3, 4444, 12);
insert into purchase (lid, slid, pid, bid, month) values(4, 3, 2, 1111, 4);
insert into purchase (lid, slid, pid, bid, month) values(4, 1, 2, 3333, 1);
insert into purchase (lid, slid, pid, bid, month) values(5, 1, 2, 4444, 11);
insert into purchase (lid, slid, pid, bid, month) values(2, 5, 3, 4444, 5);

insert into issue (memid, bid, lid, issuedate, returndate) values(543, 4444, 1, "1995-12-13", "1996-04-02");
insert into issue (memid, bid, lid, issuedate, returndate) values(506, 1111, 4, "1996-12-13", "1997-04-02");
insert into issue (memid, bid, lid, issuedate, returndate) values(43, 3333, 4, "1997-12-13", "1998-04-02");
insert into issue (memid, bid, lid, issuedate, returndate) values(48, 4444, 5, "1998-12-13", "1999-04-02");
insert into issue (memid, bid, lid, issuedate, returndate) values(445, 4444, 2, "1999-12-13", "2000-04-02");

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
/* end of siu_library/schema.sql */
