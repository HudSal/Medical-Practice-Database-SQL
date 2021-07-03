USE master
GO

CREATE DATABASE MedicalPractice;
Go

USE MedicalPractice
Go 

-- Table: Patient
CREATE TABLE Patient (
    Patient_ID int  NOT NULL IDENTITY(10000, 1),
    Title NVARCHAR(20),
    FirstName NVARCHAR(50)  NOT NULL,
    MiddleInitial NCHAR(1),
    LastName NVARCHAR(50)  NOT NULL,
	HouseUnitLotNum NVARCHAR(5) NOT NULL,
	Street NVARCHAR(50) NOT NULL,
	Suburb NVARCHAR(50) NOT NULL,
	State NVARCHAR(3) NOT NULL,
	PostCode NCHAR(4) NOT NULL,
	HomePhone NCHAR(10),
	MobilePhone NCHAR(10),
	MedicareNumber NCHAR(16),
	DateOfBirth Date NOT NULL,
	Gender NCHAR(20) NOT NULL,
    CONSTRAINT Patient_PK PRIMARY KEY  (Patient_ID)
)
Go

--Table: PractitionerType--
CREATE TABLE PractitionerType(
	PractitionerType NVARCHAR(50) NOT NULL PRIMARY KEY
)
Go 

-- Table: Practitioner
CREATE TABLE Practitioner (
    Practitioner_ID int  NOT NULL IDENTITY(10000, 1),
	MedicalRegistrationNumber NCHAR(11),
    Title NVARCHAR(20),
    FirstName NVARCHAR(50)  NOT NULL,
    MiddleInitial NCHAR(1),
    LastName NVARCHAR(50)  NOT NULL,
	HouseUnitLotNum NVARCHAR(5) NOT NULL,
	Street NVARCHAR(50) NOT NULL,
	Suburb NVARCHAR(50) NOT NULL,
	State NVARCHAR(3) NOT NULL,
	PostCode NCHAR(4) NOT NULL,
	HomePhone NCHAR(10),
	MobilePhone NCHAR(10),
	MedicareNumber NCHAR(16),
	DateOfBirth Date NOT NULL,
	Gender NCHAR(20) NOT NULL,
	PractitionerType_Ref NVARCHAR(50) NOT NULL, 
    CONSTRAINT Practitioner_PK PRIMARY KEY  (Practitioner_ID),
	CONSTRAINT Practitioner_AK UNIQUE (MedicalRegistrationNumber),
	CONSTRAINT Practitioner_Type_FK FOREIGN KEY (PractitionerType_Ref) REFERENCES PractitionerType(PractitionerType)
)
Go


--Table: WeekDays--
CREATE TABLE WeekDays(
	WeekDayName NVARCHAR(9) NOT NULL PRIMARY KEY
)
Go

--Table: Availability--
CREATE TABLE Availability(
	WeekDayName_Ref NVARCHAR(9) FOREIGN KEY REFERENCES WeekDays(WeekDayName),
	Practitioner_Ref INT FOREIGN KEY REFERENCES Practitioner(Practitioner_ID),
	CONSTRAINT Availability_PK PRIMARY KEY (WeekDayName_Ref,Practitioner_Ref)
)
Go

--Table: Appointment--
CREATE TABLE Appointment(
	Practitioner_Ref INT NOT NULL,
	AppDate DATE NOT NULL,
	AppStartTime TIME NOT NULL,
	Patient_Ref INT NOT NULL,
	CONSTRAINT Appointment_AK UNIQUE (AppDate,AppStartTime,Patient_Ref),
	CONSTRAINT AppointmentPractitioner_FK FOREIGN KEY (Practitioner_Ref) REFERENCES Practitioner(Practitioner_ID),
	CONSTRAINT AppointmentPatient_FK FOREIGN KEY (Patient_Ref) REFERENCES Patient(Patient_ID),
	CONSTRAINT Appointment_PK PRIMARY KEY (Practitioner_Ref,AppDate,AppStartTime)
)
Go

--TABLE: TestType
CREATE TABLE TestType(
	Test_Code NVARCHAR(20) NOT NULL PRIMARY KEY,
	TestName NVARCHAR(200) NOT NULL,
	Description NVARCHAR(500) NOT NULL
)
Go

--TABLE: PathTestReqs--
CREATE TABLE PathTestReqs(
	Practitioner_Ref int NOT NULL FOREIGN KEY REFERENCES Practitioner(Practitioner_ID),
	DateOrdered DATE NOT NULL,
	TimeOrdered TIME NOT NULL,
	Patient_Ref INT NOT NULL FOREIGN KEY REFERENCES Patient(Patient_ID),
	Test_Ref NVARCHAR(20) NOT NULL FOREIGN KEY REFERENCES TestType(Test_Code),
	CONSTRAINT PathTestReqs_PK PRIMARY KEY (Practitioner_Ref,DateOrdered,TimeOrdered)
)
Go

