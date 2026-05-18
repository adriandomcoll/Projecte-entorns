CREATE DATABASE IF NOT EXISTS assettocorsa_db;
USE assettocorsa_db;

CREATE TABLE IF NOT EXISTS Laps (
    id INT AUTO_INCREMENT PRIMARY KEY,
    driver VARCHAR(100) NOT NULL,
    track VARCHAR(100) NOT NULL,
    lap_time TIME NOT NULL,
    date_recorded DATE NOT NULL,
    notes VARCHAR(255)
);

INSERT INTO Laps (driver, track, lap_time, date_recorded, notes)
VALUES
('Carlos', 'Monza', '00:01:32', '2026-05-18', 'Primera vuelta'),
('Ana', 'Spa', '00:02:05', '2026-05-17', 'Buenas condiciones');