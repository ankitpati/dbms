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
update books set price = price * 11 where bid = 5555;
update books set price = price / 11 where bid = 5555;
select * from book_log;

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
insert into books_by values(5555, 5, 5);
delete from books_by where bid = 5555 and aid = 5 and pid = 5;
select * from books_by_log;

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
update purchase set month = 2 where bid = 3333;
update purchase set month = 1 where bid = 3333;
select * from purchase_log;
/* end of siu_library/triggers.sql */
