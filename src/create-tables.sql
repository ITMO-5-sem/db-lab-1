create table radar
(
    serial_number int primary key,
    ship_name varchar(16)
        constraint not_too_short_name check (length(ship_name) > 4),
    period integer
        constraint positive_period check (period > 0),
    explore_start_date date
        constraint valid_explore_start_date check (EXTRACT(YEAR FROM explore_start_date) >= 2021)
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
    intensity numeric not null
        constraint positive_intensity check (intensity > 0),
    frequency numeric not null
        constraint positive_frequency check (frequency > 0),
    amplitude numeric not null
        constraint positive_amplitude check (amplitude > 0)
);

create table composition
(
    id serial primary key,
    description text not null constraint not_empty_description check (length(description) > 3)
);

create table signal
(
    id serial primary key,
    sent_time timestamp not null,
    radar_serial_number int references radar (serial_number) not null ,
    sent_coords_id int references coordinates (id) not null,
    params_id int references signal_params (id) not null
);

create table astro_body
(
    code_name serial primary key,
    mass int constraint positive_mass check (mass > 0),
    coords_id int references coordinates (id) not null,
    composition_id int references composition (id) not null
);

create table discovered_astro_bodies
(
    id                   serial primary key,
    discovered_time      timestamp not null,
    signal_id            int references signal (id) not null,
    astro_body_code_name int references astro_body (code_name) not null
);
