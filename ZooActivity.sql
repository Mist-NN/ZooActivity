DROP DATABASE IF EXISTS ZooActivity5;
CREATE DATABASE ZooActivity5;

USE ZooActivity5;

CREATE TABLE Animal(
	Species	VARCHAR(20) not null primary key,
    Number VARCHAR(20) not null,
	Location VARCHAR(20) not null,
	Diet VARCHAR(20) not null,
	Habitat	VARCHAR(20) not null
);
INSERT INTO Animal (Species, Number, Location, Diet, Habitat)
VALUES 
('Monkey', '8', 'Section A1', 'Omnivore', 'Forest'),
('Dolphin', '5','Section B2', 'Carnivore', 'Marine'),
('Elephant', '5','Section A2', 'Herbivore', 'Grassland'),
('Giraffe', '9', 'Section C1', 'Herbivore', 'Grassland'),
('Tiger', '8', 'Section B1', 'Carnivore', 'Forest'),
('Lion', '6', 'Section B4', 'Carnivore', 'Steppe'),
('Panda', '3', 'Section B3', 'Herbivore', 'Bamboo Forest'),
('Red Panda', '10', 'Section A4', 'Omnivore', 'Forest'),
('Gorilla', '8', 'Section C2', 'Omnivore', 'Rainforest'),
('Boa', '20', 'Section C3', 'Carnivore', 'Various Habitats');


CREATE TABLE Feeder (
    FeederID VARCHAR(10) PRIMARY KEY,
    FeederName VARCHAR(30) NOT NULL,
    Birthday DATETIME,
    Gender VARCHAR(2),
    Hiredate DATETIME,
    Address VARCHAR(200),
    Salary DECIMAL(10, 2),
    PhoneNumber VARCHAR(20),
    ResponsibleAnimal VARCHAR(20) not null,
    FOREIGN KEY (ResponsibleAnimal) REFERENCES Animal(Species)
);
INSERT INTO Feeder (FeederID, FeederName, Birthday, Gender, Hiredate, Address, Salary, PhoneNumber, ResponsibleAnimal)
VALUES 
('F0001', 'Bob Brown', '1985/03/18', 'M', '2019/07/15', '123 Oak Street', '1200', '+44-1234-567890', 'Dolphin'),
('F0002', 'Charlie Davis', '1992/01/24', 'M', '2020/01/12', '45 Greenfield Lane', '1100', '+44-2345-678901', 'Elephant'),
('F0003', 'Diana Green', '1988/06/10', 'F', '2021/03/06', '67 Pine Road', '1250', '+44-3456-789012', 'Giraffe'),
('F0004', 'Eve Heart', '1994/09/03', 'F', '2022/08/20', '89 Maple Drive', '1150', '+44-4567-890123', 'Tiger'),
('F0005', 'Frank Jackson', '1982/07/18', 'M', '2018/10/10', '10 Birch Avenue', '1120', '+44-5678-901234', 'Panda'),
('F0006', 'Grace King', '1990/02/15', 'F', '2020/03/25', '23 Walnut Street', '1200', '+44-6789-012345', 'Gorilla'),
('F0007', 'Henry Lee', '1986/04/22', 'M', '2019/05/30', '45 Cedar Lane', '1180', '+44-7890-123456', 'Boa'),
('F0008', 'Ivy Mason', '1993/11/08', 'F', '2021/04/10', '67 Willow Path', '1100', '+44-8901-234567', 'Lion'),
('F0009', 'Jack Newman', '1991/08/10', 'M', '2022/06/04', '90 Elm Court', '1220', '+44-9012-345678', 'Red Panda'),
('F0010', 'Kara Owen', '1989/03/20', 'F', '2021/07/18', '21 Ivy Walk', '1150', '+44-0123-456789', 'Dolphin'),
('F0011', 'Liam Page', '1995/05/02', 'M', '2020/09/05', '34 Oak Avenue', '1200', '+44-1234-567890', 'Elephant'),
('F0012', 'Mary Quinn', '1987/10/14', 'F', '2019/11/15', '56 Birch Road', '1100', '+44-2345-678901', 'Giraffe'),
('F0013', 'Nathan Riley', '1992/01/05', 'M', '2022/02/20', '87 Pine Lane', '1250', '+44-3456-789012', 'Tiger'),
('F0014', 'Olivia Smith', '1994/09/23', 'F', '2021/03/30', '10 Walnut Street', '1150', '+44-4567-890123', 'Panda'),
('F0015', 'Peter Taylor', '1983/06/12', 'M', '2018/08/15', '23 Maple Drive', '1200', '+44-5678-901234', 'Gorilla'),
('F0016', 'Rachel Wood', '1990/11/16', 'F', '2020/04/05', '67 Cedar Lane', '1180', '+44-6789-012345', 'Boa'),
('F0017', 'Scott Young', '1985/07/28', 'M', '2019/10/22', '90 Elm Court', '1120', '+44-7890-123456', 'Lion'),
('F0018', 'Tommy Zhang', '1993/02/10', 'M', '2021/12/01', '21 Ivy Walk', '1220', '+44-8901-234567', 'Monkey'),
('F0019', 'Ursula White', '1988/09/04', 'F', '2020/01/15', '34 Oak Avenue', '1150', '+44-9012-345678', 'Dolphin'),
('F0020', 'Vince King', '1990/05/18', 'M', '2019/06/25', '56 Birch Road', '1200', '+44-0123-456789', 'Red Panda'),
('F0021', 'Wendy Quinn', '1987/08/21', 'F', '2022/03/10', '87 Pine Lane', '1100', '+44-1234-567890', 'Giraffe'),
('F0022', 'Xavier Reed', '1991/01/27', 'M', '2021/09/05', '10 Walnut Street', '1250', '+44-2345-678901', 'Tiger'),
('F0023', 'Yvette Taylor', '1994/12/03', 'F', '2020/07/20', '23 Maple Drive', '1150', '+44-3456-789012', 'Panda'),
('F0024', 'Zoe Young', '1995/02/11', 'F', '2022/05/12', '67 Cedar Lane', '1200', '+44-4567-890123', 'Gorilla'),
('F0025', 'Amy Zhou', '1986/03/08', 'F', '2021/08/30', '90 Elm Court', '1180', '+44-5678-901234', 'Monkey');


