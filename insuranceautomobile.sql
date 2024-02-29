Create database InsuranceSystem;
use InsuranceSystem;

-- Create Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL,
);

-- Create Policies table
CREATE TABLE Policies (
    PolicyID INT PRIMARY KEY,
    UserID INT NOT NULL,
    PolicyType NVARCHAR(50) NOT NULL,
    Premium DECIMAL(10, 2) NOT NULL,
    Status NVARCHAR(50) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

--Create Claims table
CREATE TABLE Claims (
    ClaimID INT PRIMARY KEY,
    PolicyID INT NOT NULL,
    ClaimAmount DECIMAL(10, 2) NOT NULL,
    Status NVARCHAR(50) NOT NULL,
    FOREIGN KEY (PolicyID) REFERENCES Policies(PolicyID)
);

-- Create Vehicles table
CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    UserID INT NOT NULL,
    VehicleType NVARCHAR(50) NOT NULL,
    Make NVARCHAR(50) NOT NULL,
    Model NVARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    PolicyID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATETIME NOT NULL,
    FOREIGN KEY (PolicyID) REFERENCES Policies(PolicyID)
);

-- Insert sample data into Users table
INSERT INTO Users (UserID, UserName, Email, Password)
VALUES 
    (1, 'Jatin Sharma', 'jatin@example.com', 'password123'),
    (2, 'Rohit Parmeshwar', 'rohit@example.com', 'abc123'),
    (3, 'Shweta Sharma', 'shweta@example.com', 'pass456');

-- Insert sample data into Policies table
INSERT INTO Policies (PolicyID, UserID, PolicyType, Premium, Status)
VALUES 
    (1, 1, 'Car Insurance', 500.00, 'Active'),
    (2, 2, 'Motorcycle Insurance', 300.00, 'Active'),
    (3, 3, 'Truck Insurance', 800.00, 'Expired');

-- Insert sample data into Claims table
INSERT INTO Claims (ClaimID, PolicyID, ClaimAmount, Status)
VALUES 
    (1, 1, 200.00, 'Pending'),
    (2, 2, 150.00, 'Approved'),
    (3, 3, 500.00, 'Denied');

-- Insert sample data into Vehicles table
INSERT INTO Vehicles (VehicleID, UserID, VehicleType, Make, Model, Year)
VALUES 
    (1, 1, 'Car', 'Toyota', 'Camry', 2018),
    (2, 2, 'Motorcycle', 'Harley Davidson', 'Sportster', 2020),
    (3, 3, 'Truck', 'Ford', 'F-150', 2015);
-- Insert sample data into Payments table
INSERT INTO Payments (PaymentID, PolicyID, Amount, PaymentDate)
VALUES 
    (1, 1, 500.00, '2023-01-15'),
    (2, 2, 300.00, '2023-02-20'),
    (3, 3, 800.00, '2022-12-10');
Select * from Claims;
Select * from Vehicles;
