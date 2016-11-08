/* bplus/data.sql */
/* Date  : 06 November 2016
 * Author: Ankit Pati
 */

use bplus;

insert into hospital values(1, "AMRI", 22.636194, 88.398752);
insert into hospital values(2, "Fortis", 22.713490, 88.409739);
insert into hospital values(3, "Ruby", 22.604503, 88.463297);
insert into hospital values(4, "Medica", 22.392618, 88.427591);
insert into hospital values(5, "Peerless", 22.938792, 88.424845);

insert into person values(1, "p1", "Tiashaa Chatterjee", 20, "F", "B+", "T543");
insert into person values(2, "p2", "Ankit Pati", 20, "M", "B+", "A506");
insert into person values(3, "p3", "Sahil Pandey", 21, "M", "AB+", "S101");
insert into person values(4, "p4", "Ravi Tripathi", 19, "M", "O-", "R333");
insert into person values(5, "p5", "Mayank Verma", 21, "M", "B-", "M123");
insert into person values(6, "p6", "Saif Ali", 22, "M", "A-", "S111");
insert into person values(7, "p7", "Junaed Siddique", 20, "M", "A+", "J987");
insert into person values(8, "p8", "Shounak Paul", 20, "M", "O-", "S102");
insert into person values(9, "p9", "Ritwik Chakraborty", 18, "M", "O-", "R414");

insert into phone values("99032", 1);
insert into phone values("65222", 1);
insert into phone values("88050", 2);
insert into phone values("64321", 3);
insert into phone values("42513", 4);
insert into phone values("45873", 4);
insert into phone values("41578", 5);
insert into phone values("55412", 6);
insert into phone values("35832", 7);
insert into phone values("45832", 8);

insert into donor values(6, true, 300, 22.572612, 88.363911);
insert into donor values(8, true, 0, 22.572632, 88.363943);

insert into doctor values(1, 3);
insert into doctor values(7, 1);

insert into patient values(2, 3, 1);
insert into patient values(3, 1, 7);

insert into caretaker values(4, 2);
insert into caretaker values(5, 3);

insert into request values(2, 5);
insert into request values(3, 2);
/* end of bplus/data.sql */
