# patient No 5

# first visit
INSERT into patient values (5, "Sam", "pqr");
INSERT INTO medical_history values (5, 0);
# first visit
INSERT INTO visit values (1,5,"enter details here");
INSERT INTO mental_health_test VALUES (null,5,1,4,1,1,0); 
INSERT INTO seasonal_affective_disorder_test VALUES (null,5,11); 
INSERT INTO depression_assessment VALUES(null,5,20,20);
INSERT INTO nutrition_test values(null,5,3,150,120); 
INSERT INTO substance_use_test values(null,5, 5,true); 
INSERT INTO physical_health_test VALUES (null,5,2,120,65,22,20,22,120);
CALL store_diagnosis(5,1);
CALL update_treatment_plan(5,1,@success);
SELECT @success;


#visit 2
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sam', true, true, true, null);
INSERT INTO visit values (2,5,"enter details here");
INSERT INTO mental_health_test VALUES (null,5,1,7,1,1,0); 
INSERT INTO seasonal_affective_disorder_test VALUES (null,5,15); 
INSERT INTO depression_assessment VALUES(null,5,19,19);
INSERT INTO nutrition_test values(null,5,7,220,150); 
INSERT INTO substance_use_test values(null,5, 5,true); 
INSERT INTO physical_health_test VALUES (null,5,2,87,65,22,20,22,120); 
CALL store_diagnosis(5,2);
CALL update_treatment_plan(5,2,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sam', true, true, true, null);
INSERT INTO visit values (3,5,"enter details here");
INSERT INTO mental_health_test VALUES (null,5,1,7,1,1,0); 
INSERT INTO seasonal_affective_disorder_test VALUES (null,5,15); 
INSERT INTO depression_assessment VALUES(null,5,19,19);
INSERT INTO nutrition_test values(null,5,7,220,150); 
INSERT INTO substance_use_test values(null,5, 5,true); 
INSERT INTO physical_health_test VALUES (null,5,2,87,65,22,20,22,120); 
CALL store_diagnosis(5,3);
CALL update_treatment_plan(5,3,@success);
SELECT @success;
#visit 4
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sam', true, true, true, null);
INSERT INTO visit values (4,5,"enter details here");
INSERT INTO mental_health_test VALUES (null,5,1,7,1,1,0); 
INSERT INTO seasonal_affective_disorder_test VALUES (null,5,15); 
INSERT INTO depression_assessment VALUES(null,5,19,19);
INSERT INTO nutrition_test values(null,5,7,220,150); 
INSERT INTO substance_use_test values(null,5, 5,true); 
INSERT INTO physical_health_test VALUES (null,5,2,87,65,22,20,22,120);
CALL store_diagnosis(5,4);
CALL update_treatment_plan(5,4,@success);
SELECT @success;


#visit 5
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sam', false, true, true, null);
INSERT INTO visit values (5,5,"enter details here");
INSERT INTO mental_health_test VALUES (null,5,1,7,1,1,0); 
INSERT INTO seasonal_affective_disorder_test VALUES (null,5,15); 
INSERT INTO depression_assessment VALUES(null,5,15,15);
INSERT INTO nutrition_test values(null,5,7,220,150); 
INSERT INTO substance_use_test values(null,5, 5,true); 
INSERT INTO physical_health_test VALUES (null,5,2,87,65,22,20,22,120); 
#CALL store_diagnosis(#patient_id,#visit_id)
CALL store_diagnosis(5,5);
CALL update_treatment_plan(5,5,@success);
SELECT @success;

#--------------------------------------------------------------------------------------------------
#visit 6
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sam', true, true, true, 'Erectile dysfunction');
INSERT INTO visit values (6,5,"enter details here");
INSERT INTO mental_health_test VALUES (null,5,1,7,1,1,0); 
INSERT INTO seasonal_affective_disorder_test VALUES (null,5,15); 
INSERT INTO depression_assessment VALUES(null,5,15,15);
INSERT INTO nutrition_test values(null,5,7,220,150);
INSERT INTO substance_use_test values(null,5, 5,true); 
INSERT INTO physical_health_test VALUES (null,5,2,87,65,22,20,22,120); 
CALL store_diagnosis(5,6);
CALL update_treatment_plan(5,6,@success);
SELECT @success;

#visit 7
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sam', true, true, true, null);
INSERT INTO visit values (7,5,"enter details here");
INSERT INTO mental_health_test VALUES (null,5,1,7,1,1,0); 
INSERT INTO seasonal_affective_disorder_test VALUES (null,5,15); 
INSERT INTO depression_assessment VALUES(null,5,14,14);
INSERT INTO nutrition_test values(null,5,7,220,150); 
INSERT INTO substance_use_test values(null,5, 5,true); 
INSERT INTO physical_health_test VALUES (null,5,2,87,65,22,20,22,120); 
CALL store_diagnosis(5,7);
CALL update_treatment_plan(5,7,@success);
SELECT @success;

#visit 8
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sam', true, true, true, null);
INSERT INTO visit values (8,5,"enter details here");
INSERT INTO mental_health_test VALUES (null,5,1,7,1,1,0); 
INSERT INTO seasonal_affective_disorder_test VALUES (null,5,15); 
INSERT INTO depression_assessment VALUES(null,5,12,12);
INSERT INTO nutrition_test values(null,5,7,220,150); 
INSERT INTO substance_use_test values(null,5, 5,true); 
INSERT INTO physical_health_test VALUES (null,5,2,87,65,22,20,22,120);
CALL store_diagnosis(5,8);
CALL update_treatment_plan(5,8,@success);
SELECT @success;

#visit 9

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sam', true, true, true, null);
INSERT INTO visit values (9,5,"enter details here");
INSERT INTO mental_health_test VALUES (null,5,1,7,1,1,0); 
INSERT INTO seasonal_affective_disorder_test VALUES (null,5,15); 
INSERT INTO depression_assessment VALUES(null,5,12,12);
INSERT INTO nutrition_test values(null,5,7,220,150); 
INSERT INTO substance_use_test values(null,5, 5,true); 
INSERT INTO physical_health_test VALUES (null,5,2,87,65,22,20,22,120); 
CALL store_diagnosis(5,9);
CALL update_treatment_plan(5,9,@success);
SELECT @success;

#visit 10

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Sam', true, true, true, null);
INSERT INTO visit values (10,5,"enter details here");
INSERT INTO mental_health_test VALUES (null,5,0,5,0,1,0); 
INSERT INTO seasonal_affective_disorder_test VALUES (null,5,15); 
INSERT INTO depression_assessment VALUES(null,5,9,9);
INSERT INTO nutrition_test values(null,5,7,220,150);
INSERT INTO substance_use_test values(null,5,5,true); 
INSERT INTO physical_health_test VALUES (null,5,2,80,65,22,20,22,120); 
CALL store_diagnosis(5,10);
CALL update_treatment_plan(5,10,@success);
SELECT @success;