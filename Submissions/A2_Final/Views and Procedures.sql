--Views
-- Hired View : calculate average package and number of recruitment of company year wise.
CREATE OR REPLACE VIEW hired AS SELECT companyid,hires.* FROM job NATURAL JOIN hires;

-- View to display all information about hired students
CREATE VIEW hire_student_job_company AS SELECT * FROM hires  NATURAL JOIN student NATURAL JOIN company NATURAL JOIN job;


-- Average package of program yearwise
CREATE OR REPLACE VIEW program_avgpackage AS
SELECT programname,EXTRACT(year FROM hiredate) AS yr,AVG(negotiatedpackage) AS avgpkg FROM hires JOIN Student ON applicantid=studentid NATURAL JOIN program GROUP BY EXTRACT(year FROM hiredate),programname;


--Stored Procedure
-- increasingcompany() : Solution of Query 11.
CREATE OR REPLACE FUNCTION placementmanagement.increasingcompany() 
RETURNS SETOF company AS $body$
DECLARE
	c placementmanagement.company%ROWTYPE;
	z record;
	pkg bigint;
	cnt integer;
	flag boolean;
	cur1 CURSOR (cid integer) IS SELECT AVG(negotiatedpackage) AS avgpkg,COUNT(applicantid) AS cntapp, companyid,EXTRACT(year FROM hiredate) AS yr FROM hired GROUP BY companyid,EXTRACT(year FROM hiredate) HAVING companyid=cid;
BEGIN
	FOR c IN SELECT * FROM COMPANY
	LOOP
		
		pkg := 0;
		cnt := 0;
		flag:= true;
		FOR z IN cur1(c.companyid)
		LOOP
			IF pkg >= z.avgpkg AND cnt >= z.cntapp THEN
				pkg:=z.avgpkg;
				cnt:=z.cntapp;
			ELSE
				flag:= false;
				EXIT;
			END IF;
			
		END LOOP;
		IF flag = true THEN
			RETURN NEXT c;
		END IF;

		
	END LOOP;
	RETURN;
END $body$ LANGUAGE plpgsql;


--Goldenyears

CREATE OR REPLACE FUNCTION goldenyears() RETURNS SETOF integer AS $body$
DECLARE
	yy integer;
	maxpkg bigint;
	mscpkg bigint;
BEGIN
	FOR yy IN SELECT DISTINCT yr FROM program_avgpackage
	LOOP
		SELECT max(avgpkg) INTO maxpkg FROM program_avgpackage WHERE yr=yy;
		SELECT avgpkg INTO mscpkg FROM program_avgpackage WHERE yr=yy AND programname='MSC-IT';
		IF maxpkg = avgpkg THEN
			RETURN NEXT yy;
		END IF;
		RETURN;
	END LOOP;
END $body$ LANGUAGE plpgsql;
