/* siu_library/deletes.sql */
/* Date  : 24 August 2016
 * Author: Ankit Pati
 */

delete
from books natural join library inner join department on(institutename = lname)
    natural join student
where institutename = "SIT" and deptname in
    ("Computer Science", "Information Technology");

delete
from books
where bid in (
    select bid from books_by where aid in (
        select aid from author where aname = "Dennis Ritchie"
    )
);
/* end of siu_library/deletes.sql */
