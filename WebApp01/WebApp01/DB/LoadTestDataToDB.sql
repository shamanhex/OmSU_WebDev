INSERT INTO 
    monitoringdata (uid, varname, datetime, valuenum, valuetext)
VALUES
    (gen_random_uuid(), 'CPU', (DATE '2020-11-30' + TIME '00:00'), 10, NULL ),
    (gen_random_uuid(), 'CPU', (DATE '2020-11-30' + TIME '01:00'), 20, NULL ),
    (gen_random_uuid(), 'CPU', (DATE '2020-11-30' + TIME '02:00'), 30, NULL ),
    (gen_random_uuid(), 'CPU', (DATE '2020-11-30' + TIME '03:00'), 40, NULL ),
    (gen_random_uuid(), 'CPU', (DATE '2020-11-30' + TIME '04:00'), 12, NULL ),
    (gen_random_uuid(), 'CPU', (DATE '2020-11-30' + TIME '05:00'), 80, NULL ),
    (gen_random_uuid(), 'CPU', (DATE '2020-11-30' + TIME '06:00'), 60, NULL ),
    (gen_random_uuid(), 'CPU', (DATE '2020-11-30' + TIME '07:00'), 63, NULL ),
    (gen_random_uuid(), 'CPU', (DATE '2020-11-30' + TIME '08:00'), 62, NULL ),
    (gen_random_uuid(), 'CPU', (DATE '2020-11-30' + TIME '09:00'), 90, NULL ),
    (gen_random_uuid(), 'CPU', (DATE '2020-11-30' + TIME '10:00'), 95, NULL ),
    (gen_random_uuid(), 'CPU', (DATE '2020-11-30' + TIME '11:00'), 95, NULL ),
    (gen_random_uuid(), 'CPU', (DATE '2020-11-30' + TIME '12:00'), 75, NULL );
                
    