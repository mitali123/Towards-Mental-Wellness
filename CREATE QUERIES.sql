# DROP DATABASE depression_diagnosis_treatment_tool;
CREATE DATABASE depression_diagnosis_treatment_tool;
USE depression_diagnosis_treatment_tool;

CREATE TABLE patient(
id INT AUTO_INCREMENT PRIMARY KEY,
user_name VARCHAR(100),
password VARCHAR(100)
);

CREATE TABLE visit(
id INT,
patient_id INT,
details VARCHAR(100),
CONSTRAINT PK_visit PRIMARY KEY (patient_id,id),
FOREIGN KEY (patient_id) REFERENCES patient(id)
);

CREATE TABLE side_effects 
(id INT AUTO_INCREMENT PRIMARY KEY, 
Category VARCHAR(350) NOT NULL,
Symptoms VARCHAR(350) NOT NULL,
Description VARCHAR(350),	
Action VARCHAR(350) NOT NULL);

CREATE TABLE medication_category(
id VARCHAR(350) PRIMARY KEY,	
description VARCHAR(1000));

CREATE TABLE medication_detail(
id INT AUTO_INCREMENT PRIMARY KEY,	
medication_category_id	VARCHAR(350),
type VARCHAR(350),	
name VARCHAR(350),	
min_dose VARCHAR(350),	
start_dose VARCHAR(350),	
start_period VARCHAR(350),	
inc_or_dec	VARCHAR(350),
max_dose VARCHAR(350),
FOREIGN KEY (medication_category_id) REFERENCES medication_category(id));

CREATE TABLE PHQ9_Score_Map(
id INT AUTO_INCREMENT PRIMARY KEY,	
type VARCHAR(350) NOT NULL,	
PHQ_9_min INT NOT NULL,
PHQ_9_max INT NOT NULL);

# vitamin b6 default range 5-50 µg/L, so m guessing lower is 5
# vitamin b12 default range is 200-900 ng/mL
# folate or folic acid, default range is 140 to 960 ng/mL
# A level less than 12 ng/mL indicates vitamin D deficiency

CREATE TABLE standard_test_values(
temp INT, 
gad2_anxiety INT DEFAULT 3,
auditC_alcohol INT DEFAULT 4,
vitamin_b6_level INT DEFAULT 5,
vitamin_b12_level INT DEFAULT 200,
vitamin_folate_level INT DEFAULT 140,
vitamin_D_level INT DEFAULT 12,
hypothyroidism INT DEFAULT  4,
low_blood_pressure INT DEFAULT 60 ,
high_blood_pressure INT DEFAULT 89,
poor_vision INT DEFAULT 20,
low_bmi INT DEFAULT 18,
high_bmi INT DEFAULT 25,
diabetes INT DEFAULT  126
);

CREATE TABLE mental_health_test(
id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT,
stress INT NOT NULL,
gad2_anxiety INT NOT NULL,
sleep_disturbance INT NOT NULL,
grief_reaction INT NOT NULL,
bipolar_disorder INT NOT NULL,
FOREIGN KEY (patient_id) REFERENCES patient(id)
);

CREATE TABLE mental_health_test_result(
id INT AUTO_INCREMENT PRIMARY KEY,
mental_health_test_id INT NOT NULL,
stress BOOLEAN NOT NULL,
gad2_anxiety BOOLEAN NOT NULL,
sleep_disturbance BOOLEAN NOT NULL,
grief_reaction BOOLEAN NOT NULL,
bipolar_disorder BOOLEAN NOT NULL,
FOREIGN KEY (mental_health_test_id) REFERENCES mental_health_test(id)
);

CREATE TABLE depression_assessment(
id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT,
phq9_self_assessment_score INT NOT NULL,
phq9_social_media_assessment_score INT NOT NULL,
FOREIGN KEY (patient_id) REFERENCES patient(id));

CREATE TABLE depression_assessment_result(
id INT AUTO_INCREMENT PRIMARY KEY,
depression_assessment_id INT,
depression_score INT NOT NULL,
phq9_depression_type_id INT NOT NULL,
FOREIGN KEY (depression_assessment_id) REFERENCES depression_assessment(id),
FOREIGN KEY (phq9_depression_type_id) REFERENCES phq9_score_map(id)
);

CREATE TABLE substance_use_test(
id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT,
auditC_alcohol INT NOT NULL,
smoke boolean NOT NULL,
FOREIGN KEY (patient_id) REFERENCES patient(id)
);

CREATE TABLE substance_use_test_result(
id INT AUTO_INCREMENT PRIMARY KEY,
substance_use_test_id INT,
auditC_alcohol boolean NOT NULL,
smoke boolean NOT NULL,
FOREIGN KEY (substance_use_test_id) REFERENCES substance_use_test(id)
);

CREATE TABLE nutrition_test(
id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT,
vitamin_b6_level INT NOT NULL,
vitamin_b12_level INT NOT NULL,
vitamin_folate_level INT NOT NULL,
FOREIGN KEY (patient_id) REFERENCES patient(id)
);

CREATE TABLE nutrition_test_result(
id INT AUTO_INCREMENT PRIMARY KEY,
nutrition_test_id INT,
nutrition_result boolean,
FOREIGN KEY (nutrition_test_id) REFERENCES nutrition_test(id) 
);

CREATE TABLE seasonal_affective_disorder_test(
id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT,
vitamin_D_level INT NOT NULL,
FOREIGN KEY (patient_id) REFERENCES patient(id)
);

CREATE TABLE seasonal_affective_disorder_test_result(
id INT AUTO_INCREMENT PRIMARY KEY,
seasonal_affective_disorder_test_id INT,
seasonal_affective_disorder_result boolean,
FOREIGN KEY (seasonal_affective_disorder_test_id) REFERENCES seasonal_affective_disorder_test(id) 
);

CREATE TABLE physical_health_test(
id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT,
hypothyroidism INT NOT NULL,
high_blood_pressure INT NOT NULL,
low_blood_pressure INT NOT NULL,
poor_vision INT NOT NULL,
low_bmi INT NOT NULL,
high_bmi INT NOT NULL,
diabetes INT NOT NULL,
FOREIGN KEY (patient_id) REFERENCES patient(id)
);

CREATE TABLE physical_health_test_result(
id INT AUTO_INCREMENT PRIMARY KEY,
physical_health_test_id INT NOT NULL,
hypothyroidism BOOLEAN NOT NULL,
low_blood_pressure BOOLEAN NOT NULL,
high_blood_pressure BOOLEAN NOT NULL,
poor_vision BOOLEAN NOT NULL,
low_bmi BOOLEAN NOT NULL,
high_bmi BOOLEAN NOT NULL,
diabetes BOOLEAN NOT NULL,
FOREIGN KEY (physical_health_test_id) REFERENCES physical_health_test(id)
);

