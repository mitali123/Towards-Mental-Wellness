# mild to normal to severe to mild again 

#test values
INSERT into patient values (6, "Sid", "pass123");
INSERT INTO medical_history values (6, 0);

# first visit
INSERT INTO visit values (1,6,"enter details here");
INSERT INTO mental_health_test VALUES (null,6,1,3,1,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,6,11);
INSERT INTO depression_assessment VALUES(null,6,14,14);
INSERT INTO nutrition_test values(null,6,3,100,100);
INSERT INTO substance_use_test values(null,6, 5,true);
INSERT INTO physical_health_test VALUES (null,6,19,80,62,25,20,22,200);

CALL store_diagnosis(6,1);
CALL update_treatment_plan(6,1,@success);
SELECT @success;

# second visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sid', true, true, true, 'Seizures');
INSERT INTO visit values (2,6,"enter details here");
INSERT INTO mental_health_test VALUES (null,6,1,3,1,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,6,11);
INSERT INTO depression_assessment VALUES(null,6,13,13);
INSERT INTO nutrition_test values(null,6,3,100,100);
INSERT INTO substance_use_test values(null,6,4,true);
INSERT INTO physical_health_test VALUES (null,6,18,80,62,25,20,22,190);

CALL store_diagnosis(6,2);
CALL update_treatment_plan(6,2,@success);
SELECT @success;

# third visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sid', true, true, true, NULL);
INSERT INTO visit values (3,6,"enter details here");
INSERT INTO mental_health_test VALUES (null,6,1,3,1,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,6,11);
INSERT INTO depression_assessment VALUES(NULL,6,12,12);
INSERT INTO nutrition_test values(NULL,6,3,100,100);
INSERT INTO substance_use_test values(NULL,6,4,false);
INSERT INTO physical_health_test VALUES (NULL,6,17,80,62,25,20,22,180);

CALL store_diagnosis(6,3);
CALL update_treatment_plan(6,3,@success);
SELECT @success;

