set search_path to placementmanagement
CREATE SCHEMA placementmanagemnet;

CREATE TABLE program
		(ProgramID varchar(10) Primary key,
		ProgramName varchar(20));
		
CREATE TABLE Student
		(StudentID decimal(9) Primary Key,
		FName varchar(20),
		MName varchar(10),
		LName varchar(10),
		Batch varchar(10),
		Gender varchar(10),
		CPI float,
		ProgramID varchar(10) References program(ProgramID));
		
CREATE TABLE Course
		(CourseNo varchar(10) Primary Key,
		CourseName varchar(20),
		Credits float);


drop table offers;

CREATE TABLE Offers
		(CourseNo varchar(10) References Course(CourseNo),
		AcadYear decimal(4),
		Season varchar(8),
		InstructorID varchar(10) References Instructor(InstructorID),
		Primary Key(CourseNo,Acadyear,Season));

drop table Registers;
select * from registers;

CREATE TABLE Registers
		(StudentID decimal(9) References Student(StudentID),
		CourseNo varchar(10) References Course(CourseNo),
		Acadyear decimal(4),
		Season varchar(8) ,
		Grade varchar(5),
		Primary Key(StudentId,CourseNo,Acadyear,Season),
		Foreign Key (Acadyear,Season,CourseNo) references Offers (Acadyear,Season,CourseNo));

select * from student;
select * from registers;
select * from result;
drop table result;

drop table result;


CREATE TABLE Result
		(StudentID decimal(9) References Student(StudentID),
		AcademicYear decimal(4),
		Season varchar(8),
		SPI decimal(5),
		Primary Key (StudentID,AcademicYear,Season)
		);




CREATE TABLE Instructor
		(InstructorID varchar(5) primary key,
		Name varchar(10) );

drop table applicant;

CREATE TABLE Applicant
		( ApplicantID decimal(9) references Student(studentid),
		  Resume Text,
		  Primary Key(ApplicantID)
		 );

CREATE TABLE Qualification
		( ApplicantID decimal(9) references Student(StudentID),
		  QualifyingExam varchar(20),
		  Affiliation varchar(30),
		  PassingYear decimal(4),
		  Grade varchar(5),
		  Primary Key (ApplicantID,QualifyingExam)
		 );
CREATE TABLE Job
		(JobOfferID decimal(10),
		 CompanyID decimal(10)references Company(companyID),
		 JobProfile Text,
		 ToDate Date,
		 FromFate Date,
		 Vacancies decimal(4),
		 Package_Amount int,
		 JobType varchar(20),
		 Place varchar(20),
		 Primary Key (JObOfferID));



CREATE TABLE Company
		(CompanyID decimal(10),
		 Company_Name varchar(20),
		 "Type" varchar(10),
		 Website Text,
		 ContactNo decimal(15),
		 Primary Key(CompanyId)
		 );
		 
CREATE TABLE Application
		(ApplicationID decimal(10) references Applicant(ApplicantID),
		 JobOfferID decimal(10),
		 Approved boolean,
		 Primary Key(ApplicationID,JobOfferID));


CREATE TABLE QualificationRequirement
		(JobOfferID decimal(9) references Job(JobOfferID),
		Qualification Text,
		Grade varchar(4),
		Primary Key(JobOfferID,Qualification)
		);

CREATE TABLE PlacementCell
		(Da_ID decimal(9) Primary key,
		MemberName varchar(20),
		Designation varchar(20),
		ContactNo decimal(15));


CREATE TABLE Round
		(JobOfferID decimal(9) references job(JobOfferID),
		RoundName  varchar(30),
		Round_Type varchar(20),
		"Order" decimal(2),
		Description Text,
		Venue Text,
		"Date" Date,
		"Time" Time,
		Primary Key(JobOfferID,RoundName)
		);

select * from round;

CREATE TABLE Coordinates
		( Da_ID decimal(9),
		JobOfferID decimal(9),
		RoundName varchar(30),
		Primary Key (Da_ID,JobOfferID,RoundName)
		);

CREATE TABLE Participates
		(ApplicantID decimal(10) References Applicant(ApplicantId),
		JobOfferID decimal(9),
		RoundName varchar(30),
		Status boolean,
		Foreign Key(JobOfferID,RoundName) References Round (JobOfferID,Roundname)		
		);
		

