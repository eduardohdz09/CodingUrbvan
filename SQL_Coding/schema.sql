--Create clients table

CREATE TABLE clients(
   client_id SERIAL PRIMARY KEY,
   created_at TIMESTAMPTZ,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   birthdate DATE,
   gender VARCHAR(6)
);

-- Export csv
COPY clients(client_id, created_at, first_name, last_name, birthdate, gender)
FROM 'client_table.csv'
DELIMITER ','
CSV HEADER;

-- Create divers table
CREATE TABLE drivers(
    driver_id SERIAL PRIMARY KEY,
    created_at TIMESTAMPTZ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthdate DATE,
    gender VARCHAR(6)
);

-- Import csv
COPY drivers(driver_id, created_at, first_name, last_name, birthdate, gender)
FROM 'driver_table.csv'
DELIMITER ','
CSV HEADER;

-- create trips table
CREATE TABLE trips(
    trip_id SERIAL PRIMARY KEY,
    driver_id INTEGER REFERENCES drivers(driver_id),
    on_sale_at TIMESTAMPTZ,
    departure_at TIMESTAMPTZ,
    arrival_at TIMESTAMPTZ,
    vehicle_capacity INTEGER,
    seat_price FLOAT,
    route_name TEXT,
    line_name TEXT,
    route_type TEXT
);

-- Import csv
COPY trips(trip_id, driver_id, on_sale_at, departure_at, arrival_at, vehicle_capacity, seat_price, route_name, line_name, route_type)
FROM 'trip_table.csv'
DELIMITER ','
CSV HEADER;

-- Create table reservations
CREATE TABLE reservations(
    reservation_id SERIAL PRIMARY KEY,
    trip_id INTEGER REFERENCES trips(trip_id),
    client_id INTEGER REFERENCES clients(client_id),
    created_at TIMESTAMPTZ,
    seats INTEGER,
    total_price INTEGER
);

-- Import csv
COPY reservations(reservation_id, trip_id, client_id, created_at, seats, total_price)
FROM 'reservation_table.csv'
DELIMITER ','
CSV HEADER;