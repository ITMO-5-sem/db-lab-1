insert into coordinates
values (default, null, 22); -- not null

insert into radar
values ('166234', 'Enterprise', '12', '20.09.1999'); -- date is before 2021

insert into radar
values ('166235', 'Pp', '12', '20.09.1999'); -- too short name

insert into radar
values ('166236', 'Enterprise', '-1', '20.09.1999'); -- negative period

insert into signal_params
values (default, -3, 62, 4); -- negative intensity