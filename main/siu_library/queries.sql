/* siu_library/queries.sql */
/* Date  : 04 August 2016
 * Author: Ankit Pati
 */

use siu_library;

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

select sum(totalcopies) as "Total copies in SIT"
from library natural join books
where lname = "SIT";

select avg(price) as "Average price of books by Dennis Ritchie"
from books natural join books_by natural join author
where aname = "Dennis Ritchie";

select sum(totalcopies) as "Total books sold by sellers in Kolkata"
from seller natural join purchase inner join library using(lid)
    inner join books using(bid)
where seller.city = "Kolkata";

select bname as "Cheapest book in SIT"
from books natural join library
where lname = "SIT" and price = (
    select min(price)
    from books natural join library
    where lname = "SIT"
);

select lname as "Library with costliest book"
from books natural join library
where price = (
    select max(price)
    from books natural join library
);

select count(*) as "Issuers from SIT"
from books inner join issue using(bid) inner join student on(sid = memid)
    natural join department
where institutename = "SIT";

select avg(price) as "Average price of books in SIT"
from books natural join library
where lname = "SIT";

select sum(price) as "Price of purchases by SIBM in January"
from books inner join purchase using(bid) inner join library
    on(library.lid = purchase.lid)
where lname = "SIBM" and month = 1;

select count(*) as "Number of books by Dennis Ritchie"
from books natural join books_by natural join author
where aname = "Dennis Ritchie";

select bname as "Costliest book by Tata McGraw Hill"
from publisher natural join books_by natural join books
where pname = "Tata McGraw Hill" and price = (
    select max(price)
    from publisher natural join books_by natural join books
    where pname = "Tata McGraw Hill"
);

select upper(sname) as "SSBS Students in ALL CAPS"
from student natural join department
where institutename = "SSBS";

select date_add(issuedate, interval 2 month)
    as "2 months post issue of Dennis Ritchie's book"
from issue inner join books using(bid) inner join books_by using(bid)
    inner join author using(aid)
where aname = "Dennis Ritchie";

select last_day(issuedate) as "Last day of month when Tiashaa issued a book"
from issue inner join student on(sid = memid)
where sname = "Tiashaa Chatterjee";

select lname as "Institute with highest number of books"
from library
where lid in (
    select lid
    from books
    group by lid
    having sum(totalcopies) in (
        select max(num)
        from (
            select lid, sum(totalcopies) as num
            from books
            group by lid
        ) tmpalias
    )
);

select lower(lname) as "Institute with highest number of books in `lower case`",
    sum(totalcopies) as "Total copies"
from books natural join library
where lid = (
    select lid
    from (
        select lid, sum(totalcopies) as tmpsum
        from books
        group by lid
        order by tmpsum desc
    ) tmpalias
    limit 1
)
group by lname;
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

+---------------------+
| Total copies in SIT |
+---------------------+
|                   6 |
+---------------------+

+------------------------------------------+
| Average price of books by Dennis Ritchie |
+------------------------------------------+
|                                 450.0000 |
+------------------------------------------+

+----------------------------------------+
| Total books sold by sellers in Kolkata |
+----------------------------------------+
|                                      5 |
+----------------------------------------+

+----------------------------+
| Cheapest book in SIT       |
+----------------------------+
| The C Programming Language |
+----------------------------+

+-----------------------------+
| Library with costliest book |
+-----------------------------+
| SIBM                        |
+-----------------------------+

+------------------+
| Issuers from SIT |
+------------------+
|                1 |
+------------------+

+-------------------------------+
| Average price of books in SIT |
+-------------------------------+
|                      433.3333 |
+-------------------------------+

+---------------------------------------+
| Price of purchases by SIBM in January |
+---------------------------------------+
|                                   500 |
+---------------------------------------+

+-----------------------------------+
| Number of books by Dennis Ritchie |
+-----------------------------------+
|                                 2 |
+-----------------------------------+

+------------------------------------+
| Costliest book by Tata McGraw Hill |
+------------------------------------+
| Law of Torts                       |
+------------------------------------+

+---------------------------+
| SSBS Students in ALL CAPS |
+---------------------------+
| MAYANK                    |
+---------------------------+

+----------------------------------------------+
| 2 months post issue of Dennis Ritchie's book |
+----------------------------------------------+
| 1996-02-13                                   |
| 1997-02-13                                   |
| 1999-02-13                                   |
| 2000-02-13                                   |
+----------------------------------------------+

+----------------------------------------------+
| Last day of month when Tiashaa issued a book |
+----------------------------------------------+
| 1995-12-31                                   |
+----------------------------------------------+

+----------------------------------------+
| Institute with highest number of books |
+----------------------------------------+
| SIT                                    |
+----------------------------------------+

+--------------------------------------------------------+--------------+
| Institute with highest number of books in `lower case` | Total copies |
+--------------------------------------------------------+--------------+
| sit                                                    |            6 |
+--------------------------------------------------------+--------------+

*/
