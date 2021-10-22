insert into radar
(
    serial_number, ship_name, period, explore_start_date
)
values
    (
        '166234', 'Enterprise', '12', '20.09.2021'
    ),
    (
        '177345', 'Galactic', '16', '21.09.2021'
    ),
    (
        '179071', 'Thanos', '4', '26.09.2021'
    );

insert into signal_params
(
    intensity, frequency, amplitude
)
values
    (
        16, 62, 4
    ),
    (
        22, 56, 2
    ),
    (
        23, 89, 34
    );


insert into composition
(
    name, description
)
values
    (
        'Lucid', 'Liquid substance'
    ),
    (
        'Solid', 'Solid substance'
    ),
    (
        'Gas', 'Gas substance'
    );


insert into signal
(
    sent_time, sent_coord_x, sent_coord_y, radar_id, params_id
)
values
    (
        '19.09.2021 16:26:14', 12312, 9087,
        (select id from radar where serial_number = 166234),
        1
    ),
    (
        '21.09.2021 14:29:19', 242345, 454351,
        (select id from radar where serial_number = 166234),
        3
    ),
    (
        '23.09.2021 20:00:11', 345345, 745,
        (select id from radar where serial_number = 177345),
        2
    );


insert into astro_body
(
    code_name, mass, coord_x, coord_y, composition_id
)
values
    (
        'Neptune', 1000, 234, 345,
        (select id from composition where composition.name = 'Solid')
    ),
    (
        'Saturn', 2387, 23435, 97753,
        (select id from composition where composition.name = 'Gas')
    ),
    (
        'Venus', 167, 5786, 3456,
        (select id from composition where composition.name = 'Lucid')
    );


insert into discovered_astro_bodies
(
    discovered_time, signal_id, astro_body_id
)
values
    (
        '20.09.2021 11:40:00', 1,
        (select id from astro_body where astro_body.code_name = 'Neptune')
    ),
    (
        '20.09.2021 15:22:08', 1,
        (select id from astro_body where astro_body.code_name = 'Saturn')
    ),
    (
        '21.09.2021 18:33:06', 2,
        (select id from astro_body where astro_body.code_name = 'Venus')
    ),
    (
        '22.09.2021 00:12:36', 2,
        (select id from astro_body where astro_body.code_name = 'Saturn')
    )
;


