/* siu_library/queries.sql */
/* Date  : 04 August 2016
 * Author: Ankit Pati
 */

select distinct lname as "Libraries in Pune"
from library
where city = "Pune";

select distinct institutename as "IT department is in"
from department
where deptname = "Information Technology";

select distinct sname as "Students in IT"
from student natural join department
where deptname = "Information Technology";

select distinct bname as "Books by Brian and McGraw Hill"
from books natural join publisher natural join books_by natural join author
where aname = "Brian Kernighan" and pname = "Tata McGraw Hill";

select distinct bname as "Books with copies < 3 in SIT"
from library natural join books
where lname = "SIT" and totalcopies < 3;

select distinct stname as "Starts with 'A'"
from staff
where stname like "A%";

select distinct bname as "Books in SIT"
from library natural join books
where lname = "SIT";

select distinct bname as "Books by Ken"
from books natural join publisher natural join books_by natural join author
where aname = "Ken Thompson";

select distinct bname as "Books issued by Tiashaa"
from books inner join issue using(bid) inner join student on(sid = memid)
where sname = "Tiashaa Chatterjee";

select distinct bname as "Books issued by SLS Staff"
from books inner join issue using(bid) inner join staff on(stid = memid)
    natural join department
where institutename = "SLS" and deptname = "Common Law";

select distinct slname as "Sellers in same city as SIT"
from seller natural join library
where lname = "SIT";

select distinct pname as "Provides books to SSBS through College Book Store"
from publisher natural join books_by natural join library natural join seller
    natural join sells
where slname = "College Book Store" and lname = "SSBS";

select distinct bname as "Books by Dennis and Prentice Hall"
from books natural join publisher natural join books_by natural join author
where aname = "Dennis Ritchie" and pname = "Prentice Hall";

select slname as "Seller", pname as "Publisher", bname as "Book"
from purchase natural join library inner join seller using(slid)
    inner join publisher using(pid) inner join books using(bid)
where lname = "SIT" and month = 12;

    select distinct lname as "Institute Name"
    from issue i natural join library inner join student s on(i.memid = s.sid)
    where bid = 4444
union
    select distinct lname as "Institute Name"
    from issue i natural join library inner join staff s on(i.memid = s.stid)
    where bid = 4444;

select slname as "Sellers selling to libraries in same city"
from library natural join seller natural join purchase;

select aname as "Authors with books costing more than ₹500"
from author natural join books_by natural join books
where price > 500;
/* end of siu_library/queries.sql */

/* OUTPUT

+-------------------+
| Libraries in Pune |
+-------------------+
| SIT               |
| SSBS              |
+-------------------+

+---------------------+
| IT department is in |
+---------------------+
| SIT                 |
+---------------------+

+----------------+
| Students in IT |
+----------------+
| Ankit Pati     |
+----------------+

+--------------------------------+
| Books by Brian and McGraw Hill |
+--------------------------------+
| The C++ Programming Language   |
| Law of Torts                   |
+--------------------------------+

+------------------------------+
| Books with copies < 3 in SIT |
+------------------------------+
| The C Programming Language   |
| The Unix Philosophy          |
+------------------------------+

+-----------------+
| Starts with 'A' |
+-----------------+
| Ahmed Raza      |
+-----------------+

+------------------------------+
| Books in SIT                 |
+------------------------------+
| The C Programming Language   |
| The C++ Programming Language |
| The Unix Philosophy          |
+------------------------------+

+----------------------------+
| Books by Ken               |
+----------------------------+
| The C Programming Language |
| Law of Torts               |
| The Modern Prometheus      |
+----------------------------+

+-------------------------+
| Books issued by Tiashaa |
+-------------------------+
| The Unix Philosophy     |
+-------------------------+

<Empty set>

+-----------------------------+
| Sellers in same city as SIT |
+-----------------------------+
| College Book Store          |
+-----------------------------+

+---------------------------------------------------+
| Provides books to SSBS through College Book Store |
+---------------------------------------------------+
| Tata McGraw Hill                                  |
| Prentice Hall                                     |
+---------------------------------------------------+

+-----------------------------------+
| Books by Dennis and Prentice Hall |
+-----------------------------------+
| The C Programming Language        |
| The Unix Philosophy               |
+-----------------------------------+

+--------------------+------------------+---------------------+
| Seller             | Publisher        | Book                |
+--------------------+------------------+---------------------+
| College Book Store | Nirali Prakashan | The Unix Philosophy |
+--------------------+------------------+---------------------+

+----------------+
| Institute Name |
+----------------+
| SIT            |
| SSBS           |
| SLS            |
+----------------+

+-------------------------------------------+
| Sellers selling to libraries in same city |
+-------------------------------------------+
| College Book Store                        |
| Crossword                                 |
+-------------------------------------------+

+---------------------------------------------+
| Authors with books costing more than ₹500   |
+---------------------------------------------+
| Brian Kernighan                             |
| Dennis Ritchie                              |
| Ken Thompson                                |
| Mike Stone                                  |
+---------------------------------------------+

*/
