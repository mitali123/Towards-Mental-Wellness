INSERT into patient values (3, "Srishti","123");
INSERT INTO medical_history values (3, 0);

# first visit
INSERT INTO visit values (1,3,"enter details here");
INSERT INTO mental_health_test VALUES (null,3,1,4,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,3,11);
INSERT INTO depression_assessment VALUES(null,3,20,20);
INSERT INTO nutrition_test values(null,3,3,150,120);
INSERT INTO substance_use_test values(null,3, 5,true);
INSERT INTO physical_health_test VALUES (null,3,2,120,65,22,20,22,120);
#CALL store_diagnosis(#patient_id,#visit_id)
CALL store_diagnosis(3,1);
CALL update_treatment_plan(3,1,@success);
SELECT @success;
# during next visit, first take feedback of previous visit
#visit 2
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Srishti', true, true, true, 'Arrhythmias');
INSERT INTO visit values (2,3,"enter details here");
INSERT INTO mental_health_test VALUES (null,3,1,4,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,3,11);
INSERT INTO depression_assessment VALUES(null,3,20,20);
INSERT INTO nutrition_test values(null,3,3,150,120);
INSERT INTO substance_use_test values(null,3, 5,true);
INSERT INTO physical_health_test VALUES (null,3,2,120,65,22,20,22,120);
#CALL store_diagnosis(#patient_id,#visit_id)
CALL store_diagnosis(3,2);
CALL update_treatment_plan(3,2,@success);
SELECT @success;
#visit 3
SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Srishti', true, true, true, 'Arrhythmias');
INSERT INTO visit values (3,3,"enter details here");
INSERT INTO mental_health_test VALUES (null,3,1,4,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,3,11);
INSERT INTO depression_assessment VALUES(null,3,20,20);
INSERT INTO nutrition_test values(null,3,3,150,120);
INSERT INTO substance_use_test values(null,3, 5,true);
INSERT INTO physical_health_test VALUES (null,3,2,120,65,22,20,22,120);
#CALL store_diagnosis(#patient_id,#visit_id)
CALL store_diagnosis(3,3);
CALL update_treatment_plan(3,3,@success);
SELECT @success;
# Visit 4
select depression_diagnosis_treatment_tool.patient_gives_feedback('Srishti', true, true, true, null);
#id, patient id, details
INSERT INTO visit values (4,3,"enter details here");
INSERT INTO mental_health_test VALUES (null,3,1,4,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,3,11);
INSERT INTO depression_assessment VALUES(null,3,20,20);
INSERT INTO nutrition_test values(null,3,3,150,120);
INSERT INTO substance_use_test values(null,3, 5,true);
INSERT INTO physical_health_test VALUES (null,3,2,120,65,22,20,22,120);
#CALL store_diagnosis(#patient_id,#visit_id)
CALL store_diagnosis(3,4);
CALL update_treatment_plan(3,4,@success);
SELECT @success;
#visit 5
select depression_diagnosis_treatment_tool.patient_gives_feedback('Srishti', true, true, true, null);
INSERT INTO visit values (5,3,"enter details here");
INSERT INTO mental_health_test VALUES (null,3,1,4,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,3,11);
INSERT INTO depression_assessment VALUES(null,3,18,18);
INSERT INTO nutrition_test values(null,3,3,150,120);
INSERT INTO substance_use_test values(null,3, 5,true);
INSERT INTO physical_health_test VALUES (null,3,2,110,63,25,22,21,127);
CALL store_diagnosis(3,5);
CALL update_treatment_plan(3,5,@success);
SELECT @success;
#visit 6
select depression_diagnosis_treatment_tool.patient_gives_feedback('Srishti', true, true, true, null);
INSERT INTO visit values (6,3,"enter details here");
INSERT INTO mental_health_test VALUES (null,3,1,4,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,3,11);
INSERT INTO depression_assessment VALUES(null,3,16,16);
INSERT INTO nutrition_test values(null,3,4,180,135);
INSERT INTO substance_use_test values(null,3, 5,true);
INSERT INTO physical_health_test VALUES (null,3,2,110,63,25,22,21,127);
CALL store_diagnosis(3,6);
CALL update_treatment_plan(3,6,@success);
SELECT @success;
#visit 7
select depression_diagnosis_treatment_tool.patient_gives_feedback('Srishti', true, true, true, null);
INSERT INTO visit values (7,3,"enter details here");
INSERT INTO mental_health_test VALUES (null,3,1,4,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,3,11);
INSERT INTO depression_assessment VALUES(null,3,15,15);
INSERT INTO nutrition_test values(null,3,4,180,135);
INSERT INTO substance_use_test values(null,3, 5,true);
INSERT INTO physical_health_test VALUES (null,3,2,101,63,25,22,21,127);
CALL store_diagnosis(3,7);
CALL update_treatment_plan(3,7,@success);
SELECT @success;
#visit 8
select depression_diagnosis_treatment_tool.patient_gives_feedback('Srishti', true, true, true, null);
INSERT INTO visit values (8,3,"enter details here");
INSERT INTO mental_health_test VALUES (null,3,0,3,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,3,13);
INSERT INTO depression_assessment VALUES(null,3,11,11);
INSERT INTO nutrition_test values(null,3,4,180,135);
INSERT INTO substance_use_test values(null,3, 4,true);
INSERT INTO physical_health_test VALUES (null,3,2,101,63,25,22,21,127);
CALL store_diagnosis(3,8);
CALL update_treatment_plan(3,8,@success);
SELECT @success;
#visit 9
select depression_diagnosis_treatment_tool.patient_gives_feedback('Srishti', true, true, true, null);
INSERT INTO visit values (9,3,"enter details here");
INSERT INTO mental_health_test VALUES (null,3,0,3,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,3,13);
INSERT INTO depression_assessment VALUES(null,3,11,11);
INSERT INTO nutrition_test values(null,3,4,180,135);
INSERT INTO substance_use_test values(null,3, 4,true);
INSERT INTO physical_health_test VALUES (null,3,2,95,63,25,22,21,127);
CALL store_diagnosis(3,9);
CALL update_treatment_plan(3,9,@success);
SELECT @success;
#visit 10
select depression_diagnosis_treatment_tool.patient_gives_feedback('Srishti', true, true, true, null );
INSERT INTO visit values (10,3,"enter details here");
INSERT INTO mental_health_test VALUES (null,3,0,3,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,3,13);
INSERT INTO depression_assessment VALUES(null,3,8,8);
INSERT INTO nutrition_test values(null,3,6,210,144);
INSERT INTO substance_use_test values(null,3, 4,true);
INSERT INTO physical_health_test VALUES (null,3,2,95,63,25,22,21,127);
CALL store_diagnosis(3,10);
CALL update_treatment_plan(3,10,@success);
SELECT @success;
#visit 11
select depression_diagnosis_treatment_tool.patient_gives_feedback('Srishti', true, true, true, null);
INSERT INTO visit values (11,3,"enter details here");
INSERT INTO mental_health_test VALUES (null,3,0,3,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,3,13);
INSERT INTO depression_assessment VALUES(null,3,6,6);
INSERT INTO nutrition_test values(null,3,6,210,144);
INSERT INTO substance_use_test values(null,3, 4,false);
INSERT INTO physical_health_test VALUES (null,3,2,89,63,25,22,21,127);
CALL store_diagnosis(3,11);
CALL update_treatment_plan(3,11,@success);
SELECT @success;
#Visit 12
select depression_diagnosis_treatment_tool.patient_gives_feedback('Srishti', true, true, true, null);
INSERT INTO visit values (12,3,"enter details here");
INSERT INTO mental_health_test VALUES (null,3,0,3,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,3,13);
INSERT INTO depression_assessment VALUES(null,3,1,1);
#id , patient id, phq9_self_assessment_score, phq9_social_media_score
INSERT INTO nutrition_test values(null,3,6,210,144);
INSERT INTO substance_use_test values(null,3, 4,false);
INSERT INTO physical_health_test VALUES (null,3,2,89,63,25,22,21,127);
CALL store_diagnosis(3,12);
CALL update_treatment_plan(3,12,@success);
SELECT @success;