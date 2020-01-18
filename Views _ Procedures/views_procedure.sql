--Views
-- Hired View : calculate average package and number of recruitment of company year wise.
CREATE OR REPLACE VIEW hired AS SELECT companyid,hires.* FROM job NATURAL JOIN hires;

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