# fourth visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sid', true, true, true, NULL);
INSERT INTO visit values (4,6,"enter details here");
INSERT INTO mental_health_test VALUES (NULL,6,1,3,1,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (NULL,6,11);
INSERT INTO depression_assessment VALUES(NULL,6,11,11);
INSERT INTO nutrition_test values(NULL,6,3,100,100);
INSERT INTO substance_use_test values(NULL,6, 3,false);
INSERT INTO physical_health_test VALUES (NULL,6,16,80,62,25,20,22,170);

CALL store_diagnosis(6,4);	
CALL update_treatment_plan(6,4,@success);
SELECT @success;

# fifth visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sid', true, true, true, NULL);
INSERT INTO visit values (5,6,"enter details here");
INSERT INTO mental_health_test VALUES (null,6,1,2,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,6,11);
INSERT INTO depression_assessment VALUES(null,6,10,10);
INSERT INTO nutrition_test values(null,6,8,220,150);
INSERT INTO substance_use_test values(null,6, 2,false);
INSERT INTO physical_health_test VALUES (null,6,15,80,62,25,20,22,160);


CALL store_diagnosis(6,5);
CALL update_treatment_plan(6,5,@success);
SELECT @success;

# sixth visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sid', true, true, true, NULL);
INSERT INTO visit values (6,6,"enter details here");
INSERT INTO mental_health_test VALUES (null,6,1,2,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,6,11);
INSERT INTO depression_assessment VALUES(null,6,18,9);
INSERT INTO nutrition_test values(null,6,8,220,150);
INSERT INTO substance_use_test values(null,6, 2,false);
INSERT INTO physical_health_test VALUES (null,6,14,80,62,25,20,22,150);


CALL store_diagnosis(6,6);
CALL update_treatment_plan(6,6,@success);
SELECT @success;

# seventh visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sid', true, true, true, NULL);
INSERT INTO visit values (7,6,"enter details here");
INSERT INTO mental_health_test VALUES (null,6,1,2,0,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,6,11);
INSERT INTO depression_assessment VALUES(null,6,16,23);
INSERT INTO nutrition_test values(null,6,8,220,150);
INSERT INTO substance_use_test values(null,6, 1,false);
INSERT INTO physical_health_test VALUES (null,6,13,80,62,25,20,22,140);

CALL store_diagnosis(6,7);
CALL update_treatment_plan(6,7,@success);
SELECT @success;

#do it from here
#8th 

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sid', true, true, true, NULL);
INSERT INTO visit values (8,6,"enter details here");
INSERT INTO mental_health_test VALUES (null,6,1,2,0,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,6,11);
INSERT INTO depression_assessment VALUES(null,6,14,14);
INSERT INTO nutrition_test values(null,6,8,220,150);
INSERT INTO substance_use_test values(null,6, 1,false);
INSERT INTO physical_health_test VALUES (null,6,12,80,62,25,20,22,140);

CALL store_diagnosis(6,8);
CALL update_treatment_plan(6,8,@success);
SELECT @success;

#9th
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sid', true, true, true, Null);

INSERT INTO visit values (9,6,"enter details here");
INSERT INTO mental_health_test VALUES (null,6,1,2,0,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,6,11);
INSERT INTO depression_assessment VALUES(null,6,13,13);
INSERT INTO nutrition_test values(null,6,8,220,150);
INSERT INTO substance_use_test values(null,6, 1,false);
INSERT INTO physical_health_test VALUES (null,6,12,80,62,25,20,22,135);

CALL store_diagnosis(6,9);
CALL update_treatment_plan(6,9,@success);
SELECT @success;

#10th
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sid', true, true, true, "Fall Risk");

INSERT INTO visit values (10,6,"enter details here");
INSERT INTO mental_health_test VALUES (null,6,1,2,0,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,6,11);
INSERT INTO depression_assessment VALUES(null,6,12,12);
INSERT INTO nutrition_test values(null,6,8,220,150);
INSERT INTO substance_use_test values(null,6, 1,false);
INSERT INTO physical_health_test VALUES (null,6,12,80,62,25,20,22,130);

CALL store_diagnosis(6,10);
CALL update_treatment_plan(6,10,@success);
SELECT @success;

#11th
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sid', true, true, true, NULL);

INSERT INTO visit values (11,6,"enter details here");
INSERT INTO mental_health_test VALUES (null,6,1,2,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,6,11);
INSERT INTO depression_assessment VALUES(null,6,11,11);
INSERT INTO nutrition_test values(null,6,8,220,150);
INSERT INTO substance_use_test values(null,6, 1,false);
INSERT INTO physical_health_test VALUES (null,6,12,80,62,25,20,22,130);

CALL store_diagnosis(6,11);
CALL update_treatment_plan(6,11,@success);
SELECT @success;

#12th
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sid', true, true, true, NULL);

INSERT INTO visit values (12,6,"enter details here");
INSERT INTO mental_health_test VALUES (null,6,1,2,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,6,11);
INSERT INTO depression_assessment VALUES(null,6,10,10);
INSERT INTO nutrition_test values(null,6,8,220,150);
INSERT INTO substance_use_test values(null,6,1,false);
INSERT INTO physical_health_test VALUES (null,6,12,80,62,25,20,22,130);

CALL store_diagnosis(6,12);
CALL update_treatment_plan(6,12,@success);
SELECT @success;


#13th
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sid', true, true, true, NULL);

INSERT INTO visit values (13,6,"enter details here");
INSERT INTO mental_health_test VALUES (null,6,1,2,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,6,11);
INSERT INTO depression_assessment VALUES(null,6,8,8);
INSERT INTO nutrition_test values(null,6,8,220,150);
INSERT INTO substance_use_test values(null,6,1,false);
INSERT INTO physical_health_test VALUES (null,6,12,80,62,25,20,22,130);


CALL store_diagnosis(6,13);
CALL update_treatment_plan(6,13,@success);
SELECT @success;

#14th
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sid', true, true, true, NULL);

INSERT INTO visit values (14,6,"enter details here");
INSERT INTO mental_health_test VALUES (null,6,1,2,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,6,11);
INSERT INTO depression_assessment VALUES(null,6,3,3);
INSERT INTO nutrition_test values(null,6,8,220,150);
INSERT INTO substance_use_test values(null,6,1,false);
INSERT INTO physical_health_test VALUES (null,6,12,80,62,25,20,22,120);


CALL store_diagnosis(6,14);
CALL update_treatment_plan(6,14,@success);
SELECT @success;