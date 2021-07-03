Use MedicalPractice
Go

-- Populate Patient Table:(11 Rows)
INSERT INTO Patient( Title, FirstName, MiddleInitial, LastName, HouseUnitLotNum, Street, Suburb, State, PostCode, HomePhone, MobilePhone, MedicareNumber, DateOfBirth, Gender)
VALUES( 'Mr', 'Mackenzie', 'J', 'Fleetwood', '233', 'Dreaming Street', 'Roseville', 'NSW', '2069', '0298654743', '0465375486', '7253418356478253', '2000-03-12', 'male'),
('Ms', 'Jane', 'P', 'Killingsworth', '34', 'Southern Road', 'Yarramundi', 'NSW', '2753', '0234654345', '0342134679', '9365243640183640', '1943-04-08', 'female'),
('Mr', 'Peter', 'D', 'Leons', '21', 'Constitution Drive', 'West Hoxton', 'NSW', '2171', '0276539183', '0125364927', '1873652945578932', '1962-07-08', 'male'),
('Mr', 'Phill', 'B', 'Greggan', '42', 'Donn Lane', 'Killara', 'NSW', '2071', '0276548709', '1234326789', '6473645782345678', '1971-08-31', 'male'),
('Dr', 'John', 'W', 'Ward', '332', 'Tomorrow Road', 'Chatswood', 'NSW', '2488', '4847383848', '4838382728', '4738294848484838', '1978-02-12', 'male'),
('Mrs', 'Mary', 'D', 'Brown', 'Lot23', 'Johnston Road', 'Warwick Farm', 'NSW', '2170', '0297465243', '0417335224', '9356273321176546', '1972-03-05', 'female'),
('Mr', 'Terrence', 'D', 'Hill', '43', 'Somerland Road', 'La Perouse', 'NSW', '2987', '0266645432', '0365243561', '6363525353535356', '2005-10-04', 'male'),
('Master', 'Adrian', 'B', 'Tamerkand', '44', 'The Hill Road', 'Macquarie Fields', 'NSW', '2756', '0276546783', '4848473738', '9863652527637332', '2008-12-12', 'male'),
('Ms', 'Joan', 'D', 'Wothers', '32', 'Slapping Street', 'Mount Lewis', 'NSW', '2343', '1294848777', '8484737384', '9484746125364765', '1997-06-12', 'female'),
('Mrs', 'Caroline', 'J', 'Barrette', '44', 'Biggramham Road', 'St Kilda', 'VIC', '4332', '0384736278', '9383827373', '1234565725463728', '1965-04-04', 'female'),
('Mrs', 'Wendy', 'J', 'Pilington', '182', 'Parramatta Road', 'Lidcombe', 'NSW', '2345', '4837383848', '8473838383', '8483727616273838', '1985-09-17', 'female');
Go

-- Populate Practitioner Table:(10 Rows)
INSERT INTO Practitioner( MedicalRegistrationNumber, Title, FirstName, MiddleInitial, LastName, HouseUnitLotNum, Street, Suburb, State, PostCode, HomePhone, MobilePhone, MedicareNumber, DateOfBirth, Gender, PractitionerType_Ref)
VALUES('63738276173', 'Dr', 'Mark', 'P', 'Huston', '21', 'Fuller Street', 'Sunshine', 'NSW', '2343', '0287657483', '0476352638', '9878986473892753', '1975-07-07', 'male', 'Medical Practitioner (Doctor or GP)'),
('37876273849', 'Mrs', 'Hilda', 'D', 'Brown', '32', 'Argyle Street', 'Bonnels Bay', 'NSW', '2264', '0249756544', '0318466453', '4635278435099921', '1993-12-03', 'female', 'Registered nurse'),
('48372678939', 'Mrs', 'Jennifer', 'J', 'Dunsworth', '45', 'Dora Street', 'Morriset', 'NSW', '2264', '0249767574', '0228484373', '7666777833449876', '1991-06-04', 'female', 'Registered nurse'),
('12345678901', 'Mr', 'Jason', 'D', 'Lithdon', '43', 'Fowler Street', 'Camperdown', 'NSW', '2050', '0298785645', '0317896453', '0487736265377777', '1989-08-09', 'male', 'nurse'),
('84763892834', 'Ms', 'Paula', 'D', 'Yates', '89', 'Tableton Road', 'Newtown', 'NSW', '2051', '0289876432', '0938473625', '6637474433222881', '1982-09-07', 'female', 'Midwife'),
('84737626673', 'Dr', 'Ludo', 'V', 'Vergenargen', '27', 'Pembleton Place', 'Redfern', 'NSW', '2049', '9383737627', '8372727283', '8484737626278884', '1986-05-15', 'male', 'Medical Practitioner (Doctor or GP)'),
('36271663788', 'Dr', 'Anne', 'D', 'Funsworth', '4/89', 'Pacific Highway', 'St Leonards', 'NSW', '2984', '8847362839', '8372688949', '8477666525173738', '1991-12-11', 'female', 'Psychologist'),
('05958474636', 'Mrs', 'Leslie', 'V', 'Gray', '98', 'Dandaraga Road', 'Mirrabooka', 'NSW', '2264', '4736728288', '4837726789', '4847473737277276', '1989-03-11', 'female', 'Podiatrist'),
('63635245256', 'Dr', 'Adam', 'J', 'Moody', '35', 'Mullabinga Way', 'Brightwaters', 'NSW', '2264', '8476635678', '2736352536', '7473636527771183', '1990-09-23', 'male', 'Medical practitioner (Doctor or GP)'),
('38277121234', 'Mr', 'Leslie', 'Y', 'Gray', '3', 'Dorwington Place', 'Enmore', 'NSW', '2048', '8473763678', '4484837289', '3827284716390987', '1991-04-11', 'male', 'nurse');
Go

