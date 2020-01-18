set search_path to placementmanagement;


INSERT INTO program (programid,programname)
VALUES (12,'MSC-IT');
INSERT INTO program (programid,programname)
VALUES (11,'MTECH');
INSERT INTO program (programid,programname)
VALUES (01,'B-TECH');
INSERT INTO program (programid,programname)
VALUES (13,'MSC-ITARD');



INSERT INTO student (studentid,fname,minit,lname,batch,gender,programid)
VALUES(201412039,'LOKESH','G','SINGAL',2014,'M','12');


INSERT INTO student (studentid,fname,minit,lname,batch,gender,programid)
VALUES(201412054,'MOIZ','-','PALITANAWALA',2014,'M','12');


INSERT INTO student (studentid,fname,minit,lname,batch,gender,programid)
VALUES(201412006,'SOUNAK','B','BANERJEE',2014,'M','12');


INSERT INTO student (studentid,fname,minit,lname,batch,gender,programid)
VALUES(201412003,'RAVI','-','DESAI',2014,'M','12');



INSERT INTO student (studentid,fname,minit,lname,batch,gender,programid)
VALUES(201412029,'CHINTAN','-','TUNDIA',2014,'M','12');




INSERT INTO course(courseno,coursename,credits)
VALUES('IT615','Database management',4.0);

INSERT INTO course(courseno,coursename,credits)
VALUES('PC613','Communication Skills',4.0);

INSERT INTO course(courseno,coursename,credits)
VALUES('IT602','Data Structures',5.0);

INSERT INTO course(courseno,coursename,credits)
VALUES('SC612','Discrete Mathematics',4.0);

INSERT INTO course(courseno,coursename,credits)
VALUES('IT613','Computer Organiz',4.0);




INSERT INTO instructor(instructorid,instructorname)
VALUES('101','P.M. Jat');


INSERT INTO instructor(instructorid,instructorname)
VALUES('102','Gagan Garg');


INSERT INTO instructor(instructorid,instructorname)
VALUES('103','Radha Parikh');


INSERT INTO instructor(instructorid,instructorname)
VALUES('104','Rutu Parekh');


INSERT INTO instructor(instructorid,instructorname)
VALUES('105','Maitrayee mukerji');




INSERT INTO offers(courseno,acadyear,season,instructorid)
VALUES('IT615',2014,'Autumn','101');


INSERT INTO offers(courseno,acadyear,season,instructorid)
VALUES('IT613',2014,'Autumn','104');


INSERT INTO offers(courseno,acadyear,season,instructorid)
VALUES('IT602',2014,'Autumn','105');


INSERT INTO offers(courseno,acadyear,season,instructorid)
VALUES('SC612',2014,'Autumn','102');


INSERT INTO offers(courseno,acadyear,season,instructorid)
VALUES('PC613',2014,'Autumn','103');



INSERT INTO registers(studentid,courseno,acadyear,season,grade)
VALUES(201412039,'IT615',2014,'Autumn','AA');


INSERT INTO registers(studentid,courseno,acadyear,season,grade)
VALUES(201412039,'IT602',2014,'Autumn','AB');

INSERT INTO registers(studentid,courseno,acadyear,season,grade)
VALUES(201412003,'IT615',2014,'Autumn','AA');


INSERT INTO registers(studentid,courseno,acadyear,season,grade)
VALUES(201412003,'IT602',2014,'Autumn','AB');


INSERT INTO registers(studentid,courseno,acadyear,season,grade)
VALUES(201412029,'IT615',2014,'Autumn','AA');


INSERT INTO registers(studentid,courseno,acadyear,season,grade)
VALUES(201412029,'IT602',2014,'Autumn','AA');

INSERT INTO registers(studentid,courseno,acadyear,season,grade)
VALUES(201412054,'IT615',2014,'Autumn','AB');


