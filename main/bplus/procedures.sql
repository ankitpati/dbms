/* bplus/procedures.sql */
/* Date  : 06 November 2016
 * Author: Ankit Pati
 */

use bplus;

delimiter $
create procedure admit_patient(in person_id integer unsigned,
    in hospital_registration_number integer unsigned,
    in doctor_id integer unsigned)
begin
    start transaction;
        insert into patient values(person_id, hospital_registration_number,
            doctor_id);
    commit;
end $
delimiter ;
call admit_patient(9, 1, 7);

delimiter $
create procedure make_request(in patient_id integer unsigned,
    in volume integer unsigned)
begin
    start transaction;
        insert into request values(patient_id, volume);
    commit;
end $
delimiter ;
call make_request(9, 2);
/* end of bplus/procedures.sql */