CREATE TABLE diagnosis(
id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT,
visit_id INT,
depression_assessment_result_id INT,
mental_health_test_result_id INT,
substance_use_test_result_id INT,
nutrition_test_result_id INT,
seasonal_affective_disorder_test_result_id INT,
physical_health_test_result_id INT,
FOREIGN KEY (depression_assessment_result_id) REFERENCES depression_assessment_result(id),
FOREIGN KEY (mental_health_test_result_id) REFERENCES mental_health_test_result(id),
FOREIGN KEY (substance_use_test_result_id) REFERENCES substance_use_test_result(id),
FOREIGN KEY (nutrition_test_result_id) REFERENCES nutrition_test_result(id),
FOREIGN KEY (seasonal_affective_disorder_test_result_id) REFERENCES seasonal_affective_disorder_test_result(id),
FOREIGN KEY (physical_health_test_result_id) REFERENCES physical_health_test_result(id),
CONSTRAINT FK_patient_visit_diagnosis FOREIGN KEY (patient_id,visit_id) 
REFERENCES visit (patient_id, id)
);

CREATE TABLE physical_activity(
id INT AUTO_INCREMENT PRIMARY KEY,
physical_activity VARCHAR(400)
);

CREATE TABLE physical_activity_map(
id INT AUTO_INCREMENT PRIMARY KEY,
physical_activity_id INT NOT NULL,
side_effects_id	INT,
phq9_depression_id INT,
FOREIGN KEY (physical_activity_id) REFERENCES physical_activity(id),
FOREIGN KEY (side_effects_id) REFERENCES side_effects(id),
FOREIGN KEY (PHQ9_depression_id) REFERENCES phq9_score_map(id)
);

CREATE TABLE therapy(
therapy_name VARCHAR(400) PRIMARY KEY,
description	VARCHAR(400),
depression_type	INT,
Symptom VARCHAR(400),
FOREIGN KEY (depression_type) REFERENCES phq9_score_map(id));

CREATE TABLE physical_standard_medication_change_map(
physical_symptom VARCHAR(100) NOT NULL,
standard_medication_id	INT NOT NULL,
side_effect_id INT,
changed_medication_id INT,
FOREIGN KEY (standard_medication_id) REFERENCES medication_detail(id),
FOREIGN KEY (changed_medication_id) REFERENCES medication_detail(id),
FOREIGN KEY (side_effect_id) REFERENCES side_effects(id)
);

CREATE TABLE standard_medication_change_map(
depression_type	INT NOT NULL,
standard_medication_id	INT NOT NULL,
side_effect_id INT,
changed_medication_id INT,
FOREIGN KEY (depression_type) REFERENCES phq9_score_map(id),
FOREIGN KEY (standard_medication_id) REFERENCES medication_detail(id),
FOREIGN KEY (changed_medication_id) REFERENCES medication_detail(id),
FOREIGN KEY (side_effect_id) REFERENCES side_effects(id)
);


CREATE TABLE standard_medication_treat_map(
side_effect_id INT NOT NULL,	
treatment_course VARCHAR(500),
FOREIGN KEY (side_effect_id) REFERENCES side_effects(id)
);

CREATE TABLE diet_plan(
id INT PRIMARY KEY AUTO_INCREMENT,
reason VARCHAR(300),	
symptom_description	VARCHAR(300),
plan_description VARCHAR(300)
);

CREATE TABLE treatment_plan(
id INT PRIMARY KEY AUTO_INCREMENT,
patient_id INT,
visit_id INT,
diagnosis_id INT,
medication_id INT DEFAULT NULL,
current_dose INT DEFAULT 0,
additional_instructions VARCHAR(400) DEFAULT NULL,
therapy_details VARCHAR(900) DEFAULT "",
diet_details VARCHAR(900) DEFAULT "",
physical_activity_id INT DEFAULT NULL,
patient_education VARCHAR(900) DEFAULT "",
FOREIGN KEY (diagnosis_id) REFERENCES diagnosis(id),
FOREIGN KEY (medication_id) REFERENCES medication_detail(id),
FOREIGN KEY (physical_activity_id) REFERENCES physical_activity(id),
CONSTRAINT FK_patient_visit_treatment FOREIGN KEY (patient_id,visit_id) 
REFERENCES visit (patient_id, id)
);

CREATE TABLE patient_feedback(
id int PRIMARY KEY AUTO_INCREMENT,
patient_id int, 
treatment_id int, 
medication_dose_followed boolean, 
therapy_followed boolean, 
physical_activity_followed boolean, 
treatment_symptomps varchar(100), 
foreign key(patient_id) references patient(id),
foreign key(treatment_id) references treatment_plan(id)
);

CREATE TABLE treatment_effectiveness_calculation_standard(
id int primary key,
score_drop_min int,
score_drop_max int,
treatment_response varchar(50),
treatment_action varchar(100)
);

CREATE TABLE medical_history(
patient_id int Not null primary key,
depression_previously_diagnosed boolean,
foreign key(patient_id) references patient(id)
);

# CREATE VIEWS

CREATE VIEW patient_visit_view AS
SELECT patient_id, MAX(id) as latest_visit, COUNT(id) as total_visit
FROM  visit
GROUP BY patient_id;

USE `depression_diagnosis_treatment_tool`;
CREATE  OR REPLACE VIEW `patient_statistics_view` AS
Select t.patient_id, d.visit_id, r.depression_score, s.type,
        r.depression_score - lag (r.depression_score)
        over (
				PARTITION BY d.patient_id
                order by r.id)
			as 'drop'
                   from depression_assessment_result r
                   inner join depression_assessment t
                   on r.depression_assessment_id = t.id
                   inner join diagnosis d
                   on r.id = d.depression_assessment_result_id
                   inner join phq9_score_map s
                   on r.phq9_depression_type_id = s.id;;


# CREATE TRIGGERS

# 1. Trigger for SAD
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `depression_diagnosis_treatment_tool`.`seasonal_affective_disorder_test_AFTER_INSERT` AFTER INSERT ON `seasonal_affective_disorder_test` FOR EACH ROW
BEGIN
	# compare vitamin D value for latest test to value stores in standard test table,
	# and store result in a variable called result
	SET @result := (select if
	((SELECT Vitamin_D_level
	FROM seasonal_affective_disorder_test WHERE id = NEW.id) <
	(SELECT vitamin_D_level
	FROM standard_test_values WHERE temp = 1),
	true,false));
	# insert a new row in corresponding result table, with foreign key and result value
	INSERT INTO seasonal_affective_disorder_test_result
	(seasonal_affective_disorder_test_id, seasonal_affective_disorder_result)
	VALUES
	(NEW.id, @result);
