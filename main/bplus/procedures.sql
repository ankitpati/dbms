/* bplus/procedures.sql */
/* Date  : 06 November 2016
 * Author: Ankit Pati
 */

use bplus;

delimiter $
create procedure demit_patient(in person_id integer unsigned)
begin
    delete from patient where patient.person_id = person_id;
end $
delimiter ;

delimiter $
create procedure admit_patient(in person_id integer unsigned,
    in hospital_registration_number integer unsigned,
    in doctor_id integer unsigned)
begin
    start transaction;
        call demit_patient(person_id);
        insert into patient values(person_id, hospital_registration_number,
            doctor_id);
    commit;
end $
delimiter ;

delimiter $
create procedure close_request(in patient_id integer unsigned)
begin
    delete from request where request.patient_id = patient_id;
end $
delimiter ;

delimiter $
create procedure make_request(in patient_id integer unsigned,
    in volume integer unsigned)
begin
    start transaction;
        call close_request(patient_id);
        insert into request values(patient_id, volume);
    commit;
end $
delimiter ;

call admit_patient(9, 1, 7);
call make_request(9, 2);
call make_request(2, 4);
/* end of bplus/procedures.sql */
