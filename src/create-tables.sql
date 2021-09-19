create table radar
(
    serial_number int primary key,
    ship_name varchar(16),
    period integer,
    explore_start_date date
);

create table coordinates
(
    id serial primary key,
    x int not null,
    y int not null
);

create table signal_params
(
    id serial primary key,
    intensity numeric not null,
    frequency numeric not null,
    amplitude numeric not null
);

create table composition
(
    id serial primary key,
    description text not null
);

create table signal
(
    id serial primary key,
    sent_time timestamp not null,
    radar_serial_number int references radar (serial_number),
    sent_coords_id int references coordinates (id) not null,
    params_id int references signal_params (id) not null
);

create table astro_body
(
    code_name serial primary key,
    mass int,
    coords_id int references coordinates (id) not null,
    composition_id int references composition (id) not null
);

create table discovered_astro_bodies
(
    id                   serial primary key,
    discovered_time      timestamp not null,
    signal_id            int references signal (id),
    astro_body_code_name int references astro_body (code_name) not null
);
