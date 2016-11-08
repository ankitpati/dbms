/* bplus/queries.sql */
/* Date  : 06 November 2016
 * Author: Ankit Pati
 */

use bplus;

select name as "Name", phone_number as "Phone Number"
from person natural join phone;

select person.name as "Dr", hospital.name as "Hospital"
from person natural join doctor
    inner join hospital on(registration_number = hospital_registration_number);

select sum(volume) as "Total blood requested"
from request;

select sum(volume) as "Total blood requested by Ankit"
from request_log inner join person on(patient_id = person_id)
where name = "Ankit Pati"
group by patient_id;

select latitude, longitude
from patient
    inner join hospital on(registration_number = hospital_registration_number)
where person_id = 2;

select *
from person natural join donor
where person_id = (select nearest_donor(2));
/* end of bplus/queries.sql */
