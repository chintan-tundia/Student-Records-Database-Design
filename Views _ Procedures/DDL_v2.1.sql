CREATE SCHEMA placementmanagement;

SET search_path TO placementmanagement;

CREATE TABLE program
(
  programid integer,
  programname varchar(20),
  CONSTRAINT program_pkey PRIMARY KEY (programid)
);

CREATE TABLE student
(
  studentid numeric(9,0) NOT NULL,
  fname varchar(20) NOT NULL,
  minit varchar(1) DEFAULT '-',
  lname varchar(20) DEFAULT '-',
  batch varchar(10),
  gender varchar(6) DEFAULT '-',
  cpi numeric(3,1) DEFAULT 0.0,
  programid integer DEFAULT 0,
  CONSTRAINT student_pkey PRIMARY KEY (studentid),
  CONSTRAINT student_programid_fkey FOREIGN KEY (programid)
      REFERENCES program (programid) 
      ON UPDATE CASCADE ON DELETE SET DEFAULT
);



CREATE TABLE course
(
  courseno varchar(7),
  coursename varchar(20),
  credits double precision,
  CONSTRAINT course_pkey PRIMARY KEY (courseno)
);

CREATE TABLE instructor
(
  instructorid varchar(5),
  instructorname varchar(20),
  CONSTRAINT instructor_pkey PRIMARY KEY (instructorid)
);

