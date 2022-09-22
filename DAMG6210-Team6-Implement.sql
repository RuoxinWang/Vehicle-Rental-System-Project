--USE DAMG6210Team6;
-- CREATE TABLE
/* Create Staff Table */
CREATE TABLE Staff (
StaffID INT NOT NULL UNIQUE, 
StFName VARCHAR(30) NOT NULL, 
StLName VARCHAR(30) NOT NULL, 
DOB DATE NOT NULL, --FORMAT YYYY-MM-DD
HireDate DATE NOT NULL, 
Phone# CHAR(13) NOT NULL, --FORMAT (xxx)xxx-xxxx
PayRate FLOAT NOT NULL,
SAddress VARCHAR(255) NOT NULL,
SCity VARCHAR(255) NOT NULL,
SState CHAR(2) NOT NULL,
SZipCode INT NOT NULL
PRIMARY KEY(StaffID)
);

/* Create Service_Staff Table */ 
CREATE TABLE Service_Staff ( 
StaffID INT NOT NULL UNIQUE, 
DepartmentCode CHAR(5) NOT NULL, 
PRIMARY KEY(StaffID),
FOREIGN KEY(StaffID) REFERENCES Staff(StaffID) 
);

/* Create Office_Staff Table */
CREATE TABLE Office_Staff (
StaffID INT NOT NULL UNIQUE, 
Office# CHAR(3) NOT NULL,
PRIMARY KEY(StaffID),
FOREIGN KEY(StaffID) REFERENCES Staff(StaffID) 
);

