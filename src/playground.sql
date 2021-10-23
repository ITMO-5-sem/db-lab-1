-- SELECT * FROM signal INNER JOIN radar on signal.radar_serial_number = radar.serial_number;


-- select *
-- from
-- (
--     select signal.id, amplitude
--     from
--     (
--         select id, params_id
--         from signal
--         where
--         (
--             id in
--                 (
--                     select signal_id -- opened the astro body signals IDs
--                     from discovered_astro_bodies
--                     where astro_body_id =
--                     (
--                         select id -- the most heavy astro body ID
--                         from astro_body
--                         where mass =
--                         (
--                             select max( mass )
--                             from astro_body
--                         )
--                     )
--                 )
--         )
--     ) as signal
--     join signal_params
--     on signal.params_id = signal_params.id
-- ) as signal_id_amplitude
-- where amplitude =
-- (
--     select max(amplitude)
--     from signal_id_amplitude
-- ); -- IDK why this doesn't worK
--






select
       signal_and_params.id as signal_id,
       sent_time as signal_sent_time,
       sent_coord_x as signal_sent_coord_x,
       sent_coord_y as signal_sent_coord_x,
       intensity as params_intensity,
       frequency as params_frequency,
       amplitude as params_amplitude,
       serial_number as radar_serial_number,
       ship_name as radar_ship_name,
       period as radar_period,
       explore_start_date as radar_explore_start_date
from
(
    with signal_and_params as
    (
        select signal.id, sent_time, sent_coord_x, sent_coord_y, radar_id, intensity, frequency, amplitude
        from
        (
            select *  -- opened the astro body signals
            from signal
            where
            (
                id in
                    (
                        select signal_id -- opened the astro body signals IDs
                        from discovered_astro_bodies
                        where astro_body_id =
                        (
                            select id -- the most heavy astro body ID
                            from astro_body
                            where mass =
                            (
                                select max( mass )
                                from astro_body
                            )
                        )
                    )
            )
        ) as signal
        join signal_params
        on signal.params_id = signal_params.id
    )
    select * -- ID of a signal with MIN amplitude
    from signal_and_params
    where amplitude =
    (
      select min(amplitude)
      from signal_and_params
    )
) as signal_and_params
join
radar on signal_and_params.radar_id = radar.id;