END$$
DELIMITER ;

# 2. Trigger for depression assessment
DROP TRIGGER IF EXISTS `depression_diagnosis_treatment_tool`.`depression_assessment_AFTER_INSERT`;

DELIMITER $$
USE `depression_diagnosis_treatment_tool`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `depression_assessment_AFTER_INSERT` AFTER INSERT ON `depression_assessment` FOR EACH ROW BEGIN
#calculate avg score of self assessment and social media score and history
	SET @depression_tscore = (NEW.phq9_self_assessment_score + NEW.phq9_social_media_assessment_score)/2;
	SELECT total_visit into @visit FROM `patient_visit_view` where patient_id = NEW.patient_id;
    SET @dHist = 0;
    IF(@visit = 1) THEN 
		SET @hist = (SELECT depression_previously_diagnosed FROM medical_history
        WHERE patient_id = NEW.patient_id);
		IF(@hist = 1) THEN SET @dHist = 1;
        ELSE 
			SET @dHist = 0;
        END IF;
	END IF;
    SET @depression_score = @depression_tscore + @dHist;
	#find type of depression based on score
	SET @depression_type_id = 
    (SELECT id FROM phq9_score_map 
    WHERE @depression_score BETWEEN phq_9_min AND phq_9_max);
	# insert the assessment_id, score and type into depression_assessment_result
	INSERT INTO depression_assessment_result 
    (depression_assessment_id,depression_score,phq9_depression_type_id) 
    VALUES
    (NEW.id,@depression_score,@depression_type_id);
END$$
DELIMITER ;

# 3. Trigger for mental health
DROP TRIGGER IF EXISTS `depression_diagnosis_treatment_tool`.`mental_health_test_AFTER_INSERT`;

DELIMITER $$
USE `depression_diagnosis_treatment_tool`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `mental_health_test_AFTER_INSERT` AFTER INSERT ON `mental_health_test` FOR EACH ROW BEGIN
	#calculate stress
	IF(NEW.stress > 0) THEN
		SET @stress_result = true;
	ELSE
		SET @stress_result = false;
	END IF;

	#calculate gad2_anxiety
	SET @gad2_limit = (select gad2_anxiety from standard_test_values);
	IF(NEW.gad2_anxiety >= @gad2_limit) THEN
		SET @anxiety_result = true;
	ELSE
		SET @anxiety_result = false;
	END IF;

	#calculate sleep_disturbance
	IF(NEW.sleep_disturbance > 0) THEN
		SET @sleep_disturbance_result = true;
	ELSE
		SET @sleep_disturbance_result = false;
	END IF;
	
	#calculate grief reaction
	IF(NEW.grief_reaction > 0) THEN
		SET @grief_reaction_result = true;
	ELSE
		SET @grief_reaction_result = false;
	END IF;

	#calculate bipolar disorder
	IF(NEW.bipolar_disorder > 0) THEN
		SET @bipolar_disorder_result = true;
	ELSE
		SET @bipolar_disorder_result = false;
	END IF;

	#insert the result into mental_health_test_result
	INSERT INTO mental_health_test_result (mental_health_test_id,stress,gad2_anxiety,sleep_disturbance,grief_reaction,bipolar_disorder)
	VALUES
	(NEW.id,@stress_result,@anxiety_result,@sleep_disturbance_result,@grief_reaction_result,@bipolar_disorder_result);

END$$
DELIMITER ;

# 4. Trigger for physical health

DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `depression_diagnosis_treatment_tool`.`physical_health_test_AFTER_INSERT` AFTER INSERT ON `physical_health_test` FOR EACH ROW
BEGIN
	#get the ideal levels from standard_test_values
	SET @hypothyroidism_ideal = (select hypothyroidism from standard_test_values);
	SET @low_blood_pressure_ideal = (select low_blood_pressure from standard_test_values);
	SET @high_blood_pressure_ideal = (select high_blood_pressure from standard_test_values);
	SET @poor_vision_ideal = (select poor_vision from standard_test_values);
	SET @low_bmi_ideal = (select low_bmi from standard_test_values);
	SET @high_bmi_ideal = (select high_bmi from standard_test_values);
	SET @diabetes_ideal = (select diabetes from standard_test_values);

	#set test result values
	IF(NEW.hypothyroidism > @hypothyroidism_ideal) THEN
		SET @hypothyroid_result = true;
	ELSE
		SET @hypothyroid_result = false;
	END IF;

	IF(NEW.high_blood_pressure > @high_blood_pressure_ideal) THEN
		SET @high_blood_pressure_result = true;
	ELSE
		SET @high_blood_pressure_result = false;
	END IF;

	IF(NEW.low_blood_pressure < @low_blood_pressure_ideal) THEN
		SET @low_blood_pressure_result = true;
	ELSE
		SET @low_blood_pressure_result = false;
	END IF;

	IF(NEW.poor_vision < @poor_vision_ideal) THEN
		SET @poor_vision_result = true;
	ELSE
		SET @poor_vision_result = false;
	END IF;

	IF(NEW.low_bmi < @low_bmi_ideal) THEN
		SET @low_bmi_result = true;
	ELSE
		SET @low_bmi_result = false;
	END IF;

	IF(NEW.high_bmi > @high_bmi_ideal) THEN
		SET @high_bmi_result = true;
	ELSE
		SET @high_bmi_result = false;
	END IF;

	IF(NEW.diabetes > @diabetes_ideal) THEN
		SET @diabetes_result = true;
	ELSE
		SET @diabetes_result = false;
	END IF;

	#inserting result into result table
	INSERT INTO physical_health_test_result 
	(physical_health_test_id,hypothyroidism,low_blood_pressure,poor_vision,low_bmi,high_bmi,diabetes,high_blood_pressure)
	VALUES
	(NEW.id,@hypothyroid_result,@low_blood_pressure_result,@poor_vision_result,@low_bmi_result,@high_bmi_result,@diabetes_result,@high_blood_pressure_result);
END$$
DELIMITER ;

# 5. Trigger for substance use

DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `depression_diagnosis_treatment_tool`.`substance_use_test_AFTER_INSERT` AFTER INSERT ON `substance_use_test` FOR EACH ROW
BEGIN
	#get ideal values from standard_test_values
	SET @auditC_alcohol_ideal = (select auditC_alcohol from standard_test_values);
	#compare patient levels
	IF(NEW.auditC_alcohol > @auditC_alcohol_ideal) THEN
		SET @auditC_alcohol_result = true;
	ELSE
		SET @auditC_alcohol_result = false;
	END IF;

	#insert result into result table
	INSERT INTO substance_use_test_result
	(substance_use_test_id, auditC_alcohol, smoke)
	VALUES
	(NEW.id,@auditC_alcohol_result,NEW.smoke);
END$$
DELIMITER ;

# 6. Trigger for nutrition

DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `depression_diagnosis_treatment_tool`.`nutrition_test_AFTER_INSERT` AFTER INSERT ON `nutrition_test` FOR EACH ROW
BEGIN
	#get the ideal vitamin levels from standard_test_values
	SET @vitamin_B6_ideal = (select vitamin_b6_level from standard_test_values);
	SET @vitamin_B12_ideal = (select vitamin_b12_level from standard_test_values);
	SET @vitamin_folate_ideal = (select vitamin_folate_level from standard_test_values);
	#set testresult to false if any one vitamin level is less than ideal
	IF(NEW.vitamin_B6_level < @vitamin_B6_ideal) THEN
		SET @nutrition_result = true;
	ELSEIF(NEW.vitamin_B12_level < @vitamin_B12_ideal) THEN
		SET @nutrition_result = true;
	ELSEIF(NEW.vitamin_folate_level < @vitamin_folate_ideal) THEN
		SET @nutrition_result = true;
	ELSE 
		SET @nutrition_result = false;
	END IF;

	#insert the result into nutrition_test_result the result
	INSERT INTO nutrition_test_result 
	(nutrition_test_id,nutrition_result)
	VALUES
	(NEW.id,@nutrition_result);
END$$
DELIMITER ;

#7. Trigger for treatment_plan row entry after diagnosis
DROP TRIGGER IF EXISTS `depression_diagnosis_treatment_tool`.`diagnosis_AFTER_INSERT`;

DELIMITER $$
USE `depression_diagnosis_treatment_tool`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `diagnosis_AFTER_INSERT` AFTER INSERT ON `diagnosis` FOR EACH ROW BEGIN
#this is the basic trigger linking diagnosis id to treatment_plan with default values
# note that, actual analysis n actual treatment is still pending
INSERT INTO treatment_plan 
(patient_id, visit_id, diagnosis_id)
VALUES
(NEW.patient_id, NEW.visit_id, NEW.id); 
END$$
DELIMITER ;

# 8. procedure call: CALL store_diagnosis(#patient_id,#visit_id)
# eg.  CALL store_diagnosis(1,1)

# CREATE STORED PROCEDURE 
USE `depression_diagnosis_treatment_tool`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `store_diagnosis`(IN patientId INT , IN visitId INT)
BEGIN
# get latest visit result for patient for each test
# 1. Depression
SET @depression_assessment_result := 
(SELECT id 
FROM depression_assessment_result 
WHERE depression_assessment_id = 
(SELECT MAX(id)
FROM depression_assessment
WHERE patient_id = patientId));

# 2. Mental Health
SET @mental_health_test_result := 
(SELECT id 
FROM mental_health_test_result
WHERE mental_health_test_id = 
(SELECT MAX(id)
FROM mental_health_test 
WHERE patient_id = patientId));

# 3. Physical Health
SET @physical_health_test_result := 
(SELECT id 
FROM physical_health_test_result
WHERE physical_health_test_id = 
(SELECT MAX(id)
FROM physical_health_test 
WHERE patient_id = patientId));

# 4. Nutrition
SET @nutrition_test_result := 
(SELECT id 
FROM nutrition_test_result
WHERE nutrition_test_id = 
(SELECT MAX(id)
FROM nutrition_test 
WHERE patient_id = patientId));

# 5. SAD
SET @seasonal_affective_disorder_test_result := 
(SELECT id 
FROM seasonal_affective_disorder_test_result 
WHERE seasonal_affective_disorder_test_id = 
(SELECT MAX(id)
FROM seasonal_affective_disorder_test 
WHERE patient_id = patientId));

# 6. Substance use
SET @substance_use_test_result := 
(SELECT id 
FROM substance_use_test_result 
WHERE substance_use_test_id = 
(SELECT MAX(id)
FROM substance_use_test 
WHERE patient_id = patientId));

INSERT INTO diagnosis 
(patient_id,visit_id,depression_assessment_result_id,mental_health_test_result_id,substance_use_test_result_id,
nutrition_test_result_id,seasonal_affective_disorder_test_result_id,physical_health_test_result_id)
VALUES
(patientId,visitId,@depression_assessment_result,@mental_health_test_result,@substance_use_test_result,
@nutrition_test_result,@seasonal_affective_disorder_test_result,@physical_health_test_result);
END$$

DELIMITER ;

# FUNCTION TO GET PATIENT FEEDBACK

USE `depression_diagnosis_treatment_tool`;
DROP function IF EXISTS `patient_gives_feedback`;

DELIMITER $$
USE `depression_diagnosis_treatment_tool`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `patient_gives_feedback`(patientName VARCHAR(100), 
did_you_take_medication_per_presciption BOOLEAN , did_you_follow_recommended_therapy_routine BOOLEAN, 
did_you_follow_recommended_physical_activity_routine BOOLEAN, any_symptom_from_medication VARCHAR(100)) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

# for whom is this treatment i.e. get patient_id
SET @patientID =
(SELECT id FROM patient 
WHERE user_name like CONCAT ('%',patientName,'%'));

# for which treatment_id is this feedback  
SET @treatmentID = 
(SELECT id FROM treatment_plan WHERE visit_id = 
(SELECT latest_visit FROM patient_visit_view WHERE patient_id = @patientID) AND patient_id = @patientID);

# add the feedback

INSERT INTO patient_feedback 
(patient_id, treatment_id,medication_dose_followed, therapy_followed, physical_activity_followed,treatment_symptomps)
VALUES 
(@patientID,@treatmentID,did_you_take_medication_per_presciption,did_you_follow_recommended_therapy_routine,did_you_follow_recommended_physical_activity_routine,any_symptom_from_medication);
SET @patientName = 
(SELECT user_name FROM patient WHERE id = @patientID); 

SET @success = CONCAT(@patientName, " gave feedback successfully!!");
RETURN @success;

END$$

DELIMITER ;

# CREATE FUNCTIONs AND OR STORED PROCEDURES AS REQUIRED, FOR TREATMENT PLAN