/* Create Vehicle Table */
CREATE TABLE Vehicle (
Vin# VARCHAR(17) NOT NULL UNIQUE,
Make VARCHAR(30) NOT NULL,
Model VARCHAR(30) NOT NULL,
ProduceYear CHAR(4) NOT NULL,
Mileage INT NOT NULL,
BodyType VARCHAR(30) NOT NULL,
Horsepower INT NOT NULL,
Color VARCHAR(30) NOT NULL,
Drivetrain CHAR(3) NOT NULL, -- FWD,RWD,AWD
FuelType VARCHAR(30) NOT NULL, 
Seats# INT NOT NULL,
Price FLOAT NOT NULL,
PRIMARY KEY (Vin#)
);

/* Create Customer Table */
CREATE TABLE Customer (
CustomerID INT  NOT NULL UNIQUE,
DLicense# VARCHAR(30) NOT NULL,  
DFName VARCHAR(30) NOT NULL, 
DLName VARCHAR(30) NOT NULL, 
DOB DATE NOT NULL,
Phone# CHAR(13) NOT NULL, --FORMAT (xxx)xxx-xxxx
Email VARCHAR(255) NOT NULL,
DAddress VARCHAR(255) NOT NULL,
DCity VARCHAR(30) NOT NULL, 
DState CHAR(2) Not null, 
DZip INT Not null, 
BloodType VARCHAR(5) NOT NULL,
CCard# VARCHAR(16) NOT NULL, 
PRIMARY KEY (CustomerID)
);

/* Create Insurance Table*/
CREATE TABLE Insurance (
Insurance# INT NOT NULL UNIQUE,
InsuranceCompany VARCHAR(255) NOT NULL,
InsuranceType Varchar(30) NOT NULL,
PRIMARY KEY (Insurance#)
);

/* Create RentalContract Table */
CREATE TABLE RentalContract ( 
Contract# INT NOT NULL UNIQUE, 
Vin# VARCHAR(17) NOT NULL,
CustomerID INT NOT NULL,
StaffID INT NOT NULL, 
Insurance# INT NOT NULL,
Price FLOAT NOT NULL,
OutDate DATE NOT NULL, 
ReturnDate DATE NULL, 
TotalCharge FLOAT NOT NULL,
AmountDue FLOAT NOT NUll,
PRIMARY KEY (Contract#),
FOREIGN KEY (Vin#) REFERENCES Vehicle(Vin#),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
FOREIGN KEY (StaffID) REFERENCES Office_Staff(StaffID),
FOREIGN KEY(Insurance#) REFERENCES Insurance(Insurance#)
);

/* Create Service_Record Table */ 
CREATE TABLE Service_Record ( 
Service# INT NOT NULL UNIQUE,
Contract# INT NOT NULL,
ServiceDate DATE NOT NULL,
ServiceDESC VARCHAR(255) NOT NULL,
PRIMARY KEY (Service#),
FOREIGN KEY (Contract#) REFERENCES RentalContract(Contract#)
);

/* Create Service_Detail Table */ 
CREATE TABLE Service_Detail ( 
StaffID INT NOT NULL, 
Service# INT NOT NULL,
FOREIGN KEY (StaffID) REFERENCES Service_Staff(StaffID),
FOREIGN Key (Service#) REFERENCES Service_Record(Service#) 
);

/* Create Outside_Service Table */
CREATE TABLE Outside_Service (
OutService# INT NOT NULL UNIQUE,
Contract# INT NOT NULL,
ServiceCompany VARCHAR(255) NOT NULL,
ServiceDATE DATE NOT NULL,
ServiceDESC VARCHAR(255) NOT NULL,
PRIMARY KEY (OutService#),
FOREIGN KEY (Contract#) REFERENCES RentalContract(Contract#)
);

/* Create Damage Table */
CREATE TABLE Damage (
Report# INT NOT NULL UNIQUE,
Contract# INT NOT NULL,
DamageDESC VARCHAR(255) NOT NULL,
DamageDATE DATE NOT NULL,
PRIMARY KEY (Report#),
FOREIGN KEY (Contract#) REFERENCES RentalContract(Contract#)
);

/* Create Reward Table */
CREATE TABLE Reward (
Reward# INT NOT NULL UNIQUE,
CustomerID INT NOT NULL,
RewardType VARCHAR(30) NOT NULL,
IssuedDate DATE NOT NULL,
RewardDESC VARCHAR(255) NOT NULL,
PRIMARY KEY (Reward#),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Insert Values
/* Insert Values into Staff Table */
SELECT * from Staff;
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (7164468, 'Aguste', 'Endrici', '1979-05-20', '2005-06-09', '(214)339-9243', 7312.54, '931 Schiller Street', 'Garland', 'TX', 75049);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (8717965, 'Ricki', 'Pollastrino', '1981-01-21', '2009-11-14', '(859)696-6424', 5414.16, '56676 Maryland Park', 'Lexington', 'KY', 40515);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (5616663, 'Jedediah', 'Lilian', '1980-09-02', '2003-07-16', '(281)593-8127', 9559.25, '1 Sachtjen Avenue', 'Katy', 'TX', 77493);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (5200160, 'Hailey', 'Bellard', '1978-06-18', '2007-08-28', '(281)475-5788', 6001.91, '05590 Marquette Way', 'Houston', 'TX', 77050);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (1367205, 'Gerrie', 'Sopper', '1973-11-23', '2001-04-17', '(334)258-1208', 8310.52, '8213 Cascade Point', 'Montgomery', 'AL', 36125);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (6926894, 'Blancha', 'Damrell', '1978-11-27', '2007-06-15', '(907)296-6341', 6857.88, '8 Corben Way', 'Fairbanks', 'AK', 99709);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (4760733, 'Violette', 'Prendeville', '1972-11-15', '2001-03-31', '(419)162-4569', 9145.27, '01 Bayside Road', 'Toledo', 'OH', 43635);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (4347498, 'Quinlan', 'Kinnett', '1980-09-28', '2008-03-26', '(617)302-0889', 6912.65, '54 Rusk Court', 'Boston', 'MA', 12208);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (8344993, 'Derrick', 'Foro', '1986-09-28', '2008-03-02', '(617)585-8894', 7357.37, '6911 Pierstorff Parkway', 'Boston', 'MA', 12208);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (6064774, 'Zeke', 'Pollard', '1987-06-26', '2009-08-02', '(612)386-2908', 7576.59, '82440 Sherman Street', 'Minneapolis', 'MN', 55412);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (7672081, 'Tressa', 'Ticksall', '1978-01-16', '2000-10-23', '(415)955-7125', 7165.80, '7 Bartillon Parkway', 'San Francisco', 'CA', 94177);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (2453479, 'Linnea', 'Chastney', '1973-07-18', '2003-01-20', '(239)199-5808', 5727.86, '86837 Prentice Alley', 'Fort Myers', 'FL', 33994);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (6830773, 'Artemas', 'Espinay', '1979-01-24', '2008-12-28', '(801)503-4602', 9070.16, '0 Lukken Place', 'Salt Lake City', 'UT', 84199);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (1594338, 'Rowena', 'Mucklestone', '1978-04-07', '2004-08-19', '(860)761-2453', 5927.95, '1 Anzinger Lane', 'Hartford', 'CT', 16183);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (4934921, 'Kippar', 'Blackway', '1982-03-02', '2006-11-24', '(469)566-3785', 7650.71, '0 Lien Alley', 'Garland', 'TX', 75044);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (8367877, 'Meryl', 'Grundon', '1978-02-14', '2008-07-29', '(305)400-0240', 7763.11, '9 Fairview Trail', 'Miami Beach', 'FL', 33141);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (5292761, 'Verne', 'Whannel', '1977-11-16', '2003-05-02', '(214)619-2139', 6148.99, '4 Banding Place', 'Dallas', 'TX', 75358);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (1800821, 'Dita', 'Lichtfoth', '1978-12-11', '2006-07-14', '(318)183-7208', 7989.06, '903 Meadow Ridge Road', 'Boston', 'MA', 12104);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (2393493, 'Enrico', 'Davidi', '1978-07-06', '2007-12-23', '(540)778-1689', 6700.01, '981 Macpherson Park', 'Roanoke', 'VA', 24014);
insert into Staff (StaffID, StFName, StLName, DOB, HireDate, Phone#, PayRate, SAddress, SCity, SState, SZipCode) values (5452172, 'Clarisse', 'Pirkis', '1983-01-01', '2006-10-01', '(561)589-1519', 6420.20, '1 Rusk Terrace', 'West Palm Beach', 'FL', 33405);

/* Insert Values into Service_Staff Table */ 
SELECT * from Service_Staff;
insert into Service_Staff (StaffID, DepartmentCode) values (7164468, '10004');
insert into Service_Staff (StaffID, DepartmentCode) values (8717965, '10003');
insert into Service_Staff (StaffID, DepartmentCode) values (5616663, '10001');
insert into Service_Staff (StaffID, DepartmentCode) values (5200160, '10003');
insert into Service_Staff (StaffID, DepartmentCode) values (1367205, '10001');
insert into Service_Staff (StaffID, DepartmentCode) values (6926894, '10005');
insert into Service_Staff (StaffID, DepartmentCode) values (4760733, '10002');
insert into Service_Staff (StaffID, DepartmentCode) values (4347498, '10003');
insert into Service_Staff (StaffID, DepartmentCode) values (8344993, '10003');
insert into Service_Staff (StaffID, DepartmentCode) values (6064774, '10005');

/* Insert Values into Office_Staff Table */
SELECT * from Office_Staff;
insert into Office_Staff (StaffID, Office#) values (7672081, '103');
insert into Office_Staff (StaffID, Office#) values (2453479, '102');
insert into Office_Staff (StaffID, Office#) values (6830773, '102');
insert into Office_Staff (StaffID, Office#) values (1594338, '103');
insert into Office_Staff (StaffID, Office#) values (4934921, '101');
insert into Office_Staff (StaffID, Office#) values (8367877, '101');
insert into Office_Staff (StaffID, Office#) values (5292761, '102');
insert into Office_Staff (StaffID, Office#) values (1800821, '101');
insert into Office_Staff (StaffID, Office#) values (2393493, '102');
insert into Office_Staff (StaffID, Office#) values (5452172, '102');

/* Insert Values into Vehicle Table */
SELECT * FROM Vehicle;
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('1HGCP2F34AA328122', 'Kia', 'Sportage', 2019, 9476, 'SUV', 181, 'Blue', 'FWD', 'Regular', 5, 80.00);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('SCFFBCBD8AG465321', 'Nissan', '370Z', 2010, 7349, 'Sports Car', 332, 'White', 'RWD', 'Premium', 2, 173.50);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('1C3CCBBB1DN294830', 'Volkswagen', 'Tiguan', 2018, 3902, 'SUV', 184, 'Black', 'FWD', 'Regular', 7, 100.50);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('1N6AA0EC0EN268624', 'Ford', 'E150', 2014, 16887, 'Van', 225, 'White', 'AWD', 'Diesel', 12, 96.00);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('3GYFNEE38ES916477', 'Mini', 'Cooper', 2016, 5487, 'Convertible', 181, 'Black', 'AWD', 'Regular', 5, 123.29);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('3GYFNCE36DS563546', 'Chevrolet', 'Camaro', 2010, 5676, 'Convertible', 650, 'Orange', 'RWD', 'Premium', 4, 242.30);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('1HGCP2E79AA922743', 'Volvo', 'C70', 2002, 13785, 'Sedan', 250, 'Silver', 'AWD', 'Midgrade', 5, 98.75);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('2C3CDXGJ2EH768174', 'Scion', 'tC', 2016, 6798, 'Coupe', 179, 'Silver', 'RWD', 'Midgrade', 4, 105.35);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('3D73M4CL5BG080656', 'Volvo', 'S40', 2005, 19595, 'Sedan', 227, 'White', 'AWD', 'Midgrade', 5, 95.75);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('1FTEX1C85AF495073', 'Jaguar', 'XJ', 2019, 8392, 'Sedan', 575, 'Black', 'AWD', 'Premium', 5, 256.50);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('5UXXW3C55F0197941', 'GMC', 'Savana', 2003, 27915, 'Van', 181, 'White', 'FWD', 'Diesel', 10, 112.10);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('JM1CR2W34A0035142', 'Honda', 'Civic', 2010, 15456, 'HatchBack', 180, 'Blue', 'FWD', 'Midgrade', 5, 97.55);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('WAUSFBFL3AA326596', 'Toyota', 'Camry', 2006, 27493, 'Sedan', 202, 'Silver', 'AWD', 'Regular', 5, 79.50);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('WA1CGBFE5ED506165', 'BMW', 'X5', 2015, 23929, 'SUV', 523, 'Silver', 'AWD', 'Midgrade', 5, 153.56);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('1C4RDJEG2FC007613', 'Subaru', 'Impreza', 2015, 13855, 'Sedan', 313, 'White', 'AWD', 'Midgrade', 5, 190.99);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('19UUA66226A007398', 'Mercedes-Benz', 'CLS-Class', 2019, 16334, 'Coupe', 362, 'Silver', 'AWD', 'Premium', 5, 330.00);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('SALAB2V62FA725652', 'Ford', 'Mustang', 2016, 27440, 'Convertible', 410, 'Black', 'RWD', 'Midgrade', 4, 239.99);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('3D73Y4HL9BG979355', 'Nissan', 'Altima', 2017, 19182, 'Sedan', 182, 'Blue', 'FWD', 'Regular', 5, 89.99);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('SCBEC9ZA1FC439389', 'Hyundai', 'Tucson', 2010, 27340, 'SUV', 187, 'Red', 'FWD', 'Regular', 5, 65.50);
insert into Vehicle (Vin#, Make, Model, ProduceYear, Mileage, BodyType, Horsepower, Color, Drivetrain, FuelType, Seats#, Price) values ('WA1EFCFS4FR112748', 'Audi', 'S4', 2017, 6562, 'Sports Car', 349, 'Black', 'AWD', 'Premium', 5, 278.00);


/* Insert Values into Customer Table */
SELECT * FROM Customer;
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (5308919, '59-029-7592', 'Sheila', 'Mechi', '1984-06-20', '(225)149-0068', 'smechi0@apache.org', '8371 Thierer Place', 'Baton Rouge', 'LA', 70836, 'A', '3569152101867162');
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (5712392, '86-674-1530', 'Mela', 'Rizzello', '1986-09-03', '(801)865-6838', 'mrizzello1@ucoz.com', '7 Alpine Trail', 'Salt Lake City', 'UT', 84189, 'O', '6385452344384354');
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (1118176, '56-318-4182', 'Worden', 'Bernardot', '1984-01-18', '(425)359-8839', 'wbernardot2@bluehost.com', '8664 Cody Court', 'Seattle', 'WA', 98140, 'B', '3587699208435051');
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (6558864, '52-543-9809', 'Sonny', 'Mateuszczyk', '1990-09-29', '(910)555-3920', 'smateuszczyk3@flickr.com', '82 Anhalt Parkway', 'Fayetteville', 'NC', 28305, 'A', '56022358325822235');
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (7123131, '33-927-5117', 'Flynn', 'Armfirld', '1991-09-27', '(805)916-1676', 'farmfirld4@usnews.com', '07311 Northwestern Plaza', 'Santa Barbara', 'CA', 93111, 'B' , '56022191780503705');
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (6708384, '32-621-2847', 'Lira', 'Penright', '1996-01-29', '(305)562-3461', 'lpenright5@wordpress.com', '25042 Prentice Court', 'Miami', 'FL', 33196, 'AB', '6383658986312329');
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (3479359, '67-250-6679', 'Filbert', 'Hall', '1971-01-12', '(202)110-6994', 'fhall6@newsvine.com', '70772 Stone Corner Parkway', 'Washington', 'DC', 20425, 'A', '675940934544192877');
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (6736130, '10-239-9505', 'Wendy', 'Coleshill', '1979-02-15', '(559)468-4476', 'wcoleshill7@surveymonkey.com', '40 Fuller Trail', 'Fresno', 'CA', 93786, 'B', '6763694449089522749');
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (1026385, '36-185-9646', 'Justin', 'Adkins', '1986-11-16', '(605)583-5003', 'jadkins8@chron.com', '40016 Melby Drive', 'Sioux Falls', 'SD', 57193, 'O', '630431115351420830');
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (7214743, '78-969-5438', 'Melesa', 'Blackhall', '1982-01-26', '(281)709-9229', 'mblackhall9@privacy.gov.au', '46 Buhler Court', 'Spring', 'TX', 77386, 'AB', '30035432069508');
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (3203921, '75-588-2641', 'Jacquie', 'Trahearn', '1995-01-31', '(973)788-1215', 'jtrahearna@blog.com', '12345 Village Green Drive', 'Paterson', 'NJ', 17522, 'A', '3534304803859862');
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (6316684, '88-794-4728', 'Danita', 'Saker', '1988-10-30', '(615)995-1889', 'dsakerb@1688.com', '54 Orin Place', 'Nashville', 'TN', 37240, 'AB', '5261782707391054');
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (4406922, '03-276-8266', 'Theresina', 'Fumagall', '1984-01-06', '(651)591-2163', 'tfumagallc@constantcontact.com', '46570 Rusk Hill', 'Minneapolis', 'MN', 55407, 'B', '3573001355104364');
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (8499026, '18-275-9602', 'Abrahan', 'Todarello', '1974-09-25', '(805)222-3461', 'atodarellod@tinypic.com', '0 Brickson Park Hill', 'Van Nuys', 'CA', 91406, 'A', '3543524026850906');
insert into Customer (CustomerID, DLicense#, DFName, DLName, DOB, Phone#, Email, DAddress, DCity, DState, DZip, BloodType, CCard#) values (6942242, '94-387-3539', 'Ileane', 'Figgs', '1987-02-21', '(712)212-0268', 'ifiggse@msn.com', '3 Rockefeller Park', 'Sioux City', 'IA', 51105, 'O', '3530867632934464');

/* Insert Values into Insurance Table */
SELECT * FROM Insurance;
insert into Insurance (Insurance#, InsuranceCompany, InsuranceType) values (4153474, 'Geico', 'Collision Coverage');
insert into Insurance (Insurance#, InsuranceCompany, InsuranceType) values (5083836, 'USAA', 'Collision Coverage');
insert into Insurance (Insurance#, InsuranceCompany, InsuranceType) values (7708443, 'Geico', 'Comprehensive Coverage');
insert into Insurance (Insurance#, InsuranceCompany, InsuranceType) values (8361631, 'Geico', 'Collision Coverage');
insert into Insurance (Insurance#, InsuranceCompany, InsuranceType) values (8294501, 'State Farm', 'Comprehensive Coverage');
insert into Insurance (Insurance#, InsuranceCompany, InsuranceType) values (4952905, 'Geico', 'Collision Coverage');
insert into Insurance (Insurance#, InsuranceCompany, InsuranceType) values (1388529, 'State Farm', 'Collision Coverage');
insert into Insurance (Insurance#, InsuranceCompany, InsuranceType) values (6555976, 'State Farm', 'Comprehensive Coverage');
insert into Insurance (Insurance#, InsuranceCompany, InsuranceType) values (9810022, 'USAA', 'Comprehensive Coverage');
insert into Insurance (Insurance#, InsuranceCompany, InsuranceType) values (9803191, 'Geico', 'Auto Liability Coverage');

/* Insert Values into RentalContract Table */
SELECT * FROM RentalContract;
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (453160, '1HGCP2F34AA328122', 5308919, 7672081, 4153474, 80.00, '2020-03-01', '2020-03-10', 900.00, 900.00);
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (288012, 'SCFFBCBD8AG465321', 5712392, 7672081, NULL, 173.50, '2019-12-10', '2019-12-15', 1000.50, 867.50);
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (564132, '1C3CCBBB1DN294830', 1118176, 2453479, 5083836, 100.50, '2018-05-01', '2018-05-20', 2150.00, 2150.00);
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (997479, '1N6AA0EC0EN268624', 6558864, 2453479, 7708443, 96.00, '2018-01-10', '2018-01-20', 990.00, 990.00);
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (976967, '3GYFNEE38ES916477', 7123131, 6830773, 8361631, 123.29, '2018-02-20', '2018-02-25',725.45, 616.45);
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (102900, '3GYFNCE36DS563546', 6708384, 6830773, NULL, 242.30, '2019-03-01', '2019-03-15', 3950.50, 3950.50);
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (865260, '1HGCP2E79AA922743', 3479359, 4934921, 8294501, 98.75, '2019-07-10', '2019-07-25', 1550.25, 1550.25);
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (430670, '2C3CDXGJ2EH768174', 6736130, 4934921, NULL, 105.35, '2020-06-20', '2020-06-30', 1100.50, 1053.50);
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (540162, '3D73M4CL5BG080656', 1026385, 8367877, 4952905, 95.75, '2021-02-20', '2021-02-25', 550.75, 550.75);
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (429439, 'WA1EFCFS4FR112748', 7214743, 8367877, 1388529, 278.00, '2018-10-10', '2018-10-30', 6285.00, 6285.00);
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (787356, 'SALAB2V62FA725652', 3203921, 5292761, NULL, 239.99, '2019-03-10', '2019-03-15', 1199.95, 1199.95);
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (756306, 'WAUSFBFL3AA326596', 6316684, 5292761, NULL, 79.50, '2018-12-20', '2018-12-24', 318.00, 318.00);
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (441660, '19UUA66226A007398', 4406922, 1800821, 6555976, 330.00, '2021-10-10', '2021-10-25', 4950.00, 4950.00);
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (415537, 'SCBEC9ZA1FC439389', 8499026, 1800821, 9810022, 65.50, '2019-02-01', '2019-02-10', 655.00, 655.00);
insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (809729, '5UXXW3C55F0197941', 6942242, 2393493, 9803191, 112.10, '2018-02-10', '2018-02-20', 1121.00, 1121.00);

/* Insert Values into Service_Record Table */
SELECT * FROM Service_Record;
insert into Service_Record (Service#, Contract#, ServiceDate, ServiceDesc) values (2642327, 453160, '2020-03-11', 'Front Bumper Change');
insert into Service_Record (Service#, Contract#, ServiceDate, ServiceDesc) values (8872611, 288012, '2019-12-16', 'Front Bumper Change');
insert into Service_Record (Service#, Contract#, ServiceDate, ServiceDesc) values (6438826, 564132, '2018-05-21', 'Front Bumper Change');
insert into Service_Record (Service#, Contract#, ServiceDate, ServiceDesc) values (5219780, 997479, '2018-01-22', 'Front Bumper Change');
insert into Service_Record (Service#, Contract#, ServiceDate, ServiceDesc) values (4099024, 976967, '2018-02-26', 'Front Bumper Change');
insert into Service_Record (Service#, Contract#, ServiceDate, ServiceDesc) values (7813376, 102900, '2019-03-20', 'Front Bumper Change');
insert into Service_Record (Service#, Contract#, ServiceDate, ServiceDesc) values (7351937, 865260, '2019-07-26', 'Front Bumper Change');
insert into Service_Record (Service#, Contract#, ServiceDate, ServiceDesc) values (2555600, 430670, '2020-07-01', 'Front Bumper Change');
insert into Service_Record (Service#, Contract#, ServiceDate, ServiceDesc) values (5189538, 540162, '2021-02-27', 'Front Bumper Change');
insert into Service_Record (Service#, Contract#, ServiceDate, ServiceDesc) values (6452643, 429439, '2018-11-01', 'Front Bumper Change');

/*Insert Values into Service_Detail Table */
SELECT * FROM Service_Detail;
insert into Service_Detail (StaffID, Service#) values (7164468, 2642327);
insert into Service_Detail (StaffID, Service#) values (8717965, 8872611);
insert into Service_Detail (StaffID, Service#) values (8717965, 6438826);
insert into Service_Detail (StaffID, Service#) values (7164468, 5219780);
insert into Service_Detail (StaffID, Service#) values (5200160, 4099024);
insert into Service_Detail (StaffID, Service#) values (1367205, 7813376);
insert into Service_Detail (StaffID, Service#) values (6926894, 7351937);
insert into Service_Detail (StaffID, Service#) values (4347498, 2555600);
insert into Service_Detail (StaffID, Service#) values (8344993, 5189538);
insert into Service_Detail (StaffID, Service#) values (6926894, 6452643);

/* Insert Values into Outside_Service Table */
SELECT * FROM Outside_Service;
insert into Outside_Service (OutService#, Contract#, ServiceCompany, ServiceDATE, ServiceDESC) values (6994935, 809729, 'Upton Auto Service Seattle', '2018-02-13', 'Rear Bumper Change');
insert into Outside_Service (OutService#, Contract#, ServiceCompany, ServiceDATE, ServiceDESC) values (5679504, 415537, 'Upton Auto Service Phoenix', '2019-02-05', 'Rear Bumper Change');
insert into Outside_Service (OutService#, Contract#, ServiceCompany, ServiceDATE, ServiceDESC) values (3907571, 441660, 'Upton Auto Service Bellevue', '2021-10-12', 'Rear Bumper Change');
insert into Outside_Service (OutService#, Contract#, ServiceCompany, ServiceDATE, ServiceDESC) values (2088608, 756306, 'Upton Auto Service Portland', '2018-12-21', 'Rear Bumper Change');
insert into Outside_Service (OutService#, Contract#, ServiceCompany, ServiceDATE, ServiceDESC) values (9127628, 787356, 'Upton Auto Service Tempe', '2019-03-10', 'Rear Bumper Change');
insert into Outside_Service (OutService#, Contract#, ServiceCompany, ServiceDATE, ServiceDESC) values (1943704, 429439, 'Upton Auto Service Redmond', '2018-10-26', 'Rear Bumper Change');
insert into Outside_Service (OutService#, Contract#, ServiceCompany, ServiceDATE, ServiceDESC) values (4226147, 540162, 'Upton Auto Service Los Angeles', '2021-02-20', 'Rear Bumper Change');
insert into Outside_Service (OutService#, Contract#, ServiceCompany, ServiceDATE, ServiceDESC) values (5026285, 430670, 'Upton Auto Service San Francisco', '2020-06-28', 'Rear Bumper Change');
insert into Outside_Service (OutService#, Contract#, ServiceCompany, ServiceDATE, ServiceDESC) values (5586619, 865260, 'Upton Auto Service San Jose', '2019-07-22', 'Rear Bumper Change');
insert into Outside_Service (OutService#, Contract#, ServiceCompany, ServiceDATE, ServiceDESC) values (9820083, 102900, 'Upton Auto Service San Diego', '2019-03-13', 'Rear Bumper Change');

/* Insert Values into Damage Table */
SELECT * FROM Damage;
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (5145627, 453160, 'Front Bumper Broke', '2020-03-05');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (6212722, 288012, 'Front Bumper Broke', '2019-12-13');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (6948563, 564132, 'Front Bumper Broke', '2018-05-15');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (3891555, 997479, 'Front Bumper Broke', '2018-01-15');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (2200510, 976967, 'Front Bumper Broke', '2018-02-22');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (9784345, 102900, 'Front Bumper Broke', '2019-03-10');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (7519986, 865260, 'Front Bumper Broke', '2019-07-15');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (9861574, 430670, 'Front Bumper Broke', '2020-06-25');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (6225978, 540162, 'Front Bumper Broke', '2021-02-22');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (9117190, 429439, 'Front Bumper Broke', '2018-10-20');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (3443637, 809729, 'Rear Bumper Broke', '2018-02-15');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (3299777, 415537, 'Rear Bumper Broke', '2019-02-05');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (4119637, 441660, 'Rear Bumper Broke', '2021-10-15');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (7360876, 756306, 'Rear Bumper Broke', '2018-12-22');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (2603228, 787356, 'Rear Bumper Broke', '2019-03-13');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (7519989, 429439, 'Rear Bumper Broke', '2018-10-20');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (3299778, 540162, 'Rear Bumper Broke', '2021-02-22');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (4119638, 430670, 'Rear Bumper Broke', '2020-06-25');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (7360877, 865260, 'Rear Bumper Broke', '2019-07-15');
insert into Damage (Report#, Contract#, DamageDESC, DamageDATE) values (2603229, 102900, 'Rear Bumper Broke', '2019-03-10');

/* Insert Values into Reward Table */
SELECT * FROM Reward;
insert into Reward (Reward#, CustomerID, RewardType, IssuedDate, RewardDESC) values (4417283, 5308919, '15% Discount', '2020-03-28', 'Not Used');
insert into Reward (Reward#, CustomerID, RewardType, IssuedDate, RewardDESC) values (1678177, 5308919, '10% Discount', '2020-01-04', 'Not Used');
insert into Reward (Reward#, CustomerID, RewardType, IssuedDate, RewardDESC) values (1083902, 5712392, '15% Discount', '2020-03-29', 'Not Used');
insert into Reward (Reward#, CustomerID, RewardType, IssuedDate, RewardDESC) values (9204550, 5712392, '10% Discount', '2018-07-23', 'Not Used');
insert into Reward (Reward#, CustomerID, RewardType, IssuedDate, RewardDESC) values (9753901, 1118176, '10% Discount', '2020-12-03', 'Not Used');
insert into Reward (Reward#, CustomerID, RewardType, IssuedDate, RewardDESC) values (4096031, 1118176, '15% Discount', '2020-08-15', 'Not Used');
insert into Reward (Reward#, CustomerID, RewardType, IssuedDate, RewardDESC) values (1847048, 6558864, '20% Discount', '2020-02-27', 'Not Used');
insert into Reward (Reward#, CustomerID, RewardType, IssuedDate, RewardDESC) values (7729141, 6558864, '10% Discount', '2020-04-06', 'Not Used');
insert into Reward (Reward#, CustomerID, RewardType, IssuedDate, RewardDESC) values (2124236, 7123131, '10% Discount', '2020-08-16', 'Not Used');
insert into Reward (Reward#, CustomerID, RewardType, IssuedDate, RewardDESC) values (8157659, 7123131, '15% Discount', '2021-02-22', 'Not Used');
insert into Reward (Reward#, CustomerID, RewardType, IssuedDate, RewardDESC) values (2113481, 6708384, '15% Discount', '2021-06-28', 'Not Used');
insert into Reward (Reward#, CustomerID, RewardType, IssuedDate, RewardDESC) values (6841063, 3479359, '20% Discount', '2020-02-03', 'Not Used');

-- Views
/* Allow office staff to track the status for maintenance of vehicles
and contact customers*/
CREATE VIEW vwRentalContractInfo
 AS
  SELECT 
  dr.Contract#, dr.StaffID, dr.OutDate, dr.ReturnDate,
  dr.CustomerID,  dc.DFName,  dc.DLName, dc.Phone#, dc.Email
  FROM dbo.RentalContract dr
  INNER JOIN dbo.Customer dc
  ON dr.CustomerID = dc.CustomerID;

SELECT * FROM vwRentalContractInfo;

/* Allow service staff to anticipate repair materials for damaged cars*/
CREATE VIEW vwDamagedCarInfo
 AS
  SELECT 
  dsr.Service#,
  dsd.StaffID,
  dv.Vin#, dv.Make, dv.Model, dv.BodyType, dv.Color, dv.FuelType, dv.Seats#
  FROM dbo.Service_Detail dsd
  INNER JOIN dbo.Service_Record dsr
  ON dsd.Service# = dsr.Service#
  INNER JOIN dbo.RentalContract drc
  ON dsr.Contract# = drc.Contract#
  INNER JOIN dbo.Vehicle dv
  ON drc.Vin# = dv.Vin#;

SELECT * FROM vwDamagedCarInfo;


-- Check Constraints 

/* Check whether or not a customer is qualified for appearing on the Reward table.
   When a customer's total amount due is greater than 500, he or she can get rewards from now on. 
*/

CREATE FUNCTION CheckCustomersAndRewards
(@InputCustomerID INT)
RETURNS INT 
AS 
BEGIN
	DECLARE @TotalAmountDue INT;
	SET @TotalAmountDue = 0; 
	SELECT @TotalAmountDue = SUM(rc.AmountDue) 
	FROM dbo.RentalContract rc
	WHERE rc.CustomerID = @InputCustomerID;
	RETURN @TotalAmountDue; 
END

ALTER TABLE dbo.Reward 
ADD CONSTRAINT CheckRewards  
CHECK (dbo.CheckCustomersAndRewards(CustomerID) > 500)


/* Check customers and their total charges.
   If a customer's total charge is less than the amountdue in the transaction, he or she is not allowed to rent cars. 
*/

CREATE FUNCTION CheckTotalCharge
(@InputTotalCharge FLOAT,@InputAmountDue FLOAT)
RETURNS FLOAT 
AS 
BEGIN 
	DECLARE @CheckResult FLOAT;
	SET @CheckResult = 0.0;
	SELECT @CheckResult = @InputTotalCharge - @InputAmountDue;
	RETURN @CheckResult; 
END

ALTER TABLE dbo.RentalContract  
ADD CONSTRAINT CheckCustomerTotalCharge  
CHECK (dbo.CheckTotalCharge(TotalCharge, AmountDue) >= 0.0)

/* Check vehicles.
   If a vehicle had a history of being ruined no less than ten times, it can not be rented continually.
*/

CREATE FUNCTION CountVehicleDamageTimes
(@InputVin# VARCHAR(17))
RETURNS INT
AS
BEGIN
	DECLARE @DamageTimes INT;
	SET @DamageTimes = 0;
    SELECT @DamageTimes = COUNT(d.Report#)
    FROM dbo.RentalContract rc 
    INNER JOIN dbo.Damage d 
    ON rc.Contract# = d.Contract#
    WHERE rc.Vin# = @InputVin#;
    RETURN @DamageTimes;
END

ALTER TABLE dbo.RentalContract  
ADD CONSTRAINT CheckVehicleDamageTimes  
CHECK (dbo.CountVehicleDamageTimes(Vin#) < 10)
 

/* Check service staff. 
   A staff can not play the dual roles of both service staff and office staff.
*/
CREATE FUNCTION EnsureServiceStaff
(@InputStaffID INT)
RETURNS INT 
AS 
BEGIN 
	DECLARE @CheckResult INT; 
	SET @CheckResult = 0;
	SELECT @CheckResult = COUNT(os.StaffID)
	FROM dbo.Office_Staff os
    WHERE os.StaffID = @InputStaffID;
	RETURN @CheckResult;
END

ALTER TABLE dbo.Service_Staff  
ADD CONSTRAINT CheckServiceStaff  
CHECK (dbo.EnsureServiceStaff(StaffID) = 0)


/* Check office staff. 
   A staff can not play the dual roles of both service staff and office staff.
*/

CREATE FUNCTION EnsureOfficeStaff
(@InputStaffID INT)
RETURNS INT 
AS 
BEGIN 
	DECLARE @CheckResult INT; 
	SET @CheckResult = 0;
	SELECT @CheckResult = COUNT(ss.StaffID) 
	FROM dbo.Service_Staff ss
	WHERE ss.StaffID = @InputStaffID;
	RETURN @CheckResult;
END

ALTER TABLE dbo.Office_Staff  
ADD CONSTRAINT CheckOfficeStaff  
CHECK (dbo.EnsureOfficeStaff(StaffID) = 0)


-- Computed Columns 

/* Create a computed column [Comment] in the Office_Staff table.
   An office staff's comment is based on the total amount due of all of his or her contracts.
*/

CREATE FUNCTION CommentOnOfficeStaff
(@InputStaffID INT)
RETURNS VARCHAR(20)
AS 
BEGIN
    DECLARE @TotalAmountDue FLOAT; 
    SET @TotalAmountDue = 0.0;
    SELECT @TotalAmountDue = SUM(rc.AmountDue)
    FROM dbo.RentalContract rc
    WHERE rc.StaffID = @InputStaffID;
    IF @TotalAmountDue > 1000.0
        RETURN 'Good Job!'; 
    RETURN 'Come On!';
END

ALTER TABLE dbo.Office_Staff
ADD [Comment] AS dbo.CommentOnOfficeStaff(StaffID)

/* Create a computed column [AverageAmountDue] in the Customer table.*/

CREATE FUNCTION AverageAmountDue
(@InputCustomerID INT)
RETURNS FLOAT 
AS 
BEGIN 
	DECLARE @AverageAmountDue FLOAT ;
    SET @AverageAmountDue = 0.0;
	SELECT @AverageAmountDue = AVG(rc.AmountDue)  
	FROM dbo.RentalContract rc 
	WHERE rc.CustomerID = @InputCustomerID;
    RETURN @AverageAmountDue;
END

ALTER TABLE dbo.Customer 
ADD [AverageAmountDue] AS dbo.AverageAmountDue(CustomerID)

/* Created a computed column [Popularity] in the Vehicle table.
   The popularity of a vehicle is determined by the number of contracts where it was rented.
   The greater the popularity is, the more welcomed it is in the car renting market.  
*/

CREATE FUNCTION VehiclePopularity
(@InputVin# VARCHAR(17))
RETURNS INT
AS 
BEGIN 
	DECLARE @Rank INT;
    SET @Rank = 0;
    SELECT @Rank = Ranks 
    FROM 
    (SELECT DISTINCT rc.Vin# AS Vin#
            ,DENSE_RANK() OVER(ORDER BY COUNT(rc.Contract#)) AS Ranks
    FROM dbo.RentalContract rc
    GROUP BY rc.Vin#) AS temp
    WHERE Vin# = @InputVin#;
    RETURN @Rank
END


ALTER TABLE dbo.Vehicle 
ADD [Popularity] AS dbo.VehiclePopularity(Vin#)

insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (453162, '1HGCP2F34AA328122', 5308919, 7672081, 4153474, 92.00, '2022-01-02', '2022-4-12', 880.00, 880.00);

/* Create a computed column [PreferMakes] in the Customer table.
   Display a customer's favorite brands of rented cars according to all of his or her renting records. 
 */
CREATE FUNCTION PreferMakes
(@InputCustomerID INT)
RETURNS VARCHAR(MAX) 
AS 
BEGIN 
	DECLARE @Preferences VARCHAR(MAX);
    SELECT @Preferences = STRING_AGG(CONVERT(VARCHAR(MAX),v.Make), ', ') 
    FROM 
    (SELECT rc.CustomerID
            ,rc.Vin#
            ,RANK() OVER(PARTITION BY rc.CustomerID ORDER BY COUNT(rc.Contract#) DESC) AS Ranks
    FROM dbo.RentalContract rc
    GROUP BY rc.CustomerID,rc.Vin#) AS temp
    INNER JOIN dbo.Vehicle v
    ON temp.Vin# = v.Vin#
    WHERE temp.CustomerID = @InputCustomerID
    AND temp.Ranks = 1;
    RETURN @Preferences  
END

ALTER TABLE dbo.Customer  
ADD [PreferMakes] AS dbo.PreferMakes(CustomerID)

insert into RentalContract (Contract#, Vin#, CustomerID, StaffID, Insurance#, Price, OutDate, ReturnDate, TotalCharge, AmountDue) values (383162, '1HGCP2F34AA328122', 1026385, 7672081, 4153474, 102.00, '2021-11-02', '2021-12-12', 790.00, 790.00);


/* Create a computed column [Protection] in the Customer table.
   In order to display customers' protection behaviors on rented car.
   If a customer destroyed the rented car more than two times, his or her protection behavior will be considered as 'Poor'.  
*/
CREATE FUNCTION Protection
(@InputCustomerID INT)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @DamageTimes INT;
	SET @DamageTimes = 0;
    SELECT @DamageTimes = COUNT(d.Report#)
    FROM dbo.RentalContract rc 
    INNER JOIN dbo.Damage d 
    ON rc.Contract# = d.Contract#
    WHERE rc.CustomerID = @InputCustomerID;
    IF @DamageTimes > 2
        RETURN 'Poor';
    RETURN 'Good';
END 

ALTER TABLE dbo.Customer 
ADD [Protection] AS dbo.Protection(CustomerID)


/* Create a computed column [Life] in the Vehicle table.
   The life of a car can be defined as the period from the year when it was produced to the current year.
   The life of a car is vital for the car company to determine whether the car should be rent to customers continually or not. 
*/

CREATE FUNCTION GetLife 
(@InputVin# VARCHAR)
RETURNS INT
AS
BEGIN
    DECLARE @life INT;
    SET @life = 0; 
    SELECT @life = YEAR(GETDATE()) - CAST(v.ProduceYear AS INT)
    FROM dbo.Vehicle v
    WHERE v.Vin# = @InputVin#;
    RETURN @life;
END

alter table dbo.Vehicle drop column Life

ALTER TABLE dbo.Vehicle 
ADD [Life] AS (YEAR(GETDATE()) - CAST(ProduceYear AS INT))


















	
