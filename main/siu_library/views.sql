/* siu_library/views.sql */
/* Date  : 20 October 2016
 * Author: Ankit Pati
 */

use siu_library;

create view staff_issue as
select deptid, bid, bname, totalcopies, price, issueid, memid, issuedate,
    returndate, stid, stname, deptname, institutename
from books inner join issue using(bid) inner join staff on(stid = memid)
    natural join department;

create view author_books as
select aid as "Author ID", aname as "Author", bid as "Book ID", bname as "Book"
from author natural join books_by natural join books;
/* end of siu_library/views.sql */

/* OUTPUT

select * from staff_issue \G
*************************** 1. row ***************************
       deptid: 1
          bid: 3333
        bname: Law of Torts
  totalcopies: 4
        price: 500
      issueid: 3
        memid: 43
    issuedate: 1997-12-13
   returndate: 1998-04-02
         stid: 43
       stname: Subho Das
     deptname: Information Technology
institutename: SIT
*************************** 2. row ***************************
       deptid: 8
          bid: 4444
        bname: The Unix Philosophy
  totalcopies: 1
        price: 600
      issueid: 4
        memid: 48
    issuedate: 1998-12-13
   returndate: 1999-04-02
         stid: 48
       stname: Ahmed Raza
     deptname: Nutrition
institutename: SSCA

select * from author_books;
+-----------+-----------------+---------+------------------------------+
| Author ID | Author          | Book ID | Book                         |
+-----------+-----------------+---------+------------------------------+
|         2 | Dennis Ritchie  |    1111 | The C Programming Language   |
|         3 | Ken Thompson    |    1111 | The C Programming Language   |
|         1 | Brian Kernighan |    2222 | The C++ Programming Language |
|         5 | P. B. Shelley   |    2222 | The C++ Programming Language |
|         1 | Brian Kernighan |    3333 | Law of Torts                 |
|         3 | Ken Thompson    |    3333 | Law of Torts                 |
|         1 | Brian Kernighan |    4444 | The Unix Philosophy          |
|         2 | Dennis Ritchie  |    4444 | The Unix Philosophy          |
|         3 | Ken Thompson    |    5555 | The Modern Prometheus        |
|         4 | Mike Stone      |    5555 | The Modern Prometheus        |
+-----------+-----------------+---------+------------------------------+

*/
