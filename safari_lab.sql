DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS enclosures;
DROP TABLE IF EXISTS staffs;

CREATE TABLE enclosures(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closedformaintenance BOOLEAN
);
CREATE TABLE animals(
    id SERIAL,
    name VARCHAR(255),
    age INT,
    type VARCHAR(255),
    enclosures_id INT REFERENCES enclosures(id)
);

CREATE TABLE staffs(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employeenumber INT
);
CREATE TABLE assignments(
    id SERIAL PRIMARY KEY,
    day VARCHAR(255),
    enclosures_id INT REFERENCES enclosures(id),
    employee_id INT REFERENCES staffs(id)
);

INSERT INTO enclosures(name, capacity, closedformaintenance) VALUES ('big cat field', 20, false);
INSERT INTO enclosures(name, capacity, closedformaintenance) VALUES ('small ant maze', 300, false);
INSERT INTO enclosures(name, capacity, closedformaintenance) VALUES ('wild west', 100, true);

INSERT INTO animals (name, age, type, enclosures_id) VALUES ('Tony', 23, 'Tiger', 1);
INSERT INTO animals (name, age, type, enclosures_id) VALUES ('Alex', 24, 'Ant', 2);
INSERT INTO animals (name, age, type, enclosures_id) VALUES ('Ralph', 23, 'Rhino', 3);




INSERT INTO staffs(name, employeenumber) VALUES ('Marvellous', 12345);
INSERT INTO staffs(name, employeenumber) VALUES ('Tommy', 67890);

INSERT INTO assignments(day, enclosures_id, employee_id) VALUES ('Wednesday', 1, 1);
INSERT INTO assignments(day, enclosures_id, employee_id) VALUES ('Thursday', 2, 2);
INSERT INTO assignments(day, enclosures_id, employee_id) VALUES ('Friday', 3, 1);


SELECT * FROM animals WHERE animals.enclosures_id = 1

SELECT s.name AS staff_name
FROM assignments a
JOIN staffs s ON a.employee_id = s.id
WHERE a.enclosures_id = (SELECT id FROM enclosures WHERE name = 'big cat field');