INSERT INTO registers(studentid,courseno,acadyear,season,grade)
VALUES(201412054,'IT602',2014,'Autumn','AA');


INSERT INTO registers(studentid,courseno,acadyear,season,grade)
VALUES(201412006,'IT615',2014,'Autumn','AB');


INSERT INTO registers(studentid,courseno,acadyear,season,grade)
VALUES(201412006,'IT602',2014,'Autumn','AA');


INSERT INTO result(studentid,academicyear,season,spi)
VALUES(201412039,2014,'Autumn',8.2);


INSERT INTO result(studentid,academicyear,season,spi)
VALUES(201412003,2014,'Autumn',9.5);




INSERT INTO result(studentid,academicyear,season,spi)
VALUES(201412029,2014,'Autumn',8.9);



INSERT INTO result(studentid,academicyear,season,spi)
VALUES(201412054,2014,'Autumn',9.5);




INSERT INTO applicant(applicantid,resume)
VALUES(201412039,'abc.text');
INSERT INTO applicant(applicantid,resume)
VALUES(201412006,'abc.pdf');
INSERT INTO applicant(applicantid,resume)
VALUES(201412054,'pqr.text');
INSERT INTO applicant(applicantid,resume)
VALUES(201412003,'abc.text');
INSERT INTO applicant(applicantid,resume)
VALUES(201412029,'abc.text');


INSERT INTO company(companyid,companyname,companytype,website,contactno)
VALUES ('AMA02','AMAZON','Dream','Amazon.com','789456123');
INSERT INTO company(companyid,companyname,companytype,website,contactno)
VALUES('FLI01','FLIPKART','Dream','flipkart.com','789456123')




INSERT INTO job(jobofferid,companyid,jobprofile,todate,fromdate,vacancies,packageamount,jobtype,place)
VALUES('AMA02_201401','AMA02','Software Engineer','10-05-2014','01-05-2014',10,1250000,'BOTH','Banglore');


INSERT INTO job(jobofferid,companyid,jobprofile,todate,fromdate,vacancies,packageamount,jobtype,place)
VALUES('AMA02_201402','AMA02','Web Developer','10-05-2014','01-05-2014',10,1250000,'Internship','Banglore');


INSERT INTO job(jobofferid,companyid,jobprofile,todate,fromdate,vacancies,packageamount,jobtype,place)
VALUES('AMA02_201403','AMA02','Database Administrator','10-05-2014','01-05-2014',10,1250000,'job','Pune');


INSERT INTO job(jobofferid,companyid,jobprofile,todate,fromdate,vacancies,packageamount,jobtype,place)
VALUES('FLI01_201401','FLI01','Software Engineer','10-05-2014','01-05-2014',6,1150000,'BOTH','Banglore');


INSERT INTO job(jobofferid,companyid,jobprofile,todate,fromdate,vacancies,packageamount,jobtype,place)
VALUES('FLI01_201402','FLI01','Database Administrator ','10-05-2014','01-05-2014',4,1850000,'BOTH','Banglore');



INSERT INTO job(jobofferid,companyid,jobprofile,todate,fromdate,vacancies,packageamount,jobtype,place)
VALUES('FLI01_201403','FLI01','UI Developer','10-05-2014','01-05-2014',2,950000,'BOTH','Banglore');




INSERT INTO job(jobofferid,companyid,jobprofile,todate,fromdate,vacancies,packageamount,jobtype,place)
VALUES('AMA02_201501','AMA02','Software Engineer','10-05-2015','01-05-2015',10,1250000,'BOTH','Banglore');


INSERT INTO job(jobofferid,companyid,jobprofile,todate,fromdate,vacancies,packageamount,jobtype,place)
VALUES('AMA02_201502','AMA02','Web Developer','10-05-2015','01-05-2015',10,1250000,'Internship','Banglore');


INSERT INTO job(jobofferid,companyid,jobprofile,todate,fromdate,vacancies,packageamount,jobtype,place)
VALUES('AMA02_201503','AMA02','Database Administrator','10-05-2015','01-05-2015',10,1250000,'job','Pune');