-- Populate PractitionerType Table:(15 Rows)
INSERT INTO PractitionerType(PractitionerType)
VALUES('Diagnostic radiographer'),
('Enrolled nurse'),
('Medical Practitioner (Doctor or GP)'),
('Medical radiation practitioner'),
('Midwife'),
('Nurse'),
('Occupational therapist'),
('Optometrist'),
('Osteopath'),
('Physical therapist'),
('Physiotherapist'),
('Podiatrist'),
('Psychologist'),
('Radiation therapist'),
('Registered nurse');
Go

-- Populate WeekDays Table: (5 Rows)
INSERT INTO WeekDays(WeekDayName)
VALUES ('Friday'), ('Monday'), ('Thursday'), ('Tuesday'), ('Wednesday');
Go

--Populate Availability Table ( 20 Rows)--
INSERT INTO Availability (Practitioner_Ref,WeekDayName_Ref)
VALUES (10000, 'Friday'), (10000, 'Monday'), (10000, 'Wednesday'), (10001, 'Thursday'), (10001, 'Tuesday'), (10002, 'Thursday'),
(10002, 'Tuesday'), (10003, 'Friday'), (10003, 'Monday'), (10003, 'Wednesday'), (10004, 'Friday'), (10004, 'Monday'), (10005, 'Thursday'),
(10005, 'Tuesday'), (10006, 'Wednesday'), (10007, 'Thursday'), (10007, 'Tuesday'), (10008, 'Friday'), (10008, 'Monday'),(10008, 'Wednesday');
Go

--Populate Appointment Table (20 Rows)--
INSERT INTO Appointment(Practitioner_Ref, AppDate, AppStartTime, Patient_Ref)
VALUES (10005, '2019-09-17', '08:15:00', 10000),
(10006, '2019-09-18', '10:00:00', 10000),
(10006, '2019-09-18', '10:15:00', 10000),
(10006, '2019-09-18', '10:30:00', 10000),
(10006, '2019-09-18', '10:45:00', 10000),
(10006, '2019-09-18', '11:00:00', 10000),
(10005, '2019-09-17', '09:00:00', 10002),
(10000, '2019-09-18', '08:00:00', 10003),
(10005, '2019-09-17', '08:30:00', 10005),
(10000, '2019-09-18', '08:30:00', 10005),
(10005, '2019-09-17', '14:15:00', 10006),
(10008, '2019-09-18', '08:30:00', 10006),
(10005, '2019-09-17', '08:00:00', 10008),
(10002, '2019-09-17', '08:30:00', 10008),
(10005, '2019-09-18', '08:00:00', 10008),
(10005, '2019-09-17', '10:00:00', 10009),
(10001, '2019-09-17', '08:00:00', 10010),
(10005, '2019-09-17', '10:15:00', 10010),
(10008, '2019-09-18', '08:00:00', 10010),
(10006, '2019-09-18', '09:30:00', 10010);
Go

--Populate TestType Table: (7 Rows)
INSERT INTO TestType(Test_Code, TestName, Description)
VALUES('CPEP', 'C Peptide', 'C-Peptide; CPEP'),
('ECH', 'Echis Time', 'Ecarin time'),
('ENT', 'Ear, Nose, Throat, Eye Swab', 'includes gram stain (except throat swab) and bacterial culture. Contact screening for Corynebacterium'),
('HLYSN', 'ABO', 'Haemolysins (serum)'),
('IMISC', 'Paraneoplastic', 'Paraneoplastic Pemphigus Antibodies [NOTE: Authorisation required from an Immunopathologist]'),
('MOLINT', 'Deafness', 'Autosomal Recessive, Complete GJB2 Gene Sequencing Analysis Connexin 26; CX26; CXB2; Recessive Autosomal Deafness; Autosomal Deafness; Hereditary Deafness; GJB2; DFNB1; Nonsyndromic Neurosensory Deafness; Neurosensory Deafness Type I'),
('RAST', 'Radioallergosorbent Test', 'RAST; IgE RAST; Allergen Screen; Radioimmunosorbent Assay of Allergens; Allergen-Specific IgE; Aspergillus RAST, Specific IgE; Ig to specific allergens'
);
Go

--Populate PathTestReqs Table: (4 Rows)--
INSERT INTO PathTestReqs(Practitioner_Ref, DateOrdered, TimeOrdered, Patient_Ref, Test_Ref)
VALUES(10005, '2019-09-17', '10:30:00', 10010, 'HLYSN'),
(10005, '2019-09-18', '08:15:00', 10008, 'RAST'),
(10006, '2019-09-18', '10:30:00', 10000, 'HLYSN'),
(10008, '2019-09-18', '08:15:00', 10010, 'IMISC');
Go