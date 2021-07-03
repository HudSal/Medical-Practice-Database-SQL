--TASK :01--PART: 02
--1.	List the first name and last name of female patients who live in St Kilda or Lidcombe.
Select *
From Patient
Go

SELECT FirstName,LastName
FROM Patient
WHERE Gender='female' AND Suburb IN ('St Kilda','Lidcombe')
Go
--TASK :02 --PART: 02
--2.	List the first name, last name, state and Medicare Number of any patients who do not live in NSW.
SELECT FirstName,LastName,State,MedicareNumber
FROM Patient
WHERE State !='NSW'
Go
--TASK :03 --PART: 02
--3.	For patients who have had pathology test requests, list the practitioner's and patient's first and last names,
--the date and time that the pathology tests were ordered and the name of the pathology test.
SELECT pr.FirstName Practitioner_FIRSTNAME, pr.LastName Practitioner_LASTNAME,
pa.FirstName Patient_FIRSTNAME ,pa.LastName Patient_LASTNAME, DateOrdered, TimeOrdered, TestName
FROM PathTestReqs pt,Patient pa,Practitioner pr,TestType t
WHERE pt.Practitioner_Ref=pr.Practitioner_ID
AND pt.Patient_Ref= pa.Patient_ID
AND pt.Test_Ref=t.Test_Code
Go
--TASK: 04 -- PART: 02
--4.  List the Patient's first name, last name and the appointment date and time, 
--for all appointments held on the 18/09/2019 by Dr Anne Funsworth.
SELECT pa.FirstName Patient_FIRSTNAME ,pa.LastName Patient_LASTNAME,AppDate,AppStartTime
FROM Appointment,Patient pa,Practitioner pr
WHERE Patient_Ref = pa.Patient_ID
AND Practitioner_Ref = pr.Practitioner_ID
AND AppDate='2019-09-18'
AND pr.FirstName='Anne'
GO
--TASK: 05 -- PART: 02
--5.	List each Patient's first name, last name, Medicare Number and their date of birth.
--Sort the list by date of birth, listing the youngest patients first.
SELECT FirstName, LastName, MedicareNumber, DateOfBirth
FROM Patient
ORDER BY DateOfBirth DESC
GO
--TASK: 06 -- PART: 02
--6.	For each pathology test request, list the test code, the test name the date and time that the test was ordered.
--Sort the results by the date the test was ordered and then by the time that it was ordered.
SELECT Test_Code,TestName,DateOrdered,TimeOrdered
FROM PathTestReqs,TestType
WHERE Test_Code=Test_Ref
ORDER BY DateOrdered,TimeOrdered
GO
--TASK: 07 -- PART: 02
--7.	List the ID and date of birth of any patient who has not had an appointment and was born before 1950.
SELECT DISTINCT Patient_ID, DateOfBirth
FROM Patient,Appointment
WHERE Patient_ID != Patient_Ref
AND (DatePart (YEAR,DateOfBirth) < '1950')
GO
--TASK: 08 -- PART: 02
--8.	List the patient ID, last name and date of birth of all male patients born between 1962 and 1973 (inclusive).
SELECT Patient_ID, LastName, DateOfBirth
FROM Patient
WHERE Gender='male'
AND DateOfBirth BETWEEN '1962' AND '1973'
GO
--TASK: 09 -- PART: 02
--9 List the patient ID, first name and last name of any male patients who have had appointments with either Dr Huston or Dr Vergenargen.
SELECT Patient_ID, pa.FirstName, pa.LastName
FROM Patient pa,Appointment,Practitioner pr
WHERE Patient_ID = Patient_Ref
AND Practitioner_ID=Practitioner_Ref
AND pa.Gender='male'
AND (pr.LastName='Huston' OR pr.LastName='Vergenargen')
GO
--TASK: 10 -- PART: 02
--10.	List the practitioner ID, first name, last name and practitioner type of each practitioner,
--and the number of days of the week that they are available.
SELECT  Practitioner_ID, FirstName, LastName, PractitionerType_Ref, Count(WeekDayName_Ref) as 'Number of Work Days Weekly'
FROM Availability,Practitioner
WHERE Practitioner_ID = Practitioner_Ref
GROUP by Practitioner_ID, FirstName,LastName,PractitionerType_Ref
GO
--TASK: 11 -- PART: 02
--11-List the patient ID, first name, last name and the number of appointments for patients who have had at least three appointments.
SELECT Patient_ID,FirstName,LastName, COUNT(AppDate) as 'Number of Appointments'
FROM Patient,Appointment
WHERE Patient_ID=Patient_Ref
GROUP BY Patient_ID,FirstName,LastName
HAVING COUNT(AppDate) >=3
GO
--TASK: 12 -- PART: 02
--12.	List the first name, last name, gender, and the number of days since the last appointment of each patient and the 23/09/2019.
SELECT FirstName,LastName,Gender, DateDiff (DAY,AppDate,'2019-09-23') As 'number of days from the last appointment date until 23/09/2019'
FROM Patient,Appointment
WHERE Patient_ID= Patient_Ref
GO
--TASK: 13 -- PART: 02
--13.For each practitioner, list their ID, first name, last name and the total number of hours worked each week at the Medical Practice. 
--Assume a nine-hour working day and that practitioners work the full nine hours on each day that they're available.
SELECT  Practitioner_ID, FirstName, LastName, 9*Count(WeekDayName_Ref) as 'Number of Hours Worked Weekly'
FROM Availability,Practitioner
WHERE Practitioner_ID = Practitioner_Ref
GROUP by Practitioner_ID, FirstName,LastName
GO
--TASK: 14 -- PART: 02
--14.	List the full name and full address of each practitioner in the following format exactly.
--Dr Mark P. Huston. 21 Fuller Street SUNSHINE, NSW 2343
--Make sure you include the punctuation and the suburb in upper case.
SELECT Title+' '+FirstName+' '+MiddleInitial+'. '+LastName+'. '+HouseUnitLotNum+' '+Street+' '+ UPPER(Suburb)+', '+State+' '+PostCode as FULL_ADDRESS
FROM Practitioner
Go
--TASK: 15 -- PART: 02
--15.	List the date of birth of the female practitioner named Leslie Gray in the following format exactly:
--Saturday, 11 March 1989
SELECT FORMAT (DateOfBirth, 'dddd, dd MMMM yyyy') 
FROM Practitioner
WHERE FirstName='Leslie' AND Gender='female'
GO
--TASK: 16 -- PART: 02
--16.	List the patient id, first name, last name and date of birth of the fifth oldest patient(s).
Select Patient_ID, FirstName, LastName, DateOfBirth
from Patient
where DateOfBirth = (
Select DateOfBirth
from
(
Select ROW_NUMBER() over (order by DateOfBirth asc) as Row, *
from Patient
) as FindDateOfBirthOfSpecifiedRow
Where Row = 5
)
GO
--TASK: 17 -- PART: 02
--17.List the patient ID, first name, last name, appointment date (in the format 'Tuesday 17 September, 2019') 
--and appointment time (in the format '14:15 PM') for all patients who have had appointments on any Tuesday after 10:00 AM.
SELECT Patient_ID,FirstName,LastName, FORMAT (AppDate, 'dddd dd MMMM, yyyy') as Appointment_Date,
FORMAT (Convert(datetime, AppStartTime), 'HH:mm tt')as Appointment_Time
FROM Patient,Appointment
WHERE Patient_ID=Patient_Ref
AND DATENAME(weekday,AppDate)='Tuesday'
AND AppStartTime >='10:00'
GO
--TASK: 18 -- PART: 02
--18.	Calculate and list the number of hours and minutes between Joan Wothers' 8:00 AM appointment on 17/09/2019 and 
--Terrence Hill's 2:15 PM appointment on that same day with Dr Ludo Vergenargen. Format the result in the following format:
--5 hrs 35 mins 
Select CAST(DATEDIFF(Hour, AppTimeOne.AppStartTime, AppTimeTwo.AppStartTime) as varchar)
+ ' hrs '
+ CAST(DATEDIFF(Minute, AppTimeOne.AppStartTime, AppTimeTwo.AppStartTime)
- (DATEDIFF(Hour, AppTimeOne.AppStartTime, AppTimeTwo.AppStartTime) * 60) as varchar)
+ ' mins'
as TimeBetweenAppointments
from
(SELECT AppStartTime
FROM Patient,Appointment
WHERE Patient_ID=Patient_Ref
AND FirstName='Joan' AND LastName='Wothers' AND AppDate='2019-09-17' AND AppStartTime='8:00'
) as AppTimeOne,
(SELECT AppStartTime
FROM Patient,Appointment
WHERE Patient_ID=Patient_Ref
AND FirstName='Terrence' AND LastName='Hill' AND AppDate='2019-09-17' AND AppStartTime='14:15'
) as AppTimeTwo
GO

--TASK: 19 -- PART: 02
--19.	List the age difference in years between the youngest patient and the oldest patient in the following format:
--The age difference between our oldest and our youngest patient is 76 years.

SELECT 'The age difference between our oldest and our youngest patient is ' 
+ CAST( DATEDIFF(YEAR,MIN(DateOfBirth), MAX(DateOfBirth)) as varchar )+ ' years'
From Patient
GO