# FUNCTION TO CALCULATE Depression DROP
USE `depression_diagnosis_treatment_tool`;
DROP function IF EXISTS `calc_depression_drop_from_prev_visit`;

DELIMITER $$
USE `depression_diagnosis_treatment_tool`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `calc_depression_drop_from_prev_visit`(patientID INT) RETURNS int(11)
    DETERMINISTIC
BEGIN
SET @prevVisitID = 
(SELECT latest_visit - 1 
FROM patient_visit_view
WHERE patient_id = patientID);

SET @currVisit = (SELECT latest_visit 
FROM patient_visit_view
WHERE patient_id = patientID);

SET @total_visit = (SELECT total_visit 
FROM patient_visit_view WHERE patient_id = patientID);

IF (@total_visit = 1) THEN 
	SET @depressionDrop = null;
ELSE 
	SET @prev_depresssion_assesment_score = 
    (SELECT depression_score 
    FROM depression_assessment_result 
	WHERE id = (SELECT depression_assessment_result_id 
    FROM diagnosis 
    WHERE id = 
	(SELECT diagnosis_id 
	FROM treatment_plan
	WHERE patient_id = patientID and visit_id = @prevVisitID)));
    
    SET @curr_depresssion_assesment_score = 
    (SELECT depression_score 
    FROM depression_assessment_result 
	WHERE id = (SELECT depression_assessment_result_id 
    FROM diagnosis 
    WHERE id = 
	(SELECT diagnosis_id 
	FROM treatment_plan
	WHERE patient_id = patientID and visit_id = @currVisit)));
    
    SET @depressionDrop = @prev_depresssion_assesment_score - @curr_depresssion_assesment_score;
    
END IF;

RETURN @depressionDrop;
END$$

DELIMITER ;

USE `depression_diagnosis_treatment_tool`;
DROP function IF EXISTS `get_depression_assessment_result`;

DELIMITER $$
USE `depression_diagnosis_treatment_tool`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_depression_assessment_result`(patientID INT, visitID INT) RETURNS int(11)
    DETERMINISTIC
BEGIN
	SELECT phq9_depression_type_id
	INTO @depression_level 	
    FROM depression_assessment_result 
	WHERE id =
	(SELECT depression_assessment_result_id FROM diagnosis WHERE id = 
	(SELECT diagnosis_id 
	FROM treatment_plan
	WHERE patient_id = patientId and visit_id = visitID));
RETURN @depression_level;
END$$

DELIMITER ;

USE `depression_diagnosis_treatment_tool`;
DROP function IF EXISTS `get_physical_health_test_result`;

DELIMITER $$
USE `depression_diagnosis_treatment_tool`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_physical_health_test_result`(patientId INT, visitID INT) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	SELECT hypothyroidism,low_blood_pressure, high_blood_pressure,poor_vision,low_bmi,high_bmi,diabetes
	INTO @hypothyroidism, @low_blood_pressure, @high_blood_pressure, @poor_vision, @low_bmi, @high_bmi, @diabetes
	FROM physical_health_test_result 
	WHERE id =
	(SELECT physical_health_test_result_id FROM diagnosis WHERE id = 
	(SELECT diagnosis_id 
	FROM treatment_plan
	WHERE patient_id = patientId and visit_id = visitID));
    
    IF(@hypothyroidism > 0) THEN
		SET @physical_test_result = "Hypothyroidism";
	ELSEIF(@low_blood_pressure > 0) THEN
		SET @physical_test_result = "Low blood pressure";
	ELSEIF(@high_blood_pressure > 0) THEN
		SET @physical_test_result = "High blood pressure";
	ELSEIF(@poor_vision > 0) THEN
		SET @physical_test_result = "Poor Vision";
    ELSEIF(@diabetes > 0) THEN
		SET @physical_test_result = "Diabetes";
    ELSE
		SET @physical_test_result = null;
	END IF;    
    
RETURN @physical_test_result;
END$$

DELIMITER ;

USE `depression_diagnosis_treatment_tool`;
DROP function IF EXISTS `get_therapy_result`;

DELIMITER $$
USE `depression_diagnosis_treatment_tool`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_therapy_result`(patientId int, visitId int) RETURNS varchar(500) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	Declare stress1 boolean;
    Declare anxiety boolean;
    Declare sleep boolean;
    Declare grief boolean;
    Declare bipolar boolean;
    Declare therapy varchar(500);
    declare mental_test_id int;
    declare depression_type1 int;
    declare sad_result boolean;
    declare additional_therapy varchar(500);
    SET mental_test_id = (SELECT mental_health_test_result_id FROM diagnosis WHERE patient_id = patientId AND visit_id = visitId);
    SET depression_type1 = (Select phq9_depression_type_id from depression_assessment_result where depression_assessment_id = (SELECT depression_assessment_result_id FROM diagnosis WHERE patient_id = patientId AND visit_id = visitId));
    SET sad_result = (Select seasonal_affective_disorder_result from seasonal_affective_disorder_test_result where seasonal_affective_disorder_test_id = (SELECT seasonal_affective_disorder_test_result_id FROM diagnosis WHERE patient_id = patientId AND visit_id = visitId));
    #get whether patient has stress
    SELECT stress into stress1 from mental_health_test_result where mental_health_test_id = mental_test_id;
    #get whether patient has anxiety
    SELECT gad2_anxiety into anxiety from mental_health_test_result where mental_health_test_id = mental_test_id;
    #get whether patient has sleep_disturbance
    SELECT sleep_disturbance into sleep from mental_health_test_result where mental_health_test_id = mental_test_id;
    #get whether patient has grief reaction
    SELECT grief_reaction into grief from mental_health_test_result where mental_health_test_id = mental_test_id;
    #get whether patient has bipolar
    SELECT bipolar_disorder into bipolar from mental_health_test_result where mental_health_test_id = mental_test_id;
    #set primary therapies
    if(stress1 = 1) then
		SET therapy = (select therapy_name from therapy where Symptom LIKE CONCAT('%','stress', '%') and depression_type = depression_type1 );
	elseif(anxiety = 1)then
		SET therapy = (select therapy_name from therapy where Symptom LIKE CONCAT('%','anxiety', '%') and depression_type = depression_type1 );
	elseif(depression_type1 = 5 AND stress1 = 0 AND anxiety = 0) then
		SET therapy = (select therapy_name from therapy where Symptom is null and depression_type = depression_type1 );
	end if;
    
    #set other therapies(secondary)
    if(sad_result = 1) then
		SET additional_therapy = (select therapy_name from therapy where Symptom LIKE '%vitamin D deficiency%');
		SET therapy = CONCAT(therapy, " ",additional_therapy, " " );
	elseif(sleep = 1) then
		SET additional_therapy = (select therapy_name from therapy where Symptom LIKE '%sleep disturbance%');
		SET therapy = CONCAT(therapy, " ",additional_therapy, " " );
	elseif(grief = 1) then
		SET additional_therapy = (select therapy_name from therapy where Symptom LIKE '%grief reaction%');
		SET therapy = CONCAT(therapy, " ",additional_therapy, " " );
	end if;
RETURN therapy;
END$$

DELIMITER ;

USE `depression_diagnosis_treatment_tool`;
DROP function IF EXISTS `get_diet_result`;

DELIMITER $$
USE `depression_diagnosis_treatment_tool`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_diet_result`(patientId INT, visitId INT ) RETURNS varchar(1000) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

