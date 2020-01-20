# severe to normal

#test values
INSERT into patient values (2, "Ayush", "abcd");
INSERT INTO medical_history values (2, 0);

# first visit
INSERT INTO visit values (1,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,1,3,1,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,25,25);
INSERT INTO nutrition_test values(null,2,8,190,150);
INSERT INTO substance_use_test values(null,2, 5,true);
INSERT INTO physical_health_test VALUES (null,2,19,80,62,25,20,22,120);

CALL store_diagnosis(2,1);
CALL update_treatment_plan(2,1,@success);
SELECT @success;

# second visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, 'Osteopenia');
INSERT INTO visit values (2,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,1,3,1,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,23,23);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 5,true);
INSERT INTO physical_health_test VALUES (null,2,18,80,62,25,20,22,120);


CALL store_diagnosis(2,2);
CALL update_treatment_plan(2,2,@success);
SELECT @success;

# third visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, NULL);
INSERT INTO visit values (3,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,1,3,1,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,22,22);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 3,false);
INSERT INTO physical_health_test VALUES (null,2,17,80,62,25,20,22,120);

CALL store_diagnosis(2,3);
CALL update_treatment_plan(2,3,@success);
SELECT @success;

# fourth visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, 'Priapism');
INSERT INTO visit values (4,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,1,3,1,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,20,20);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 3,false);
INSERT INTO physical_health_test VALUES (null,2,16,80,62,25,20,22,120);

CALL store_diagnosis(2,4);
CALL update_treatment_plan(2,4,@success);
SELECT @success;

# fifth visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, NULL);
INSERT INTO visit values (5,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,1,2,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,19,19);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 2,false);
INSERT INTO physical_health_test VALUES (null,2,15,80,62,25,20,22,120);


CALL store_diagnosis(2,5);
CALL update_treatment_plan(2,5,@success);
SELECT @success;

# sixth visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, NULL);
INSERT INTO visit values (6,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,1,2,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,18,18);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 2,false);
INSERT INTO physical_health_test VALUES (null,2,14,80,62,25,20,22,120);


CALL store_diagnosis(2,6);
CALL update_treatment_plan(2,6,@success);
SELECT @success;

# seventh visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, NULL);
INSERT INTO visit values (7,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,1,2,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,16,16);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 1,false);
INSERT INTO physical_health_test VALUES (null,2,13,80,62,25,20,22,120);

CALL store_diagnosis(2,7);
CALL update_treatment_plan(2,7,@success);
SELECT @success;


# eighth visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, NULL);
INSERT INTO visit values (8,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,1,2,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,14,14);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 1,false);
INSERT INTO physical_health_test VALUES (null,2,12,80,62,25,20,22,120);

CALL store_diagnosis(2,8);
CALL update_treatment_plan(2,8,@success);
SELECT @success;

# nineth visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, NULL);
INSERT INTO visit values (9,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,0,0,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,13,13);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 0,false);
INSERT INTO physical_health_test VALUES (null,2,11,80,62,25,20,22,120);

CALL store_diagnosis(2,9);
CALL update_treatment_plan(2,9,@success);
SELECT @success;

# tenth visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, NULL);
INSERT INTO visit values (10,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,0,0,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,12,12);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 0,false);
INSERT INTO physical_health_test VALUES (null,2,10,80,62,25,20,22,120);

CALL store_diagnosis(2,10);
CALL update_treatment_plan(2,10,@success);
SELECT @success;

# eleventh visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, NULL);
INSERT INTO visit values (11,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,0,0,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,10,10);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 0,false);
INSERT INTO physical_health_test VALUES (null,2,9,80,62,25,20,22,120);

CALL store_diagnosis(2,11);
CALL update_treatment_plan(2,11,@success);
SELECT @success;

# twelth visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, NULL);
INSERT INTO visit values (12,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,0,0,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,9,9);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 0,false);
INSERT INTO physical_health_test VALUES (null,2,8,80,62,25,20,22,120);

CALL store_diagnosis(2,12);
CALL update_treatment_plan(2,12,@success);
SELECT @success;

# thirteenth visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, NULL);
INSERT INTO visit values (13,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,0,0,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,8,8);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 0,false);
INSERT INTO physical_health_test VALUES (null,2,7,80,62,25,20,22,120);


CALL store_diagnosis(2,13);
CALL update_treatment_plan(2,13,@success);
SELECT @success;

# fourteen visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, NULL);
INSERT INTO visit values (14,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,0,0,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,6,6);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 0,false);
INSERT INTO physical_health_test VALUES (null,2,6,80,62,25,20,22,120);

CALL store_diagnosis(2,14);
CALL update_treatment_plan(2,14,@success);
SELECT @success;

# fifteen visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, NULL);
INSERT INTO visit values (15,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,0,0,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,5,5);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 0,false);
INSERT INTO physical_health_test VALUES (null,2,5,80,62,25,20,22,120);

CALL store_diagnosis(2,15);
CALL update_treatment_plan(2,15,@success);
SELECT @success;

# sixteenth visit
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Ayush', true, true, true, NULL);
INSERT INTO visit values (16,2,"enter details here");
INSERT INTO mental_health_test VALUES (null,2,0,0,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,2,11);
INSERT INTO depression_assessment VALUES(null,2,3,3);
INSERT INTO nutrition_test values(null,2,8,220,150);
INSERT INTO substance_use_test values(null,2, 0,false);
INSERT INTO physical_health_test VALUES (null,2,4,80,62,25,20,22,120);


CALL store_diagnosis(2,16);
CALL update_treatment_plan(2,16,@success);
SELECT @success;