INSERT INTO job(jobofferid,companyid,jobprofile,todate,fromdate,vacancies,packageamount,jobtype,place)
VALUES('FLI01_201501','FLI01','Software Engineer','10-05-2015','01-05-2015',6,1150000,'BOTH','Banglore');


INSERT INTO job(jobofferid,companyid,jobprofile,todate,fromdate,vacancies,packageamount,jobtype,place)
VALUES('FLI01_201502','FLI01','Database Administrator ','10-05-2015','01-05-2015',4,1850000,'BOTH','Banglore');



INSERT INTO job(jobofferid,companyid,jobprofile,todate,fromdate,vacancies,packageamount,jobtype,place)
VALUES('FLI01_201503','FLI01','UI Developer','10-05-2015','01-05-2015',2,950000,'BOTH','Banglore');








INSERT INTO application (applicationid,jobofferid,approved)
VALUES (201412039,'FLI01_201503',true);
INSERT INTO application (applicationid,jobofferid,approved)
VALUES (201412039,'FLI01_201502',false);
INSERT INTO application (applicationid,jobofferid,approved)
VALUES (201412006,'FLI01_201503',false);
INSERT INTO application (applicationid,jobofferid,approved)
VALUES (201412029,'FLI01_201503',false);
INSERT INTO application (applicationid,jobofferid,approved)
VALUES (201412029,'AMA02_201501',true);
INSERT INTO application (applicationid,jobofferid,approved)
VALUES (201412054,'FLI01_201502',false);
INSERT INTO application (applicationid,jobofferid,approved)
VALUES (201412003,'AMA02_201502',true);



INSERT INTO applicationyear(applicantid,applicationyear)
VALUES(201412039,2015);


INSERT INTO applicationyear(applicantid,applicationyear)
VALUES(201412054,2015);


INSERT INTO applicationyear(applicantid,applicationyear)
VALUES(201412003,2015);


INSERT INTO applicationyear(applicantid,applicationyear)
VALUES(201412006,2015);


INSERT INTO applicationyear(applicantid,applicationyear)
VALUES(201412029,2015);




INSERT INTO placementcell(da_id,membername,designation,contactno)
VALUES (201412039,'Lokesh','committee member',789456132);
INSERT INTO placementcell(da_id,membername,designation,contactno)
VALUES (201412054,'Moiz','committee member',789456132)




INSERT INTO coordinates(da_id,jobofferid,roundname)
VALUES(201412039,'FLI01_201401','TECHNICAL');



INSERT INTO coordinates(da_id,jobofferid,roundname)
VALUES(201412054,'FLI01_201402','TECHNICAL');





INSERT INTO round(jobofferid, roundname, round_type, roundorder, description, venue,rounddate, roundtime)
    VALUES ('FLI01_201402','APTITUDE','APTI',2,'Apttitude and technical','LT-02','02-05-2015','4:00');


INSERT INTO round(jobofferid, roundname, round_type, roundorder, description, venue,rounddate, roundtime)
    VALUES ('FLI01_201402','TECHNICAL','TECH',2,'Programming Challenge','LT-01','02-05-2015','6:00');




INSERT INTO participates(applicantid,jobofferid,roundname,status)
VALUES(201412039,'FLI01_201402','TECHNICAL','false');



INSERT INTO qualification(applicantid, qualifyingexam, affiliation, passingyear, grade)
    VALUES (201412039,'B.C.A.','KUTUCH university',2014,'A');





INSERT INTO qualificationrequirement(jobofferid, qualification, grade)
    VALUES ('FLI01_201402','MSC,BTECH,MTECH','B');



INSERT INTO hires(applicantid, jobofferid, hiredate, negotiatedpackage)
    VALUES (201412039,'FLI01_201403','11-05-2015',950000);