SET @nutrition_test_result = 
    (SELECT nutrition_result 
    FROM nutrition_test_result
	WHERE id = (SELECT nutrition_test_result_id 
    FROM diagnosis 
    WHERE id = 
	(SELECT diagnosis_id 
	FROM treatment_plan
	WHERE patient_id = patientID and visit_id = visitId)));

SET @seasonal_affective_disorder_test_result = 
    (SELECT seasonal_affective_disorder_result 
    FROM seasonal_affective_disorder_test_result
	WHERE id = (SELECT seasonal_affective_disorder_test_result_id 
    FROM diagnosis 
    WHERE id = 
	(SELECT diagnosis_id 
	FROM treatment_plan
	WHERE patient_id = patientID and visit_id = visitId)));

SET @plan = " ";
IF(@nutrition_test_result = 1) THEN 
	SET @plan = (CONCAT(@plan," DIET: ",(SELECT plan_description from diet_plan where id = 1)));
END IF;  
IF(@seasonal_affective_disorder_test_result = 1) THEN 
	SET @plan = (CONCAT(@plan," DIET: ",(SELECT plan_description from diet_plan where id = 2)));
END IF; 
 
RETURN @plan;
END$$

DELIMITER ;

# get Phyisical activity id

USE `depression_diagnosis_treatment_tool`;
DROP function IF EXISTS `get_physical_acitivity_id`;

DELIMITER $$
USE `depression_diagnosis_treatment_tool`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_physical_acitivity_id`(patientId INT, visitId INT) RETURNS int(11)
    DETERMINISTIC
BEGIN

set @depression_type_value  :=
(SELECT phq9_depression_type_id
FROM depression_assessment_result
WHERE depression_assessment_id IN (
        SELECT depression_assessment_result_id
        FROM diagnosis
        WHERE patient_id = patientId and visit_id = visitId));
        

SET @treatment_id = (SELECT id FROM treatment_plan 
WHERE diagnosis_id =
(SELECT id FROM diagnosis WHERE 
patient_id = patientID and visit_id = visitID - 1));

SET @feedback_id = (SELECT id FROM patient_feedback WHERE 
treatment_id = @treatment_id);

SET @treatmentSymptomps = 
(SELECT treatment_symptomps 
FROM patient_feedback
WHERE id = @feedback_id);

SET @treatmentSideEffectId = 
	(SELECT id 
    FROM side_effects 
    WHERE Symptoms like CONCAT('%',@treatmentSymptomps,'%'));


IF(@treatmentSideEffectId IS NULL) THEN        
	set @physical_activity_id_value :=
	(SELECT physical_activity_id FROM physical_activity_map
	WHERE side_effects_id is null and phq9_depression_id = @depression_type_value);
ELSE
	set @physical_activity_id_value :=
	(SELECT physical_activity_id FROM physical_activity_map
	WHERE side_effects_id = @treatmentSideEffectId and phq9_depression_id = @depression_type_value);

END IF;

IF @physical_activity_id_value is null THEN 
SET @physical_activity_id_value :=
	(SELECT physical_activity_id FROM physical_activity_map
	WHERE side_effects_id is null and phq9_depression_id = @depression_type_value);
END IF;

RETURN @physical_activity_id_value;
END$$

DELIMITER ;


# correct function for adjusting dosage
USE `depression_diagnosis_treatment_tool`;
DROP function IF EXISTS `calc_dosage`;

DELIMITER $$
USE `depression_diagnosis_treatment_tool`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `calc_dosage`(patientID INT ,prevTreatmentID INT, medicineID INT, adjust Boolean) RETURNS int(11)
    DETERMINISTIC
BEGIN

# fetch existing medicine from the previous treatment
IF(prevTreatmentID = 0 || prevTreatmentID IS NULL) THEN
	SET @startDose = (SELECT start_dose FROM medication_detail
	WHERE id = medicineID);
    SET @newDosage =  @startDose;
ELSE
	SET @oldMedicineID = (SELECT medication_id FROM treatment_plan
			WHERE id = @prevTreatmentID);
	SET @currDosage = (SELECT current_dose FROM treatment_plan
			WHERE id = @prevTreatmentID);

	# fetch base details regarding medicine
	SET @chg = (SELECT inc_or_dec FROM medication_detail
		WHERE id = medicineID);
	SET @minDose = (SELECT min_dose FROM medication_detail
		WHERE id = medicineID);
	SET @maxDose = (SELECT max_dose FROM medication_detail
		WHERE id = medicineID);
	SET @startDose = (SELECT start_dose FROM medication_detail
		WHERE id = medicineID);  

	IF(@oldMedicineID = medicineID AND adjust = TRUE) THEN
		SET @newDosage = @currDosage - @chg;
		IF(@newDosage not between @minDose AND @maxDose) THEN
			SET @newDosage = @currDosage;
		END IF;
	ELSEIF(@oldMedicineID = medicineID AND adjust = FALSE) THEN
		SET @newDosage = @currDosage + @chg;
		IF(@newDosage not between @minDose AND @maxDose) THEN
			SET @newDosage = @currDosage;
		END IF;
	ELSEIF(@oldMedicineID <> medicineID) THEN
		SET @newDosage =  @startDose;
	END IF;
END IF;
RETURN @newDosage;
END$$

DELIMITER ;

# correct function for medication
USE `depression_diagnosis_treatment_tool`;
DROP procedure IF EXISTS `get_medication_details`;

DELIMITER $$
USE `depression_diagnosis_treatment_tool`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_medication_details`(IN patientID INT, IN visitID INT, 
OUT medicine_id INT, OUT dosage INT, OUT additionalTherapy VARCHAR(200), OUT additionalInstructions VARCHAR(200), OUT medupdate BOOLEAN)
BEGIN

