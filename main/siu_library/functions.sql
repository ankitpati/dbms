/* siu_library/functions.sql */
/* Date  : 12 October 2016
 * Author: Ankit Pati
 */

use siu_library;

create function multi(num1 int, num2 int)
returns int deterministic
return num1 * num2;

delimiter $
create function factorial(num int unsigned)
returns int unsigned deterministic
begin
    declare res int unsigned;
    set res = 1;
    label: loop
        if num = 0 then
            leave label;
        end if;
        set res = res * num;
        set num = num - 1;
    end loop label;
    return res;
end $
delimiter ;

delimiter $
create function maximum(x int, y int)
returns int deterministic
begin
    if x > y then
        return x;
    else
        return y;
    end if;
end $
delimiter ;

create function average(q int, w int, e int, r int)
returns int deterministic
return (q + w + e + r) / 4;

delimiter $
create function totalbooks()
returns int
begin
    declare books_in_siu int unsigned;
    select count(*) into books_in_siu from books;
    return books_in_siu;
end $
delimiter ;

delimiter $
create function lib_with_cheapest_book()
returns text
begin
    declare lname text;
    select distinct(library.lname) into lname
    from books natural join library
    where price in (select min(price) from books);
    return lname;
end $
delimiter ;

delimiter $
create function totalbooks_by_sit_staff()
returns int unsigned
begin
    declare issued_books_count int unsigned;
    select count(*) into issued_books_count
    from books inner join issue using(bid) inner join staff on(stid = memid)
        natural join department
    where institutename = "SIT";
    return issued_books_count;
end $
delimiter ;
/* end of siu_library/functions.sql */

/* OUTPUT

select multi(43, 5) as "43 * 5";
+--------+
| 43 * 5 |
+--------+
|    215 |
+--------+

select factorial(5) as "5!";
+------+
| 5!   |
+------+
|  120 |
+------+

select maximum(43, 5);
+----------------+
| maximum(43, 5) |
+----------------+
|             43 |
+----------------+

select average(30, 40, 50, 60);
+-------------------------+
| average(30, 40, 50, 60) |
+-------------------------+
|                      45 |
+-------------------------+

select totalbooks() as "Books in SIU Libraries";
+------------------------+
| Books in SIU Libraries |
+------------------------+
|                      5 |
+------------------------+

select lib_with_cheapest_book() as "Library with cheapest book";
+----------------------------+
| Library with cheapest book |
+----------------------------+
| SIT                        |
+----------------------------+

select totalbooks_by_sit_staff() as "Total books issued by SIT staff";
+---------------------------------+
| Total books issued by SIT staff |
+---------------------------------+
|                               1 |
+---------------------------------+

*/