create table AnimalDetails(
	AnimalID VARCHAR(20) not null primary key,
	AnimalName VARCHAR(20) not null,
	Gender	VARCHAR(1) not null,
	Birthday DATETIME,
    Age INT,
    Species VARCHAR(20) not null,
    FOREIGN KEY (Species) REFERENCES Animal(Species),
    FeederID VARCHAR(10) not null,
	FOREIGN KEY (FeederID) REFERENCES Feeder(FeederID)
);
INSERT INTO AnimalDetails (AnimalID, AnimalName, Gender, Birthday, Age, Species, FeederID)
VALUES
-- For Monkeys
('Mon001', 'Alan', 'M', '2018/05/20', 6, 'Monkey', 'F0018'),
('Mon002', 'Bella', 'F', '2019/06/15', 5, 'Monkey', 'F0018'),
('Mon003', 'Charlie', 'M', '2020/07/20', 4, 'Monkey', 'F0018'),
('Mon004', 'Daisy', 'F', '2021/08/25', 3, 'Monkey', 'F0018'),
('Mon005', 'Ethan', 'M', '2022/09/30', 2, 'Monkey', 'F0025'),
('Mon006', 'Fiona', 'F', '2023/10/05', 1, 'Monkey', 'F0025'),
('Mon007', 'George', 'M', '2023/11/10', 0, 'Monkey', 'F0025'),
('Mon008', 'Harriet', 'F', '2022/12/15', 2, 'Monkey', 'F0025'),

-- For Dolphins
('Dol001', 'Isabella', 'F', '2018/02/22', 6, 'Dolphin', 'F0001'),
('Dol002', 'James', 'M', '2019/03/18', 5, 'Dolphin', 'F0001'),
('Dol003', 'Katie', 'F', '2020/04/24', 4, 'Dolphin', 'F0010'),
('Dol004', 'Leo', 'M', '2021/05/30', 3, 'Dolphin', 'F0010'),
('Dol005', 'Mia', 'F', '2024/07/12', 1, 'Dolphin', 'F0019'),

-- For Elephants
('Ele001', 'Noah', 'M', '2018/06/08', 6, 'Elephant', 'F0002'),
('Ele002', 'Olivia', 'F', '2019/07/20', 5, 'Elephant', 'F0002'),
('Ele003', 'Peter', 'M', '2020/08/30', 4, 'Elephant', 'F0002'),
('Ele004', 'Quinn', 'F', '2021/10/01', 3, 'Elephant', 'F0011'),
('Ele005', 'Ryan', 'M', '2022/11/25', 2, 'Elephant', 'F0011'),

-- For Giraffes
('Gir001', 'Sophia', 'F', '2018/09/15', 6, 'Giraffe', 'F0003'),
('Gir002', 'Thomas', 'M', '2019/10/30', 5, 'Giraffe', 'F0003'),
('Gir003', 'Ursula', 'F', '2020/8/10', 4, 'Giraffe', 'F0003'),
('Gir004', 'Victor', 'M', '2022/01/25', 3, 'Giraffe', 'F0012'),
('Gir005', 'Wendy', 'F', '2023/03/18', 1, 'Giraffe', 'F0012'),
('Gir006', 'Xander', 'M', '2022/05/01', 2, 'Giraffe', 'F0012'),
('Gir007', 'Yara', 'F', '2021/06/24', 3, 'Giraffe', 'F0012'),
('Gir008', 'Zack', 'M', '2019/08/07', 5, 'Giraffe', 'F0021'),
('Gir009', 'Avery', 'M', '2021/10/03', 3, 'Giraffe', 'F0021'),

-- For Tigers
('Tig001', 'Bella', 'F', '2018/03/01', 6, 'Tiger', 'F0004'),
('Tig002', 'Casper', 'M', '2019/04/10', 5, 'Tiger', 'F0004'),
('Tig003', 'Diana', 'F', '2020/05/20', 4, 'Tiger', 'F0004'),
('Tig004', 'Ethan', 'M', '2021/06/30', 3, 'Tiger', 'F0004'),
('Tig005', 'Finn', 'M', '2022/08/15', 2, 'Tiger', 'F0013'),
('Tig006', 'Grace', 'F', '2023/10/05', 1, 'Tiger', 'F0013'),
('Tig007', 'Harry', 'M', '2021/12/10', 2, 'Tiger', 'F0013'),
('Tig008', 'Iris', 'F', '2020/02/25', 4, 'Tiger', 'F0013'),
('Tig009', 'Jack', 'M', '2019/03/10', 5, 'Tiger', 'F0022'),
('Tig010', 'Kiera', 'F', '2018/04/05', 6, 'Tiger', 'F0022'),

-- For Lions
('Lio001', 'Luna', 'F', '2018/01/15', 6, 'Lion', 'F0008'),
('Lio002', 'Milo', 'M', '2019/02/20', 5, 'Lion', 'F0008'),
('Lio003', 'Nora', 'F', '2020/03/25', 4, 'Lion', 'F0008'),
('Lio004', 'Oliver', 'M', '2021/04/30', 3, 'Lion', 'F0017'),
('Lio005', 'Piper', 'F', '2023/06/05', 1, 'Lion', 'F0017'),
('Lio006', 'Quinn', 'M', '2023/08/10', 1, 'Lion', 'F0017'),
('Lio007', 'Mocmoc', 'F', '2022/06/05', 4, 'Lion', 'F0017'),
('Lio008', 'Leo', 'M', '2021/08/10', 3, 'Lion', 'F0017'),


-- For Pandas
('Pan001', 'Ruby', 'F', '2018/01/20', 6, 'Panda', 'F0005'),
('Pan002', 'Sam', 'M', '2019/03/05', 5, 'Panda', 'F0014'),
('Pan003', 'Tara', 'F', '2020/05/01', 4, 'Panda', 'F0023'),