#set base values
SET @physical_test_result = get_physical_health_test_result(patientID,visitId);
SET @depression_assessment_result_type = get_depression_assessment_result(patientID,visitId);

IF (@physical_test_result IS NOT NULL) THEN
	SET @tablename = 'physical_standard_medication_change_map';
    SET @columnname = 'physical_symptom';
    SET @temp = CONCAT('"',@physical_test_result,'"');
ELSEIF (@depression_assessment_result_type > 1) THEN
	SET @tablename = 'standard_medication_change_map';
    SET @columnname = 'depression_type';
    SET @temp = CONCAT('"',@depression_assessment_result_type,'"');
END IF;

SET @prevTreatmentID = (SELECT id 
FROM treatment_plan 
WHERE patient_id = patientID AND visit_id = visitID - 1);

SET @feedbackID = (SELECT id 
FROM patient_feedback
WHERE treatment_id = @prevTreatmentID AND patient_id = patientID);

SET @treatmentSymptomps = 
(SELECT treatment_symptomps 
FROM patient_feedback
WHERE id = @feedbackID);

SET @treatmentSideEffectId = 
	(SELECT id 
    FROM side_effects 
    WHERE Symptoms like CONCAT('%',@treatmentSymptomps,'%'));

SET @treatmentAction = 
	(SELECT Action 
    FROM side_effects
    WHERE id = @treatmentSideEffectId);

SET @currMedicine = 
		(SELECT medication_id FROM treatment_plan
		WHERE id = @prevTreatmentID);

SET @currDosage = 
		(SELECT current_dose FROM treatment_plan
			WHERE id = @prevTreatmentID);

IF(visitID = 1) THEN 
	SET @query1 = CONCAT("SELECT standard_medication_id 
	FROM ", @tablename,
	" WHERE side_effect_id IS NULL AND ",
	@columnname, " like ", @temp, " INTO @result");
	PREPARE stmt FROM @query1 ;
	execute stmt;
	DEALLOCATE PREPARE stmt;
	SET medicine_id = @result;
    SET dosage = calc_dosage(patientID, @prevTreatmentID, medicine_id, true);
ELSEIF (visitID <= 4) THEN
	SET medicine_id = @currMedicine;
    IF(@treatmentSideEffectId IS NOT NULL) THEN 
		SET dosage = calc_dosage(patientID, @prevTreatmentID, medicine_id, true);
	ELSE
		SET dosage = @currDosage;
	END IF;
