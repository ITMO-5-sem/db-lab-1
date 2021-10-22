create table radar
(
    id                 serial primary key,
    serial_number      int not null unique
        check ( serial_number >= 100000 and serial_number <= 999999 ),

    ship_name          varchar(16)
        check (length( ship_name ) > 4),

    period             integer
        check (period > 0),

    explore_start_date date
        check (EXTRACT( YEAR FROM explore_start_date ) >= 2021)
);


create table signal_params
(
    id        serial primary key,
    intensity numeric not null
        check (intensity > 0),

    frequency numeric not null
        check (frequency > 0),

    amplitude numeric not null
        check (amplitude > 0)
);


create table composition
(
    id          serial primary key,
    name        varchar(16) not null unique
        check (length( name ) > 0),

    description text        not null
        check (length( description ) > 3)
);


create table signal
(
    id           serial primary key,
    sent_time    timestamp not null,
    sent_coord_x int       not null,
    sent_coord_y int       not null,
    radar_id     int       not null
        references radar
            on delete set null,

    params_id    int       not null
        references signal_params
            on delete restrict
);


create table astro_body
(
    id             serial primary key,
    code_name      varchar(32) not null unique,
    mass           int
        check (mass > 0),

    coord_x        int         not null,
    coord_y        int         not null,
    composition_id int         not null
        references composition
            on delete restrict
);


create table discovered_astro_bodies
(
    id              serial primary key,
    discovered_time timestamp not null,

    signal_id       int       not null
        references signal
            on delete restrict,

    astro_body_id   int       not null
        references astro_body
            on delete restrict
);