CREATE TABLE offers
(
  courseno varchar(7),
  acadyear numeric(4,0) NOT NULL,
  season varchar(8) NOT NULL,
  instructorid varchar(5) NOT NULL,
  CONSTRAINT offers_pkey PRIMARY KEY (courseno, acadyear, season),
  CONSTRAINT offers_season_check CHECK (season IN ('Autumn','Winter','Summer')),
  CONSTRAINT offers_acadyear_check CHECK (acadyear <= EXTRACT(year FROM now())),
  CONSTRAINT offers_courseno_fkey FOREIGN KEY (courseno)
      REFERENCES course (courseno)
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT offers_instructorid_fkey FOREIGN KEY (instructorid)
      REFERENCES instructor (instructorid)
      ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE registers
(
  studentid numeric(9,0) NOT NULL,
  courseno varchar(10) NOT NULL,
  acadyear numeric(4,0) NOT NULL,
  season varchar(8) NOT NULL,
  grade varchar(2) DEFAULT '-',
  CONSTRAINT registers_pkey PRIMARY KEY (studentid, courseno, acadyear, season),
  CONSTRAINT registers_acadyear_fkey FOREIGN KEY (acadyear, season, courseno)
      REFERENCES offers (acadyear, season, courseno) 
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT registers_studentid_fkey FOREIGN KEY (studentid)
      REFERENCES student (studentid)
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE result
(
  studentid numeric(9,0) NOT NULL,
  academicyear numeric(4,0) NOT NULL,
  season varchar(8) NOT NULL,
  spi numeric(3,1) DEFAULT 0.0,
  CONSTRAINT result_pkey PRIMARY KEY (studentid, academicyear, season),
  CONSTRAINT result_studentid_fkey FOREIGN KEY (studentid)
      REFERENCES student (studentid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


-- ACAD Schema Finished
-- Placement Schema Starts form here
CREATE TABLE applicant
(
  applicantid numeric(9,0) NOT NULL,
  resume text DEFAULT '-',
  CONSTRAINT applicant_pkey PRIMARY KEY (applicantid),
  CONSTRAINT applicant_applicantid_fkey FOREIGN KEY (applicantid)
      REFERENCES student (studentid)
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE company
(
  companyid varchar(5) NOT NULL,
  companyname varchar(50),
  companytype varchar(10),
  website text,
  contactno varchar(15),
  CONSTRAINT company_companytype_check CHECK (companytype IN ('Dream','Niche','Regular')),
  CONSTRAINT company_pkey PRIMARY KEY (companyid)
);

CREATE TABLE job
(
  jobofferid varchar(15),
  companyid varchar(5) NOT NULL,
  jobprofile text DEFAULT '-',
  todate date,
  fromdate date,
  vacancies numeric(4,0) CHECK (vacancies > 0),
  packageamount bigint CHECK (packageamount > 0.0),
  jobtype varchar(20) DEFAULT '-',
  place varchar(20) DEFAULT '-',
  CONSTRAINT job_pkey PRIMARY KEY (jobofferid),
  CONSTRAINT job_companyid_fkey FOREIGN KEY (companyid)
      REFERENCES company (companyid) 
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE application
(
  applicationid numeric(10,0) NOT NULL,
  jobofferid varchar(15) NOT NULL,
  approved boolean DEFAULT FALSE,
  CONSTRAINT application_pkey PRIMARY KEY (applicationid, jobofferid),
  CONSTRAINT application_applicationid_fkey FOREIGN KEY (applicationid)
      REFERENCES applicant (applicantid)
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE placementcell
(
  da_id numeric(9,0) NOT NULL,
  membername varchar(20) NOT NULL,
  designation varchar(20) NOT NULL,
  contactno varchar(15) DEFAULT '-',
  CONSTRAINT placementcell_pkey PRIMARY KEY (da_id)
);

CREATE TABLE qualification
(
  applicantid numeric(9,0) NOT NULL,
  qualifyingexam varchar(20) NOT NULL,
  affiliation varchar(30) DEFAULT '-',
  passingyear numeric(4,0) DEFAULT 0,
  grade varchar(2) DEFAULT '-',
  CONSTRAINT qualification_pkey PRIMARY KEY (applicantid, qualifyingexam),
  CONSTRAINT qualification_applicantid_fkey FOREIGN KEY (applicantid)
      REFERENCES student (studentid)
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE qualificationrequirement
(
  jobofferid varchar(15) NOT NULL,
  qualification varchar(20) NOT NULL,
  grade varchar(2) DEFAULT '-',
  CONSTRAINT qualificationrequirement_pkey PRIMARY KEY (jobofferid, qualification),
  CONSTRAINT qualificationrequirement_jobofferid_fkey FOREIGN KEY (jobofferid)
      REFERENCES job (jobofferid)
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE round
(
  jobofferid varchar(15) NOT NULL,
  roundname varchar(30) NOT NULL,
  round_type varchar(20),
  roundorder numeric(2,0),
  description text DEFAULT '-',
  venue text DEFAULT '-',
  rounddate date,
  roundtime time without time zone,
  CONSTRAINT round_pkey PRIMARY KEY (jobofferid, roundname),
  CONSTRAINT round_jobofferid_fkey FOREIGN KEY (jobofferid)
      REFERENCES job (jobofferid) 
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE coordinates
(
  da_id numeric(9,0) NOT NULL,
  jobofferid varchar(15) NOT NULL,
  roundname varchar(30) NOT NULL,
  CONSTRAINT coordinates_pkey PRIMARY KEY (da_id, jobofferid, roundname),
  CONSTRAINT coordinates_jobofferid_fkey FOREIGN KEY (jobofferid)
      REFERENCES job (jobofferid) 
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE participates
(
  applicantid numeric(9,0),
  jobofferid varchar(15),
  roundname varchar(30),
  status boolean DEFAULT FALSE,
  CONSTRAINT participates_pkey PRIMARY KEY (applicantid,jobofferid,roundname),
  CONSTRAINT participates_applicantid_fkey FOREIGN KEY (applicantid)
      REFERENCES applicant (applicantid) 
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT participates_jobofferid_fkey FOREIGN KEY (jobofferid, roundname)
      REFERENCES round (jobofferid, roundname)
     ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE applicationyear
(
  applicantid numeric(9,0),
  applicationyear numeric(9,0),
  CONSTRAINT applicationyear_pkey PRIMARY KEY (applicantid,applicationyear),
  CONSTRAINT applicationyear_applicantid_fkey FOREIGN KEY (applicantid)
      REFERENCES applicant (applicantid) 
      ON UPDATE CASCADE ON DELETE CASCADE

);

CREATE TABLE hires
(
  applicantid numeric(9,0),
  jobofferid varchar(15),
  hiredate date,
  negotiatedpackage bigint CHECK (negotiatedpackage > 0.0),
  CONSTRAINT hires_pkey PRIMARY KEY (applicantid,jobofferid),
  CONSTRAINT hires_applicantid_fkey FOREIGN KEY (applicantid)
      REFERENCES applicant (applicantid) 
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT hires_jobofferid_fkey FOREIGN KEY (jobofferid)
      REFERENCES job (jobofferid)
     ON UPDATE CASCADE ON DELETE CASCADE
);





