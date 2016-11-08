/* bplus/functions.sql */
/* Date  : 06 November 2016
 * Author: Ankit Pati
 */

use bplus;

delimiter $
create function nearest_donor(patient_id integer unsigned)
returns int unsigned
begin
    declare lat1, lat2, lon1, lon2 decimal(8, 6);
    declare donor_id, nearest_donor_id integer unsigned default 0;
    declare donor_cap boolean;

    declare distance, min_distance float default 6371000.0;

    declare end_of_cur boolean default false;
    declare cur cursor for
        select person_id, capable, latitude, longitude from donor;
    declare continue handler for not found set end_of_cur = true;

    select latitude, longitude into lat1, lon1
    from patient inner join hospital
        on(registration_number = hospital_registration_number)
    where patient.person_id = patient_id;

    open cur;
    label: loop
        fetch cur into donor_id, donor_cap, lat2, lon2;
        if end_of_cur then
            leave label;
        end if;
        if not donor_cap then
            iterate label;
        end if;

        select sqrt(pow((lon2 - lon1) * cos((lat1 + lat2) / 2.0), 2.0) +
            pow(lat2 - lat1, 2.0)) * 6371000.0 into distance;

        if distance < min_distance then
            set min_distance = distance;
            set nearest_donor_id = donor_id;
        end if;
    end loop label;
    close cur;

    return nearest_donor_id;
end $
delimiter ;

delimiter $
create function total_blood_by_name(name char(100))
returns int unsigned
begin
    declare total int unsigned;
    select sum(volume) into total
    from request_log inner join person on(patient_id = person_id)
    where person.name = name
    group by patient_id;
    return total;
end $
delimiter ;

select nearest_donor(2);
select total_blood_by_name("Ankit Pati");
/* end of bplus/functions.sql */
