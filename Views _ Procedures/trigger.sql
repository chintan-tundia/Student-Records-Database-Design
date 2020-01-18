-- Trigger to add row automatically upon successful registration in a course by a student
-- The row added in result will have spi as NULL since updating SPI will be a manual process.

CREATE TRIGGER register_result AFTER INSERT OR UPDATE OR DELETE ON registers FOR EACH ROW
EXECUTE PROCEDURE trigger_result();


CREATE OR REPLACE FUNCTION trigger_result() RETURNS TRIGGER AS $registers$
DECLARE count_var_registers INTEGER;
DECLARE count_var_result INTEGER;
BEGIN
	
	
	IF (TG_OP = 'DELETE') THEN
	SELECT INTO count_var_registers count(*) FROM registers WHERE studentid=old.studentid AND acadyear=old.acadyear AND season=old.season;
		IF (count_var_registers = 0) THEN
			DELETE FROM result WHERE studentid=old.studentid AND academicyear=old.acadyear AND season=old.season;
		END IF;
		RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
		SELECT INTO count_var_result count(*) FROM result WHERE studentid=new.studentid AND academicyear=new.acadyear AND season=new.season;
		SELECT INTO count_var_registers count(*) FROM registers WHERE studentid=old.studentid AND acadyear=old.acadyear AND season=old.season;
			IF (count_var_result = 0) THEN
				INSERT INTO result (studentid, academicyear,season) VALUES(new.studentid, new.acadyear,new.season);
				IF (count_var_registers = 0) THEN
					DELETE FROM result WHERE studentid=OLD.studentid AND academicyear=OLD.acadyear AND season=OLD.season;
				END IF;
			END IF;
			RETURN NEW;
		
        ELSIF (TG_OP = 'INSERT') THEN
        	SELECT INTO count_var_result count(*) FROM result WHERE studentid=new.studentid AND academicyear=new.acadyear AND season=new.season;
		IF(count_var_result=0) THEN
			INSERT INTO result (studentid, academicyear, season) VALUES(new.studentid, new.acadyear, new.season);
			RETURN NEW;
		END IF;
	END IF;
        RETURN NULL; 
    END;
$registers$ LANGUAGE plpgsql;


---- Calculate CPI and update it whenever there is a change in SPI of result

DROP FUNCTION trigger_cpi_count() CASCADE;
CREATE OR REPLACE FUNCTION trigger_cpi_count() RETURNS TRIGGER AS $cpi$
DECLARE sum REAL;
DECLARE count REAL;
BEGIN
	SELECT INTO sum cast(SUM(SPI)/COUNT(SPI) as REAL) FROM result WHERE studentid=NEW.studentid;

	UPDATE student SET cpi = sum WHERE studentid=NEW.studentid;
	RETURN NEW;
END;
$cpi$ LANGUAGE plpgsql;

CREATE TRIGGER result_student AFTER INSERT OR UPDATE ON result FOR EACH ROW
EXECUTE PROCEDURE trigger_cpi_count();