-- For Red Pandas
('Red001', 'Ulysses', 'M', '2017/07/15', 7, 'Red Panda', 'F0009'),
('Red002', 'Venus', 'F', '2018/08/20', 6, 'Red Panda', 'F0009'),
('Red003', 'Willow', 'F', '2019/09/25', 5, 'Red Panda', 'F0009'),
('Red004', 'Xander', 'M', '2020/10/10', 4, 'Red Panda', 'F0009'),
('Red005','Yara', 'F', '2021/11/15', 3, 'Red Panda', 'F0009'),
('Red006', 'Zane', 'M', '2022/12/20', 2, 'Red Panda', 'F0020'),
('Red007', 'Aria', 'F', '2023/01/20', 1, 'Red Panda', 'F0020'),
('Red008', 'Bryce', 'M', '2021/03/01', 3, 'Red Panda', 'F0020'),
('Red009', 'Cora', 'F', '2016/04/10', 8, 'Red Panda', 'F0020'),
('Red010', 'Dante', 'M', '2018/05/01', 6, 'Red Panda', 'F0020'),

-- For Gorillas
('Gor001', 'Eve', 'F', '2018/06/20', 6, 'Gorilla', 'F0006'),
('Gor002', 'Finn', 'M', '2019/07/25', 5, 'Gorilla', 'F0006'),
('Gor003', 'Gwen', 'F', '2020/08/30', 4, 'Gorilla', 'F0006'),
('Gor004', 'Hugo', 'M', '2021/10/05', 3, 'Gorilla', 'F0015'),
('Gor005', 'Ivy', 'F', '2022/11/10', 2, 'Gorilla', 'F0015'),
('Gor006', 'Jasper', 'M', '2023/11/15', 1, 'Gorilla', 'F0015'),
('Gor007', 'Katie', 'F', '2021/01/20', 3, 'Gorilla', 'F0024'),
('Gor008', 'Leo', 'M', '2020/02/25', 4, 'Gorilla', 'F0024'),

-- For Boas
('Boa001', 'Milo', 'M', '2017/04/01', 7, 'Boa', 'F0007'),
('Boa002', 'Nora', 'F', '2017/05/10', 7, 'Boa', 'F0007'),
('Boa003', 'Oliver', 'M', '2017/06/15', 7, 'Boa', 'F0007'),
('Boa004', 'Piper', 'F', '2017/07/20', 7, 'Boa', 'F0007'),
('Boa005', 'Quinn', 'M', '2017/08/25', 7, 'Boa', 'F0007'),
('Boa006', 'Ruby', 'F', '2017/09/30', 7, 'Boa', 'F0007'),
('Boa007', 'Sam', 'M', '2017/11/05', 7, 'Boa', 'F0007'),
('Boa008', 'Tara', 'F', '2018/01/10', 6, 'Boa', 'F0007'),
('Boa009', 'Ulysses', 'M', '2018/02/15', 6, 'Boa', 'F0007'),
('Boa010', 'Venus', 'F', '2018/03/20', 6, 'Boa', 'F0007'),
('Boa011', 'Willow', 'M', '2018/04/25', 6, 'Boa', 'F0016'),
('Boa012', 'Xander', 'F', '2018/06/01', 6, 'Boa', 'F0016'),
('Boa013', 'Yara', 'M', '2018/07/10', 6, 'Boa', 'F0016'),
('Boa014', 'Zane', 'M', '2018/08/15', 6, 'Boa', 'F0016'),
('Boa015', 'Aria', 'F', '2018/09/20', 6, 'Boa', 'F0016'),
('Boa016', 'Bryce', 'M', '2018/10/25', 6, 'Boa', 'F0016'),
('Boa017', 'Cora', 'F', '2018/11/30', 6, 'Boa', 'F0016'),
('Boa018', 'Dante', 'M', '2018/11/15', 6, 'Boa', 'F0016'),
('Boa019', 'Eve', 'F', '2019/01/20', 5, 'Boa', 'F0016'),
('Boa020', 'Finn', 'M', '2019/02/25', 5, 'Boa', 'F0016');



CREATE TABLE Veterinarian (
    VeterinarianID CHAR(10) PRIMARY KEY,
    VeterinarianName VARCHAR(30),
    Gender CHAR(1),
    Salary INT,
    Birthday DATE,
    PhoneNumber VARCHAR(20),
    Specialty VARCHAR(30),  
    Hiredate DATE,
    Address VARCHAR(200)
);
INSERT INTO Veterinarian (VeterinarianID, VeterinarianName, Gender, Salary, Birthday, PhoneNumber, Specialty, Hiredate, Address)
VALUES
('Vet001', 'John Smith', 'M', 2000, '1980-05-15', '+44-5689-455868', 'Mammal', '2019-01-01', '123 Main St'),
('Vet002', 'Emily Johnson', 'F', 75000, '1985-09-20', '+44-7624-682462', 'Marine-Animal', '2020-03-15', '456 Elm St'),
('Vet003', 'Michael Brown', 'M', 82000, '1978-11-30', '+44-5745-461827', 'Mammal', '2020-06-01', '789 Oak St'),
('Vet004', 'Sophia Lee', 'F', 78000, '1990-03-05', '+44-5467-491573', 'Mammal', '2019-09-01', '321 Pine St'),
('Vet005', 'David Williams', 'M', 85000, '1982-07-10', '+44-6724-619758', 'Marine-Animal', '2021-12-01', '555 Cedar St'),
('Vet006', 'Olivia Jones', 'F', 72000, '1992-12-25', '+44-5675-685722', 'Non-Mammal', '2020-04-01', '999 Birch St'),
('Vet007', 'James Miller', 'M', 83000, '1975-04-25', '+44-6782-468519', 'Mammal', '2019-08-15', '234 Maple St'),
('Vet008', 'Ava Garcia', 'F', 76000, '1988-06-18', '+44-6798-798654', 'Mammal', '2019-02-10', '678 Spruce St'),
('Vet009', 'William Davis', 'M', 81000, '1983-02-03', '+44-4672-764380', 'Non-Mammal', '2020-07-01', '101 Walnut St'),
('Vet010', 'Isabella Martinez', 'F', 79000, '1991-10-12', '+44-0346-167526', 'Marine-Animal', '2019-11-01', '404 Cherry St');


