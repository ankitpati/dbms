/* siu_library/procedures.sql */
/* Date  : 12 October 2016
 * Author: Ankit Pati
 */

use siu_library;

delimiter $
create procedure books_by_lname(in lname text)
begin
    select *
    from books b, library l
    where b.lid = l.lid and l.lname = lname;
end $
delimiter ;

delimiter $
create procedure booknum_by_author(in aname text, out totalcopies int unsigned)
begin
    select count(*)
    from books_by natural join author
    where author.aname = aname
    group by aid
    into totalcopies;
end $
delimiter ;

delimiter $
create procedure pubnum_by_library(in lname text, out pubnum int unsigned)
begin
    select count(distinct pid)
    from purchase natural join publisher inner join library using(lid)
    where library.lname = lname
    group by lid
    into pubnum;
end $
delimiter ;

delimiter $
create procedure costly_cheap(in lname text, out costly text, out cheap text)
begin
    select bname
    from books natural join library
    where price = (
        select max(price)
        from books natural join library
        where library.lname = lname
    )
    into costly;

    select bname
    from books natural join library
    where price = (
        select min(price)
        from books natural join library
        where library.lname = lname
    )
    into cheap;
end $
delimiter ;

delimiter $
create procedure update_price_by_author(in aname text)
begin
    update books
    set price = price + (25 * price) / 100
    where bid in (
        select bid
        from (select * from books) as bks
            natural join books_by natural join author
        where author.aname = aname
    );
end $
delimiter ;

delimiter $
create procedure update_price_by_seller(in slname text)
begin
    update books
    set price = price + (10 * price) / 100
    where bid in (
        select bid
        from seller natural join purchase inner join library using(lid)
            inner join (select * from books) as bks using(bid)
        where seller.slname = slname
    );
end $
delimiter ;

delimiter $
create procedure amount_in_month(in lname text, in month int unsigned)
begin
    select sum(price)
    from purchase natural join library inner join books using(bid)
    where library.lname = lname and purchase.month = month;
end $
delimiter ;
/* end of siu_library/procedures.sql */

/* OUTPUT

call books_by_lname("SIT") \G
*************************** 1. row ***************************
        bid: 1111
      bname: The C Programming Language
totalcopies: 2
        lid: 1
      price: 300
        lid: 1
      lname: SIT
       city: Pune
*************************** 2. row ***************************
        bid: 2222
      bname: The C++ Programming Language
totalcopies: 3
        lid: 1
      price: 400
        lid: 1
      lname: SIT
       city: Pune
*************************** 3. row ***************************
        bid: 4444
      bname: The Unix Philosophy
totalcopies: 1
        lid: 1
      price: 600
        lid: 1
      lname: SIT
       city: Pune

call booknum_by_author("Brian Kernighan", @totalcopies);
select @totalcopies as "Total copies by Brian Kernighan";
+---------------------------------+
| Total copies by Brian Kernighan |
+---------------------------------+
|                               3 |
+---------------------------------+

call pubnum_by_library("SIT", @pubnum);
select @pubnum as "Number of publishers supplying SIT library";
+--------------------------------------------+
| Number of publishers supplying SIT library |
+--------------------------------------------+
|                                          1 |
+--------------------------------------------+

call costly_cheap("SIT", @costly, @cheap);
select @costly as "Costliest book in SIT", @cheap as "Cheapest book in SIT";
+-----------------------+----------------------------+
| Costliest book in SIT | Cheapest book in SIT       |
+-----------------------+----------------------------+
| The Unix Philosophy   | The C Programming Language |
+-----------------------+----------------------------+

call update_price_by_author("Brian Kernighan");
select bid, bname, price as "Updated Prices"
from books natural join books_by natural join author
where aname = "Brian Kernighan";
+------+------------------------------+----------------+
| bid  | bname                        | Updated Prices |
+------+------------------------------+----------------+
| 2222 | The C++ Programming Language |            500 |
| 3333 | Law of Torts                 |            625 |
| 4444 | The Unix Philosophy          |            750 |
+------+------------------------------+----------------+

call update_price_by_seller("Golden Books");
select bid, bname, price as "Updated Prices"
from seller natural join purchase inner join library using(lid)
    inner join books using(bid)
where slname = "Golden Books";
+------+---------------------+----------------+
| bid  | bname               | Updated Prices |
+------+---------------------+----------------+
| 4444 | The Unix Philosophy |            825 |
+------+---------------------+----------------+

call amount_in_month("SIT", 12);
+------------+
| sum(price) |
+------------+
|        825 |
+------------+

*/
