/* bplus/triggers.sql */
/* Date  : 06 November 2016
 * Author: Ankit Pati
 */

use bplus;

delimiter $
create trigger before_patient_entry
before insert on patient
for each row
begin
    insert into patient_log
        (person_id, hospital_registration_number, doctor_id, admitted_on)
        values(new.person_id, new.hospital_registration_number, new.doctor_id,
            now());
end $
delimiter ;

delimiter $
create trigger before_request_entry
before insert on request
for each row
begin
    insert into request_log (patient_id, volume, made_on)
        values(new.patient_id, new.volume, now());
end $
delimiter ;
/* end of bplus/triggers.sql */
