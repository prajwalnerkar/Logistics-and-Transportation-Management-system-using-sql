CREATE DATABASE logistics_management;
USE logistics_management;
CREATE TABLE Vehicles(
vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
vehicle_number VARCHAR(20) NOT NULL,
vehicle_type VARCHAR(50),
capacity INT,
STATUS VARCHAR(20) DEFAULT 'Available'
);
 create table Drivers(
 driver_id int auto_increment primary key,
 name varchar(100) not null,
 license_number varchar(15),
 status varchar(20) default 'Available'
 );
 
 create table Shipments(
 shipment_id int auto_increment primary key,
 description text,
 origin varchar(100),
 destination varchar(100),
 shipment_date date,
 delivery_date date,
 status varchar(20) default 'Pending'
 );
 
 create table Routes(
 route_id int auto_increment primary key,
 route_name varchar(100) not null,
 stat_location varchar(100),
 distance_km int);
 
 CREATE TABLE Vehicle_Assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT,
    driver_id INT,
    shipment_id INT,
    route_id INT,
    assignment_date DATE,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
    FOREIGN KEY (shipment_id) REFERENCES Shipments(shipment_id),
    FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);

insert into Vehicles(vehicle_number, vehicle_type, capacity) values
('MH12AB1234', 'Truck', 10),
('MH14CD5678', 'Van', 5);


ALTER TABLE Drivers ADD phone_number VARCHAR(15);

INSERT INTO Drivers (name, license_number, phone_number) VALUES
('John Doe', 'DL12345XYZ', '9876543210'),
('Jane Smith', 'DL67890ABC', '9123456789');

ALTER TABLE Shipments ADD weight INT;

INSERT INTO Shipments (description, weight, origin, destination, shipment_date, delivery_date) VALUES
('Electronics', 1000, 'Mumbai', 'Pune', '2024-09-01', '2024-09-02'),
('Furniture', 2000, 'Delhi', 'Chandigarh', '2024-09-03', '2024-09-04');

ALTER TABLE Routes
ADD start_location VARCHAR(100),
ADD end_location VARCHAR(100);

INSERT INTO Routes (route_name, start_location, end_location, distance_km) VALUES
('Mumbai to Pune', 'Mumbai', 'Pune', 150),
('Delhi to Chandigarh', 'Delhi', 'Chandigarh', 250);

insert into Vehicle_Assignments(vehicle_id, driver_id,shipment_id,route_id,assignment_date) values
(1,1,1,1,'2024-09-01'),
(2,2,2,2, '2024-09-03');

SELECT 
    va.assignment_id, v.vehicle_number, d.name AS driver_name, 
    s.description AS shipment_description, r.route_name, va.assignment_date
FROM 
    Vehicle_Assignments va
JOIN 
    Vehicles v ON va.vehicle_id = v.vehicle_id
JOIN 
    Drivers d ON va.driver_id = d.driver_id
JOIN 
    Shipments s ON va.shipment_id = s.shipment_id
JOIN 
    Routes r ON va.route_id = r.route_id;
    
    select * from Shipments where status = 'Pending';

UPDATE Shipments SET status = 'In Transit' WHERE shipment_id = 1;

update Vehicles set status = 'In Use' where vehicle_id=1;