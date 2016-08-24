/* siu_library/updates.sql */
/* Date  : 24 August 2016
 * Author: Ankit Pati
 */

use siu_library;

update books
set price = price * 11
where bid = 5555;

update seller
set city = "Nagpur"
where slname = "City Book Store";

update publisher natural join books_by natural join books
set price = price + 100
where pname = "Nirali Prakashan";

update books natural join books_by natural join author
set totalcopies = totalcopies - 2
where aname = "Mike Stone";

update department
set deptname = "CS"
where institutename = "SIT" and deptname = "Computer Science";

update department natural join student
set sname = "Mayank"
where institutename = "SSBS" and deptname = "Medicine";
/* end of siu_library/updates.sql */