CREATE TABLE Activity (
	ActivityID VARCHAR(10) PRIMARY KEY NOT NULL,
    ActivityName VARCHAR(100) NOT NULL,
    ActivityDescription TEXT,
	ActivityType VARCHAR(50) NOT NULL,
    AgeGroup VARCHAR(50) NOT NULL,
    Species VARCHAR(20),
    MaxParticipants INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StartTime DATETIME NOT NULL,
    EndTime DATETIME NOT NULL,
    Location VARCHAR(20) NOT NULL,
    FeederID varchar(20),
    ActivityStatus VARCHAR(20) NOT NULL,
    FOREIGN KEY (FeederID) REFERENCES Feeder(FeederID),
    FOREIGN KEY (Species) REFERENCES Animal(Species)
);
INSERT INTO Activity (ActivityID, ActivityName, ActivityDescription, ActivityType, AgeGroup, Species, MaxParticipants, Price, StartTime, EndTime, Location, FeederID, ActivityStatus)
VALUES 
('A001', 'Monkey Feeding Experience', 'Interact and feed the monkeys under supervision.', 'Feeding', 'All Ages', 'Monkey', 10, 15.00, '2024-07-15 14:00:00', '2024-7-15 15:00:00', 'Section A1', 'F0018', 'Finished'),
('A002', 'Dolphin Show', 'Watch a spectacular dolphin show and learn about marine life.', 'Performance', 'All Ages', 'Dolphin', 100, 0.00, '2024-08-22 16:00:00', '2024-08-22 17:00:00', 'Section B2', 'F0001', 'Finished'),
('A003', 'Elephant Care Workshop', 'Learn about elephant care and conservation.', 'Workshop', 'Only Adults', 'Elephant', 5, 50.00, '2024-10-23 10:00:00', '2024-10-23 12:00:00', 'Section A2', 'F0002', 'Finished'),
('A004', 'Giraffe Encounter', 'Get up close with a giraffe and learn about their diet.', 'Encounter', 'All Ages', 'Giraffe', 15, 20.00, '2024-10-24 11:00:00', '2024-10-24 12:00:00', 'Section C1', 'F0003', 'Finished'),
('A005', 'Tiger Training Demo', 'Watch a demonstration of tiger training techniques.', 'Demonstration', 'Only Adults', 'Tiger', 20, 25.00, '2024-10-25 15:00:00', '2024-10-25 16:00:00', 'Section B1', 'F0004', 'Open'),
('A006', 'Lion Feeding Observation', 'Observe lions being fed and learn about carnivore diets.', 'Observation', 'Only Adults', 'Lion', 12, 30.00, '2024-10-26 16:30:00', '2024-10-26 17:30:00', 'Section B4', 'F0008', 'Open'),
('A007', 'Panda Conservation Talk', 'Learn about panda conservation efforts.', 'Talk', 'All Ages', 'Panda', 30, 10.00, '2024-10-27 11:00:00', '2024-10-27 12:00:00', 'Section B3', 'F0005', 'Open'),
('A008', 'Red Panda Feeding', 'Help feed the red pandas and learn about their habitat.', 'Feeding', 'All Ages', 'Red Panda', 10, 15.00, '2024-11-03 14:00:00', '2024-11-03 15:00:00', 'Section A4', 'F0009', 'Open'),
('A009', 'Gorilla Habitat Walk', 'Walk through the gorilla habitat and learn about their lifestyle.', 'Walk', 'All Ages', 'Gorilla', 20, 15.00, '2024-11-21 10:00:00', '2024-11-21 11:00:00', 'Section C2', 'F0006', 'Open'),
('A010', 'Boa Feeding Experience', 'Learn the basics of Boa feeding from an expert.', 'Lesson', 'Only Adults', 'Boa', 10, 40.00, '2024-11-30 13:00:00', '2024-11-30 14:00:00', 'Section C3', 'F0007', 'Open'),
('A011', 'Gorilla Outreach Program', 'Engage with gorillas and learn about their habitat and conservation.', 'Outreach', 'All Ages', 'Gorilla', 15, 20.00, '2024-12-05 10:00:00', '2024-12-05 11:30:00', 'Section C2', 'F0006', 'Unopen'),
('A012', 'Boa Handling Workshop', 'Get hands-on experience with boas and learn about their care.', 'Workshop', 'Only Adults', 'Boa', 8, 35.00, '2024-12-10 14:00:00', '2024-12-10 15:30:00', 'Section C3', 'F0007', 'Unopen'),
('A013', 'Panda Interactive Session', 'Interact with pandas while learning about their natural environment.', 'Interactive', 'All Ages', 'Panda', 12, 25.00, '2024-12-15 13:00:00', '2024-12-15 14:30:00', 'Section B3', 'F0005', 'Unopen'),
('A014', 'Tiger Night Safari', 'Experience a thrilling night adventure observing tigers.', 'Night Safari', 'Only Adults', 'Tiger', 10, 45.00, '2024-12-20 18:00:00', '2024-12-20 20:00:00', 'Section B1', 'F0004', 'Unopen'),
('A015', 'Dolphin Underwater Diving', 'Join us for an underwater experience with dolphins.', 'Diving', 'Only Adults', 'Dolphin', 5, 100.00, '2024-12-25 09:00:00', '2024-12-25 11:00:00', 'Section B2', 'F0001', 'Unopen');

