/* siu_library/triggers.sql */
/* Date  : 19 October 2016
 * Author: Ankit Pati
 */

use siu_library;

delimiter $
create trigger after_updatebooks
after update on books
for each row
begin
    insert into book_log
    set action = "update", bid = old.bid, bname = old.bname, lid = old.lid,
            price = old.price, totalcopies = old.totalcopies, changedon = now();
end $
delimiter ;

delimiter $
create trigger before_inserbooks
before insert on books_by
for each row
begin
    insert into books_by_log
    set action = "insert", bid = new.bid, aid = new.aid, pid = new.pid,
                                                              changedon = now();
end $
delimiter ;

delimiter $
create trigger after_updatepurchase
after update on purchase
for each row
begin
    insert into purchase_log
    set action = "update", prid = old.prid, lid = old.lid, slid = old.slid,
             pid = old.pid, bid = old.bid, month = old.month, changedon = now();
end $
delimiter ;
/* end of siu_library/triggers.sql */

/* OUTPUT

update books set price = price * 11 where bid = 5555;
update books set price = price / 11 where bid = 5555;
select * from book_log \G
*************************** 1. row ***************************
        tid: 1
        bid: 5555
      bname: The Modern Prometheus
        lid: 4
      price: 7800
totalcopies: 3
  changedon: 2016-10-19 10:08:47
     action: update
*************************** 2. row ***************************
        tid: 2
        bid: 5555
      bname: The Modern Prometheus
        lid: 4
      price: 85800
totalcopies: 3
  changedon: 2016-10-19 10:09:30
     action: update

insert into books_by values(5555, 5, 5);
delete from books_by where bid = 5555 and aid = 5 and pid = 5;
select * from books_by_log;
+-----+------+-----+-----+---------------------+--------+
| tid | bid  | aid | pid | changedon           | action |
+-----+------+-----+-----+---------------------+--------+
|   1 | 5555 |   5 |   5 | 2016-10-19 10:41:39 | insert |
+-----+------+-----+-----+---------------------+--------+

update purchase set month = 2 where bid = 3333;
update purchase set month = 1 where bid = 3333;
select * from purchase_log;
+-----+------+-----+------+-----+------+-------+---------------------+--------+
| tid | prid | lid | slid | pid | bid  | month | changedon           | action |
+-----+------+-----+------+-----+------+-------+---------------------+--------+
|   1 |    3 |   4 |    1 |   2 | 3333 |     1 | 2016-10-19 10:55:53 | update |
|   2 |    3 |   4 |    1 |   2 | 3333 |     2 | 2016-10-19 10:55:53 | update |
+-----+------+-----+------+-----+------+-------+---------------------+--------+

*/
