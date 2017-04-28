DROP TABLE if exists detections;
DROP TABLE if exists discoveries;
DROP TABLE if exists exoplanets;
DROP TABLE if exists astronomers;

CREATE TABLE astronomers (
id SERIAL4 PRIMARY KEY,
discoverer VARCHAR(255) not null,
observation_type VARCHAR(255)
);

CREATE TABLE exoplanets (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255) not null,
type VARCHAR(255),
habitable BOOLEAN,
mass FLOAT(1),
discovery DATE
);

CREATE TABLE discoveries (
id SERIAL4 PRIMARY KEY,
astronomer_id INT4 REFERENCES astronomers(id) ON DELETE CASCADE,
exoplanet_id INT4 REFERENCES exoplanets(id) ON DELETE CASCADE
);