CREATE TABLE Customer(
	CustomerID VARCHAR(20) not null primary key,
	CustomerName VARCHAR(40) not null,
	CustomerAge	VARCHAR(5) not null,
	TicketType	VARCHAR(20) not null,
    ActivityID VARCHAR(10),
	FOREIGN KEY (ActivityID) REFERENCES Activity(ActivityID),
    Score DECIMAL(4,1),
	Comments TEXT 
);
INSERT INTO Customer (CustomerID, CustomerName, CustomerAge, TicketType, ActivityID, Score, Comments)
VALUES 
('Cust001', 'Alice Johnson', '32', 'Adult', 'A005', NULL, NULL),
('Cust002', 'Bob Smith', '45', 'Adult', 'A007', NULL, NULL),
('Cust003', 'Charlotte Brown', '7', 'Student', 'A004', 5, 'Had so much fun feeding the giraffes!'),
('Cust004', 'David Lee', '30', 'Adult', 'A006', NULL, NULL),
('Cust005', 'Eve Davis', '12', 'Student', 'A001', 4, 'I want to feed the monkeys again!'),
('Cust006', 'Franklin Green', '50', 'Adult', 'A003', 5, 'The elephant workshop was very informative.'),
('Cust007', 'Grace King', '8', 'Student', 'A001', 4.5, 'Can not wait for the next animal show!'),
('Cust008', 'Henry White', '40', 'Adult', 'A008', 4.5, 'The red panda feeding was delightful.'),
('Cust009', 'Ivy Taylor', '22', 'Student', 'A009', NULL, NULL),
('Cust010', 'Jack Wilson', '10', 'Student', 'A010', NULL, NULL),
('Cust011', 'Katie Brown', '35', 'Adult', 'A002', 5, 'The dolphin show was a family favorite.'),
('Cust012', 'Liam Smith', '42', 'Adult', 'A005', NULL, NULL),
('Cust013', 'Mia Johnson', '6', 'Child', 'A004', 4.5, 'I want to see the giraffes again.'),
('Cust014', 'Noah Davis', '38', 'Adult', 'A003', 5, 'Elephant care workshop was eye-opening.'),
('Cust015', 'Olivia Green', '15', 'Student', 'A006', NULL, NULL),
('Cust016', 'Peter King', '28', 'Adult', 'A007', NULL, NULL),
('Cust017', 'Quinn White', '4', 'Child', 'A001', 5, 'Monkeys were my favorite!'),
('Cust018', 'Ruby Taylor', '31', 'Adult', 'A008', NULL, NULL),
('Cust019', 'Sam Wilson', '18', 'Student', 'A009', NULL, NULL),
('Cust020', 'Tommy Brown', '12', 'Student', 'A010', NULL, NULL),
('Cust021', 'Ursula Lee', '29', 'Adult', 'A002', 4.5, 'Dolphins are so intelligent!'),
('Cust022', 'Vince King', '40', 'Adult', 'A003', 4, 'Learnt a lot about elephants.'),
('Cust023', 'Wendy Taylor', '8', 'Student', 'A004', 5, 'I loved feeding the giraffe!'),
('Cust024', 'Xander Brown', '33', 'Adult', 'A005', NULL, NULL),
('Cust025', 'Yara Smith', '66', 'Elder', 'A006', NULL, NULL),
('Cust026', 'Zoe Davis', '45', 'Adult', 'A007', NULL, NULL),
('Cust027', 'Amy Green', '55', 'Elder', 'A008', NULL, NULL),
('Cust028', 'Ben King', '19', 'Student', 'A009', NULL, NULL),
('Cust029', 'Cora White', '25', 'Adult', 'A010', NULL, NULL),
('Cust030', 'Dante Taylor', '6', 'Child', 'A001', 5, 'Monkeys were so playful!'),
('Cust031', 'Eve Johnson', '37', 'Adult', 'A002', 4.5, 'Dolphin show was a highlight!'),
('Cust032', 'Finn Lee', '43', 'Adult', 'A003', 4.5, 'Elephant workshop was very educational.'),
('Cust033', 'Gwen Davis', '5', 'Child', 'A004', 5, 'Giraffe encounter was amazing!'),
('Cust034', 'Hugo Green', '30', 'Adult', 'A005', NULL, NULL),
('Cust035', 'Ivy King', '16', 'Student', 'A006', NULL, NULL),
('Cust036', 'Jackie Taylor', '27', 'Adult', 'A007', NULL, NULL),
('Cust037', 'Katie Brown', '6', 'Child', 'A008', NULL, NULL),
('Cust038', 'Leo Smith', '42', 'Adult', 'A009', NULL, NULL),
('Cust039', 'Milo Davis', '19', 'Adult', 'A010', NULL, NULL),
('Cust040', 'Nora Lee', '65', 'Elder', 'A001', 5, 'Monkey feeding was so much fun!'),
('Cust041', 'Finn Davis', '19', 'Adult', 'A012', NULL, NULL),
('Cust042', 'Katie Johnson', '25', 'Adult', 'A011', NULL, NULL),
('Cust043', 'Milo Lee', '32', 'Adult', 'A011', NULL, NULL),
('Cust044', 'Zoe Brown', '15', 'Student', 'A011', NULL, NULL),
('Cust045', 'Yara Brown', '35', 'Adult', 'A010', NULL, NULL),
('Cust046', 'Eve Brown', '27', 'Adult', 'A010', NULL, NULL),
('Cust047', 'Oliver Davis', '23', 'Adult', 'A005', 4, 'Great experience with the tigers!'),
('Cust048', 'Sophie Green', '14', 'Student', 'A002', NULL, NULL),
('Cust049', 'Lucas Johnson', '46', 'Adult', 'A006', 5, 'The lion feeding was fantastic!'),
('Cust050', 'Ella Smith', '7', 'Child', 'A001', 4.5, 'Loved feeding the monkeys!'),
('Cust051', 'James Taylor', '52', 'Adult', 'A007', 5, 'Informative and fun dolphin show!'),
('Cust052', 'Chloe Brown', '17', 'Student', 'A003', 4, 'Learned a lot at the elephant workshop.'),
('Cust053', 'Ethan King', '30', 'Adult', 'A008', NULL, NULL),
('Cust054', 'Liam White', '5', 'Child', 'A004', 5, 'The giraffes are so tall!'),
('Cust055', 'Emma Wilson', '62', 'Elder', 'A005', NULL, NULL),
('Cust056', 'Benjamin Davis', '18', 'Student', 'A009', 4.5, 'The gorilla encounter was amazing!'),
('Cust057', 'Mia Taylor', '34', 'Adult', 'A010', 5, 'Boa feeding was a thrilling experience!'),
('Cust058', 'Ava Green', '8', 'Student', 'A011', 5, 'Really enjoyed the gorilla outreach!'),
('Cust059', 'Henry Brown', '39', 'Adult', 'A012', NULL, NULL),
('Cust060', 'Isabella Johnson', '66', 'Elder', 'A007', 4, 'Enjoyed the panda talk very much!'),
('Cust061', 'Alexander Lee', '15', 'Student', 'A008', 4.5, 'Feeding the red pandas was delightful!'),
('Cust062', 'Sophia White', '27', 'Adult', 'A003', NULL, NULL),
('Cust063', 'Lucas Martin', '21', 'Adult', 'A001', 5, 'The monkey feeding was awesome!'),
('Cust064', 'Abigail Davis', '12', 'Student', 'A010', 4, 'Fun experience with the boa!'),
('Cust065', 'Matthew Smith', '58', 'Elder', 'A006', NULL, NULL),
('Cust066', 'Aiden Clark', '22', 'Adult', 'A005', 4.5, 'Tiger training was fascinating!'),
('Cust067', 'Ella King', '29', 'Adult', 'A002', NULL, NULL),
('Cust068', 'Zoe Wilson', '9', 'Child', 'A004', 5, 'Loved the giraffes!'),
('Cust069', 'Oliver Taylor', '40', 'Adult', 'A003', 4.5, 'Very informative session on elephants!'),
('Cust070', 'Chloe Harris', '35', 'Adult', 'A007', 5, 'The dolphin show was spectacular!'),
('Cust071', 'Mia Thompson', '26', 'Adult', 'A015', 4, 'The underwater diving with dolphins was unforgettable!'),
('Cust072', 'Ethan Roberts', '33', 'Adult', 'A012', 5, 'I loved handling the boas! Very educational.'),
('Cust073', 'Lily Johnson', '11', 'Student', 'A005', 4.5, 'Tigers are my favorite! The demo was thrilling.'),
('Cust074', 'Noah Lee', '50', 'Adult', 'A006', 3.5, 'The lion feeding was interesting, but could be improved.'),
('Cust075', 'Olivia Walker', '7', 'Child', 'A009', 5, 'The gorillas were amazing! I want to go again!'),
('Cust076', 'Jacob Davis', '45', 'Adult', 'A008', 4.5, 'Feeding the red pandas was a delight!'),
('Cust077', 'Sofia Martinez', '19', 'Student', 'A010', 4, 'The boa feeding experience was thrilling!'),
('Cust078', 'James Brown', '38', 'Adult', 'A003', 5, 'The elephant workshop was enlightening!'),
('Cust079', 'Isabella Clark', '14', 'Student', 'A011', 4, 'Loved the gorilla outreach program!'),
('Cust080', 'Ava Turner', '68', 'Elder', 'A015', 5, 'The dolphin diving experience was magical!'),
('Cust081', 'Liam Hernandez', '22', 'Adult', 'A002', 4.5, 'The dolphin show was fantastic!'),
('Cust082', 'Sophia Walker', '30', 'Adult', 'A007', 4, 'Enjoyed the panda conservation talk, very informative.'),
('Cust083', 'Alexander Young', '28', 'Adult', 'A014', 5, 'The night safari with tigers was thrilling!'),
('Cust084', 'Chloe King', '10', 'Child', 'A001', 5, 'Feeding the monkeys was so much fun!'),
('Cust085', 'Benjamin Lee', '37', 'Adult', 'A012', NULL, NULL),
('Cust086', 'Emma Hall', '18', 'Student', 'A009', 3, 'The gorilla habitat walk was okay, not what I expected.'),
('Cust087', 'Henry Adams', '29', 'Adult', 'A015', 4.5, 'Diving with dolphins was a unique experience!'),
('Cust088', 'Aiden Smith', '16', 'Student', 'A005', NULL, NULL),
('Cust089', 'Zoe Evans', '5', 'Child', 'A004', 5, 'The giraffes were super tall and fun!'),
('Cust090', 'Mason Robinson', '44', 'Adult', 'A013', 4, 'The panda interactive session was delightful!'),
('Cust091', 'Ella Carter', '62', 'Elder', 'A007', 5, 'Fantastic dolphin show, very engaging!'),
('Cust092', 'Scarlett Lewis', '15', 'Student', 'A003', 4.5, 'The elephant workshop was fun and educational!'),
('Cust093', 'Liam Walker', '41', 'Adult', 'A011', NULL, NULL);




