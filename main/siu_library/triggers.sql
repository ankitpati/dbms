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
/* end of siu_library/triggers.sql */
