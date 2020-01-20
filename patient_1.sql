INSERT INTO patient values (1, "Dharini","password");
INSERT INTO medical_history values (1, 1);
# first visit
INSERT INTO visit values (1,1,"enter details here");
INSERT INTO mental_health_test VALUES (1,1,1,4,1,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (1,1,11);
INSERT INTO depression_assessment VALUES(1,1,24,26);
INSERT INTO nutrition_test values(1,1,8,180,150);
INSERT INTO substance_use_test values(1,1, 1,true);
INSERT INTO physical_health_test VALUES (1,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,1);
CALL update_treatment_plan(1,1,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', true, true, true, 'Headache');
INSERT INTO visit values (2,1,"enter details here");
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,24,26);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,2);
CALL update_treatment_plan(1,2,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', false, true, true, null);
INSERT INTO visit values (3,1,"enter details here");
INSERT INTO nutrition_test values(null,1,8,180,150);
INSERT INTO seasonal_affective_disorder_test VALUES (null,1,11);
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,24,26);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,3);
CALL update_treatment_plan(1,3,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', true, true, true, null);
INSERT INTO visit values (4,1,"enter details here");
INSERT INTO nutrition_test values(null,1,8,180,150);
INSERT INTO seasonal_affective_disorder_test VALUES (null,1,11);
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,24,26);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,4);
CALL update_treatment_plan(1,4,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', true, true, true, 'Headache');
INSERT INTO visit values (5,1,"enter details here");
INSERT INTO nutrition_test values(null,1,8,180,150);
INSERT INTO seasonal_affective_disorder_test VALUES (null,1,11);
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,24,26);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,5);
CALL update_treatment_plan(1,5,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', true, true, true, null);
INSERT INTO visit values (6,1,"enter details here");
INSERT INTO nutrition_test values(null,1,8,180,150);
INSERT INTO seasonal_affective_disorder_test VALUES (null,1,11);
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,24,22);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,6);
CALL update_treatment_plan(1,6,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', true, true, true, null);
INSERT INTO visit values (7,1,"enter details here");
INSERT INTO nutrition_test values(null,1,8,180,150);
INSERT INTO seasonal_affective_disorder_test VALUES (null,1,11);
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,24,22);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,7);
CALL update_treatment_plan(1,7,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', true, true, true, null);
INSERT INTO visit values (8,1,"enter details here");
INSERT INTO nutrition_test values(null,1,8,180,150);
INSERT INTO seasonal_affective_disorder_test VALUES (null,1,11);
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,24,22);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,8);
CALL update_treatment_plan(1,8,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', true, true, true, null);
INSERT INTO visit values (9,1,"enter details here");
INSERT INTO nutrition_test values(null,1,8,180,150);
INSERT INTO seasonal_affective_disorder_test VALUES (null,1,11);
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,20,18);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,9);
CALL update_treatment_plan(1,9,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', true, true, true, null);
INSERT INTO visit values (10,1,"enter details here");
INSERT INTO nutrition_test values(null,1,8,180,150);
INSERT INTO seasonal_affective_disorder_test VALUES (null,1,11);
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,20,18);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,10);
CALL update_treatment_plan(1,10,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', true, true, true, null);
INSERT INTO visit values (11,1,"enter details here");
INSERT INTO nutrition_test values(null,1,8,180,150);
INSERT INTO seasonal_affective_disorder_test VALUES (null,1,11);
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,20,18);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,11);
CALL update_treatment_plan(1,11,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', true, true, true, null);
INSERT INTO visit values (12,1,"enter details here");
INSERT INTO nutrition_test values(null,1,8,180,150);
INSERT INTO seasonal_affective_disorder_test VALUES (null,1,11);
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,14,18);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,12);
CALL update_treatment_plan(1,12,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', true, true, true, 'Migraine');
INSERT INTO visit values (13,1,"enter details here");
INSERT INTO nutrition_test values(null,1,8,180,150);
INSERT INTO seasonal_affective_disorder_test VALUES (null,1,11);
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,14,18);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,13);
CALL update_treatment_plan(1,13,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', false, true, true, null);
INSERT INTO visit values (14,1,"enter details here");
INSERT INTO nutrition_test values(null,1,8,180,150);
INSERT INTO seasonal_affective_disorder_test VALUES (null,1,11);
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,14,18);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,14);
CALL update_treatment_plan(1,14,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', true, true, true, null);
INSERT INTO visit values (15,1,"enter details here");
INSERT INTO nutrition_test values(null,1,8,180,150);
INSERT INTO seasonal_affective_disorder_test VALUES (null,1,11);
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,14,18);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,15);
CALL update_treatment_plan(1,15,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Dharini', true, true, true, null);
INSERT INTO visit values (16,1,"enter details here");
INSERT INTO nutrition_test values(null,1,8,180,150);
INSERT INTO seasonal_affective_disorder_test VALUES (null,1,11);
INSERT INTO mental_health_test VALUES (null,1,1,4,1,0,0);
INSERT INTO depression_assessment VALUES(null,1,11,10);
INSERT INTO substance_use_test values(null,1, 4,true);
INSERT INTO physical_health_test VALUES (null,1,4,65,85,30,19,24,100);
CALL store_diagnosis(1,16);
CALL update_treatment_plan(1,16,@success);
SELECT @success;

# patient statistics
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
                   on r.phq9_depression_type_id = s.id;