CREATE TABLE AnimalAssessments (
    AssessmentID CHAR(10) PRIMARY KEY,
    AnimalID VARCHAR(20),
    Species VARCHAR(20),
    VeterinarianID CHAR(10),
    AssessmentDate DATETIME,
    Weight VARCHAR(15),
    BodyTemperature DECIMAL(4,1),
    HeartRate INT,
    RespiratoryRate INT,
    Appetite VARCHAR(50),
    BehavioralObservations TEXT,
    HealthStatus VARCHAR(50),
    Diagnosis TEXT,
    Recommendations TEXT,
    FOREIGN KEY (Species) REFERENCES Animal(Species),
    FOREIGN KEY (AnimalID) REFERENCES AnimalDetails(AnimalID),
    FOREIGN KEY (VeterinarianID) REFERENCES Veterinarian(VeterinarianID)
);

INSERT INTO AnimalAssessments (AssessmentID, AnimalID, Species, VeterinarianID, AssessmentDate, Weight, BodyTemperature, HeartRate, RespiratoryRate, Appetite, BehavioralObservations, HealthStatus, Diagnosis, Recommendations)
VALUES 

-- Monkey
('Ass001', 'Mon001', 'Monkey', 'Vet001', '2024-07-12 10:00:00', '13.2kg', 36.8, 120, 30, 'Good', 'Active and playful', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass002', 'Mon002', 'Monkey', 'Vet003', '2024-07-12 10:30:00', '12.5kg', 36.9, 125, 32, 'Good', 'Active and playful', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass003', 'Mon003', 'Monkey','Vet004', '2024-07-12 11:00:00', '11.8kg', 36.7, 115, 30, 'Good', 'Active and playful', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass004', 'Mon003', 'Monkey','Vet004', '2024-08-22 12:00:00', '12.8kg', 36.7, 115, 30, 'Good', 'Active and playful', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass005', 'Mon003', 'Monkey','Vet004', '2024-09-22 12:00:00', '12.8kg', 36.7, 115, 30, 'Good', 'Active and playful', 'Healthy', 'Normal', 'Can participate in activities'),
-- Dolphin
('Ass006', 'Dol001', 'Dolphin', 'Vet002', '2024-08-19 11:00:00', '178.0kg', 36.5, 50, 12, 'Normal', 'Swimming patterns normal', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass007', 'Dol002', 'Dolphin', 'Vet010', '2024-08-19 11:10:00', '182.0kg', 36.5, 50, 12, 'Normal', 'Swimming patterns normal', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass008', 'Dol003', 'Dolphin', 'Vet003', '2024-08-19 11:20:00', '180.0kg', 37.0, 50, 12, 'Normal', 'Swimming patterns normal', 'Healthy', 'Normal', 'Can participate in activities'),
-- Elephant
('Ass009', 'Ele001', 'Elephant', 'Vet007', '2024-08-20 10:00:00', '2990.0kg', 35.6, 30, 10, 'Good', 'Normal social behavior', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass010', 'Ele002', 'Elephant', 'Vet004', '2024-08-20 10:30:00', '2975.0kg', 35.6, 30, 10, 'Good', 'Normal social behavior', 'Sub-Healthy', 'Having a cold', 'Activities are not recommended'),
('Ass011', 'Ele003', 'Elephant', 'Vet008', '2024-08-20 11:00:00', '2960.0kg', 35.6, 30, 10, 'Good', 'Normal social behavior', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass012', 'Ele004', 'Elephant', 'Vet004', '2024-08-20 11:30:00', '2945.0kg', 35.6, 30, 10, 'Good', 'Normal social behavior', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass013', 'Ele005', 'Elephant', 'Vet007', '2024-08-20 11:30:00', '2945.0kg', 35.7, 30, 10, 'Good', 'Normal social behavior', 'Healthy', 'Normal', 'Can participate in activities'),
-- Giraffe
('Ass014', 'Gir001', 'Giraffe', 'Vet001', '2024-09-21 09:00:00', '795.0kg', 36.7, 45, 15, 'Good', 'Eating normally', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass015', 'Gir002', 'Giraffe', 'Vet007', '2024-09-21 09:30:00', '780.0kg', 36.7, 45, 15, 'Good', 'Eating normally', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass016', 'Gir003', 'Giraffe', 'Vet004', '2024-09-21 10:00:00', '770.0kg', 36.7, 45, 15, 'Good', 'Eating normally', 'Healthy', 'Pregnant, about to give birth', 'Activities are not recommended'),
('Ass017', 'Gir004', 'Giraffe', 'Vet007', '2024-09-21 10:30:00', '760.0kg', 36.7, 45, 15, 'Good', 'Eating normally', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass018', 'Gir005', 'Giraffe', 'Vet008', '2024-09-21 11:00:00', '750.0kg', 36.7, 45, 15, 'Good', 'Eating normally', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass019', 'Gir006', 'Giraffe', 'Vet007', '2024-09-21 11:30:00', '740.0kg', 36.7, 45, 15, 'Good', 'Eating normally', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass020', 'Gir007', 'Giraffe', 'Vet008', '2024-09-21 12:00:00','730.0kg', 36.7, 45, 15, 'Good', 'Eating normally', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass021', 'Gir008', 'Giraffe', 'Vet007', '2024-09-21 12:30:00', '720.0kg', 36.7, 45, 15, 'Good', 'Eating normally', 'Sub-Healthy', 'Having a cold', 'Activities are not recommended'),
('Ass022', 'Gir009', 'Giraffe', 'Vet001', '2024-09-21 13:00:00', '710.0kg', 36.7, 45, 15, 'Good', 'Eating normally', 'Healthy', 'Normal', 'Can participate in activities'),
-- Tiger
('Ass023', 'Tig001', 'Tiger', 'Vet001', '2024-10-16 10:00:00', '145.0kg', 37.2, 55, 18, 'Good', 'Active hunting behavior', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass024', 'Tig002', 'Tiger', 'Vet008', '2024-10-16 10:30:00', '140.0kg', 37.2, 55, 18, 'Good', 'Active hunting behavior', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass025', 'Tig003', 'Tiger', 'Vet001', '2024-10-16 11:00:00', '135.0kg', 37.2, 55, 18, 'Good', 'Active hunting behavior', 'Healthy', 'Normal', 'Can participate in activities'),
-- Lion
('Ass026', 'Lio001', 'Lion', 'Vet001', '2024-10-18 10:00:00', '150.0kg', 37.5, 40, 16, 'Good', 'Resting normally', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass027', 'Lio002', 'Lion', 'Vet008', '2024-10-18 10:30:00', '180.0kg', 37.5, 40, 16, 'Normal', 'Resting normally', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass028', 'Lio003', 'Lion', 'Vet004', '2024-10-18 11:00:00', '120.0kg', 37.5, 40, 16, 'Good', 'Resting normally', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass029', 'Lio004', 'Lion', 'Vet008', '2024-10-18 11:30:00', '190.0kg', 37.5, 40, 16, 'Good', 'Resting normally', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass030', 'Lio005', 'Lion', 'Vet004', '2024-10-18 10:00:00', '130.0kg', 37.5, 40, 16, 'Good', 'Resting normally', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass031', 'Lio006', 'Lion', 'Vet008', '2024-10-18 10:30:00', '125.0kg', 37.5, 40, 16, 'Normal', 'Resting normally', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass032', 'Lio007', 'Lion', 'Vet001', '2024-10-18 11:00:00', '160.0kg', 37.5, 40, 16, 'Good', 'Resting normally', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass033', 'Lio008', 'Lion', 'Vet008', '2024-10-18 11:30:00', '205.0kg', 37.5, 40, 16, 'Good', 'Resting normally', 'Healthy', 'Normal', 'Can participate in activities'),
-- Panda
('Ass034', 'Pan001', 'Panda', 'Vet001', '2024-08-10 11:00:00', '100.0kg', 35.9, 35, 12, 'Normal', 'Quiet and active', 'Healthy', 'Normal', 'Can participate in activities'),
-- Red Panda
('Ass035', 'Red001', 'Red Panda', 'Vet001', '2024-10-30 10:00:00', '5.5kg', 37.0, 100, 25, 'Good', 'Active and curious', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass036', 'Red002', 'Red Panda', 'Vet008', '2024-10-30 10:30:00', '5.4kg', 37.0, 100, 25, 'Good', 'Active and curious', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass037', 'Red003', 'Red Panda', 'Vet001', '2024-10-30 11:00:00', '5.3kg', 37.0, 100, 25, 'Good', 'Active and curious', 'Disease', 'Fracture of left leg', 'Activities are not recommended'),
('Ass038', 'Red004', 'Red Panda', 'Vet004', '2024-10-30 11:30:00', '5.2kg', 37.0, 100, 25, 'Good', 'Active and curious', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass039', 'Red005', 'Red Panda', 'Vet008', '2024-10-30 12:00:00', '5.1kg', 37.0, 100, 25, 'Good', 'Active and curious', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass040', 'Red006', 'Red Panda', 'Vet008', '2024-10-30 12:30:00', '5.1kg', 37.5, 100, 25, 'Good', 'Active and curious', 'Healthy', 'Normal', 'Can participate in activities'),
-- Gorilla
('Ass041', 'Gor001', 'Gorilla', 'Vet001', '2024-11-18 10:00:00', '180.0kg', 36.8, 50, 16, 'Good', 'Socializing with others', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass042', 'Gor002', 'Gorilla', 'Vet004', '2024-11-18 10:30:00', '175.0kg', 36.8, 50, 16, 'Good', 'Socializing with others', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass043', 'Gor003', 'Gorilla', 'Vet004', '2024-11-18 11:00:00', '170.0kg', 36.8, 50, 16, 'Good', 'Socializing with others', 'Sub-Healthy', 'Having a cold', 'Activities are not recommended'),
('Ass044', 'Gor004', 'Gorilla', 'Vet008', '2024-11-18 11:30:00', '165.0kg', 36.8, 50, 16, 'Good', 'Socializing with others', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass045', 'Gor008', 'Gorilla', 'Vet001', '2024-11-18 11:40:00', '165.0kg', 36.8, 50, 16, 'Good', 'Socializing with others', 'Healthy', 'Normal', 'Can participate in activities'),
-- Boa
('Ass046', 'Boa001', 'Boa', 'Vet002', '2024-11-27 10:00:00', '2.2kg', 30.0, 10, 5, 'Normal', 'Hibernating', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass047', 'Boa002', 'Boa', 'Vet010', '2024-11-27 10:30:00', '2.1kg', 30.0, 10, 5, 'Normal', 'Hibernating', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass048', 'Boa003', 'Boa', 'Vet005', '2024-11-27 11:00:00', '2.0kg', 30.0, 10, 5, 'Normal', 'Hibernating', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass049', 'Boa004', 'Boa', 'Vet010', '2024-11-27 11:30:00', '1.9kg', 30.0, 10, 5, 'Normal', 'Hibernating', 'Healthy', 'In the process of molting', 'Activities are not recommended'),
('Ass050', 'Boa005', 'Boa', 'Vet005', '2024-11-27 12:00:00', '1.8kg', 30.0, 10, 5, 'Normal', 'Hibernating', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass051', 'Boa006', 'Boa', 'Vet010', '2024-11-27 12:30:00', '1.7kg', 30.0, 10, 5, 'Normal', 'Hibernating', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass052', 'Boa007', 'Boa', 'Vet002', '2024-11-27 13:00:00', '1.6kg', 30.0, 10, 5, 'Normal', 'Hibernating', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass053', 'Boa008', 'Boa', 'Vet005', '2024-11-27 13:30:00', '1.5kg', 30.0, 10, 5, 'Normal', 'Hibernating', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass054', 'Boa009', 'Boa', 'Vet010', '2024-11-27 14:20:00', '1.5kg', 30.0, 10, 5, 'Normal', 'Hibernating', 'Healthy', 'Normal', 'Can participate in activities'),
('Ass055', 'Gir003', 'Boa', 'Vet005', '2024-11-30 14:30:00', '1.5kg', 30.1, 10, 15, 'Good', 'Hibernating', 'Healthy', 'Normal', 'Can participate in activities');

CREATE TABLE Activity_Animal (
    ActivityID VARCHAR(10) NOT NULL,
    AnimalID VARCHAR(20) NOT NULL,
    PRIMARY KEY (ActivityID, AnimalID),
    FOREIGN KEY (ActivityID) REFERENCES Activity(ActivityID),
    FOREIGN KEY (AnimalID) REFERENCES AnimalDetails(AnimalID)
);
INSERT INTO Activity_Animal (ActivityID, AnimalID)  
VALUES  
('A001', 'Mon001'),  
('A001', 'Mon002'),  
('A001', 'Mon003'),  
('A002', 'Dol001'),  
('A002', 'Dol002'),  
('A003', 'Ele001'),  
('A003', 'Ele002'),  
('A003', 'Ele003'),  
('A003', 'Ele004'),  
('A004', 'Gir001'),  
('A004', 'Gir002'),  
('A004', 'Gir003'),  
('A004', 'Gir004'),  
('A004', 'Gir005'),  
('A004', 'Gir006'),  
('A004', 'Gir007'),  
('A004', 'Gir008'),  
('A004', 'Gir009'),  
('A005', 'Tig001'),  
('A005', 'Tig002'),  
('A005', 'Tig003'),  
('A006', 'Lio001'),  
('A006', 'Lio002'),  
('A006', 'Lio003'),  
('A006', 'Lio004'),  
('A007', 'Pan001'),  
('A008', 'Red001'),  
('A008', 'Red002'),  
('A008', 'Red003'),  
('A008', 'Red004'),  
('A008', 'Red005'),  
('A009', 'Gor001'),  
('A009', 'Gor002'),  
('A009', 'Gor003'),  
('A009', 'Gor004'),  
('A010', 'Boa001'),  
('A010', 'Boa002'),  
('A010', 'Boa003'),  
('A010', 'Boa004'),  
('A010', 'Boa005'),  
('A010', 'Boa006'),  
('A010', 'Boa007'),  
('A010', 'Boa008'),  
('A011', 'Gor001'),  
('A011', 'Gor002'),  
('A011', 'Gor003'),  
('A012', 'Boa001'),  
('A012', 'Boa002'),  
('A012', 'Boa003'),  
('A012', 'Boa004'),  
('A012', 'Boa005'),  
('A013', 'Pan001'),  
('A013', 'Pan002'),  
('A014', 'Tig001'),  
('A014', 'Tig002'),  
('A015', 'Dol001'),  
('A015', 'Dol002');