ELSEIF (visitID > 4) THEN
	IF(@treatmentSideEffectId IS NOT NULL) THEN
			SET @temp2 = CONCAT('"',@treatmentSideEffectId,'"');
			IF(@treatmentAction LIKE "Treat") THEN
				SET medicine_id = @currMedicine;
                SET dosage = calc_dosage(patientID, @prevTreatmentID, medicine_id, true);
                SET @query2 = CONCAT("SELECT treatment_course FROM standard_medication_treat_map
                WHERE side_effect_id LIKE", @temp2, "INTO @result");
                PREPARE stmt FROM @query2 ;
				EXECUTE stmt;
				DEALLOCATE PREPARE stmt;
                SET additionalInstructions = @result;
 
			ELSEIF(@treatmentAction LIKE "Change") THEN
				SET @query2 = CONCAT("SELECT changed_medication_id FROM ", @tablename,
                " WHERE side_effect_id Like ", @temp2," AND ",
                @columnname, " like ", @temp, " INTO @result");
                PREPARE stmt FROM @query2 ;
				EXECUTE stmt;
				DEALLOCATE PREPARE stmt;
                SET medicine_id = @result;
                SET dosage = calc_dosage(patientID, @prevTreatmentID, medicine_id, true);
			END IF;
	ELSE
		SET additionalInstructions = 
        (SELECT additional_instructions FROM treatment_plan  
        WHERE id = @prevTreatmentID);
		SET @depressionDrop = calc_depression_drop_from_prev_visit(patientID);
        SET medicine_id = @currMedicine;
		# here logic for drop will come with all comditions
        IF(@depressionDrop BETWEEN 0 and 1) THEN
			SET dosage = calc_dosage(patientID, @prevTreatmentID, medicine_id, false);
            SET additionalTherapy = "Psycholigical Counselling";
		ELSEIF(@depressionDrop BETWEEN 2 and 4) THEN
			SET dosage = calc_dosage(patientID, @prevTreatmentID, medicine_id, false);
		ELSEIF(@depressionDrop >= 5) THEN
            SET dosage = @currDosage;
		ELSE
            SET dosage = calc_dosage(patientID, @prevTreatmentID, medicine_id, false);
        END IF;
	END IF;  
END IF;

IF(@currMedicine <> medicine_id) THEN
	SET medupdate = true;
ELSE 
	SET medupdate = false;
END IF;#
    
END$$

DELIMITER ;

# Final treatment plan

USE `depression_diagnosis_treatment_tool`;
DROP procedure IF EXISTS `update_treatment_plan`;

DELIMITER $$
USE `depression_diagnosis_treatment_tool`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_treatment_plan`(IN patientID INT, IN visitID INT, OUT success VARCHAR(300))
BEGIN

SET @prevTreatmentID = (SELECT id 
FROM treatment_plan 
WHERE patient_id = patientID AND visit_id = visitID - 1);

SET @currTreatmentID = (SELECT id 
FROM treatment_plan 
WHERE patient_id = patientID AND visit_id = visitID);

SET @feedbackID = (SELECT id 
FROM patient_feedback
WHERE treatment_id = @prevTreatmentID AND patient_id = patientID);

SET @medicineAdherance =
(SELECT medication_dose_followed
FROM patient_feedback
WHERE id = @feedbackID);

SET @patient_education = "";
IF(@medicineAdherance = 0) THEN 
	SET @patient_education = CONCAT(@patient_education, ". Please adhere to the prescribed medicine dosage to get accurate diagnosis and treatment!");	
END IF;

SET @alcohol  =
(SELECT auditC_alcohol
FROM substance_use_test_result
WHERE id IN (
        SELECT substance_use_test_result_id
        FROM diagnosis
        WHERE patient_id = patientID and visit_id = visitID));

SET @smoke  =
(SELECT smoke
FROM substance_use_test_result
WHERE id IN (
        SELECT substance_use_test_result_id
        FROM diagnosis
        WHERE patient_id = patientID and visit_id = visitID));

IF(@alcohol = 1 OR @smoke = 1) THEN
	SET @patient_education = Concat(@patient_education," During course of treatment patient is strictly adviced to reduce alcohol and smoke intake. Please donot mix depression medicines with substance use as they can have hazardous effect!");
END IF;

IF(visitID = 1 OR @medicineAdherance = 1) THEN
	CALL get_medication_details(patientID, visitID, @medicine_id, @dosage, @additionalTherapy,@additionalInstructions, @medupdate);
    SET @diet_plan = get_diet_result(patientID, visitID);
    SET @physical_activity_id = get_physical_acitivity_id(patientID, visitID);
    SET @therapy = get_therapy_result(patientID, visitID);
    IF(@additionalTherapy IS NOT NULL) THEN 
		IF(@therapy NOT LIKE CONCAT('%',@additionalTherapy,'%')) THEN
			SET @therapy = CONCAT(@therapy, " ",@additionalTherapy);
		END IF;
	END IF;
    
	UPDATE treatment_plan
	SET 
	medication_id = @medicine_id,
	current_dose = @dosage,
	therapy_details = @therapy,
	diet_details = @diet_plan,
	physical_activity_id = @physical_activity_id,
    additional_instructions = @additionalInstructions,
    patient_education = @patient_education
	WHERE id = @currTreatmentID;

ELSEIF(visitID > 1 AND @medicineAdherance = 0) THEN

	SELECT medication_id,current_dose,therapy_details,diet_details,physical_activity_id,additional_instructions
    INTO @m, @c,@t,@d,@p,@a
    FROM treatment_plan
    WHERE id = @prevTreatmentID;
    
    UPDATE treatment_plan
	SET 
	medication_id = @m,
	current_dose = @c,
	therapy_details = @t,
	diet_details = @d,
	physical_activity_id = @p,
    additional_instructions = @a,
    patient_education = @patient_education
	WHERE id = @currTreatmentID;    
END IF;

# for the update message
SELECT total_visit into @t FROM patient_visit_view
WHERE patient_id = patientID;

SET @treatment_symptomps = (SELECT treatment_symptomps 
FROM patient_feedback
WHERE id = @feedbackID);


IF(@t= 1) THEN	SET success = "This is patient's first visit related treatmemt";
ELSEIF (@t <  5 AND @treatment_symptomps is not null) THEN 
	SET success =  "Possible medication-updates due to sideeffects";
ELSEIF (@t <  5 AND @treatment_symptomps is null) THEN 
	SET success =  "As visit count is less than 5, no treament updates, only patient response observation";    
ELSE
    #do this only is visit is greater than four
    SET @ddrop = calc_depression_drop_from_prev_visit(patientID);
    IF(@ddrop between 0 and 1) THEN
		SET @treatment_effectiveness_calculation_standard_id = 3;
    ELSEIF(@ddrop between 2 and 4) THEN 
		SET @treatment_effectiveness_calculation_standard_id = 2;
	ELSEIF(@ddrop > 4) THEN
		SET @treatment_effectiveness_calculation_standard_id = 1;
	ELSE
		SET @treatment_effectiveness_calculation_standard_id = null;
	END IF;
    
	SET @patientName = (SELECT user_name FROM patient WHERE id = patientID);

	IF(@treatment_effectiveness_calculation_standard_id IS NOT NULL) THEN 
		SELECT treatment_response, treatment_action
		INTO @tresponse, @taction
		FROM treatment_effectiveness_calculation_standard
		WHERE id = @treatment_effectiveness_calculation_standard_id;
     ELSE 
		SELECT treatment_response, treatment_action
		INTO @tresponse, @taction
		FROM treatment_effectiveness_calculation_standard
		WHERE id = 3;
	END IF;

IF(@treatment_symptomps is not null) THEN
	SET @taction = CONCAT(@taction, " ,However possible medication-updates due to sideeffects");
END IF;    

SET success = CONCAT("Patient:" , @patientName, ", Drop (from previous visit): ", @ddrop, ", Treatment Resonse: ",@tresponse, " ,(NEW)Treatment Action: ",@taction);
END IF; #
END$$

DELIMITER ;

# GRANTS AND PRIVILEGES

#drop user 'doctor'@'localhost';
#drop user 'nurse'@'localhost';
#drop user 'patient'@'localhost';
#flush privileges;
CREATE USER 'doctor'@'localhost' IDENTIFIED BY 'password';
GRANT delete,insert,select,update ON depression_diagnosis_treatment_tool.diagnosis TO 'doctor'@'localhost';
GRANT delete,insert,select,update ON depression_diagnosis_treatment_tool.treatment_plan TO 'doctor'@'localhost';
GRANT delete,insert,select,update ON depression_diagnosis_treatment_tool.patient_visit_view TO 'doctor'@'localhost';
GRANT delete,insert,select,update ON depression_diagnosis_treatment_tool.patient_feedback TO 'doctor'@'localhost';
GRANT delete,insert,select,update ON depression_diagnosis_treatment_tool.patient_visit_view TO 'doctor'@'localhost';

CREATE USER 'nurse'@'localhost' IDENTIFIED BY 'password';
GRANT insert,select ON depression_diagnosis_treatment_tool.depression_assessment TO 'nurse'@'localhost';
GRANT select,update ON depression_diagnosis_treatment_tool.depression_assessment_result TO 'nurse'@'localhost';
GRANT insert,select ON depression_diagnosis_treatment_tool.mental_health_test TO 'nurse'@'localhost';
GRANT select,update ON depression_diagnosis_treatment_tool.mental_health_test_result TO 'nurse'@'localhost';
GRANT insert,select ON depression_diagnosis_treatment_tool.mental_health_test TO 'nurse'@'localhost';
GRANT insert,select ON depression_diagnosis_treatment_tool.nutrition_test TO 'nurse'@'localhost';
GRANT select,update ON depression_diagnosis_treatment_tool.nutrition_test_result TO 'nurse'@'localhost';
GRANT insert,select ON depression_diagnosis_treatment_tool.physical_health_test TO 'nurse'@'localhost';
GRANT select,update ON depression_diagnosis_treatment_tool.physical_health_test_result TO 'nurse'@'localhost';
GRANT insert,select ON depression_diagnosis_treatment_tool.seasonal_affective_disorder_test TO 'nurse'@'localhost';
GRANT select,update ON depression_diagnosis_treatment_tool.seasonal_affective_disorder_test_result TO 'nurse'@'localhost';

CREATE USER 'patient'@'localhost' IDENTIFIED BY 'password';
GRANT select ON depression_diagnosis_treatment_tool.diagnosis TO 'patient'@'localhost';
GRANT select ON depression_diagnosis_treatment_tool.treatment_plan TO 'patient'@'localhost';
GRANT insert ON depression_diagnosis_treatment_tool.patient_feedback TO 'patient'@'localhost';
