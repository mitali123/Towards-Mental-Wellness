INSERT into patient values (4, "Tanuj","123456");
INSERT INTO medical_history values (4, 0);

INSERT INTO visit values (1,4,"enter details here");
INSERT INTO mental_health_test VALUES (null,4,0,0,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,4,8);
INSERT INTO depression_assessment VALUES(null,4,20,19);
INSERT INTO nutrition_test values(null,4,8,250,150);
INSERT INTO substance_use_test values(null,4,4,false);
INSERT INTO physical_health_test VALUES (null,4,4,65,85,30,19,24,100);
CALL store_diagnosis(4,1);
CALL update_treatment_plan(4,1,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Tanuj', true, true, true, 'Muscle Tremors');
INSERT INTO visit values (2,4,"enter details here");
INSERT INTO mental_health_test VALUES (null,4,0,0,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,4,8);
INSERT INTO depression_assessment VALUES(null,4,20,19);
INSERT INTO nutrition_test values(null,4,8,250,150);
INSERT INTO substance_use_test values(null,4,4,false);
INSERT INTO physical_health_test VALUES (null,4,4,65,85,30,19,24,100);
CALL store_diagnosis(4,2);
CALL update_treatment_plan(4,2,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Tanuj', true, true, true, null);
INSERT INTO visit values (3,4,"enter details here");
INSERT INTO mental_health_test VALUES (null,4,0,0,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,4,8);
INSERT INTO depression_assessment VALUES(null,4,20,19);
INSERT INTO nutrition_test values(null,4,8,250,150);
INSERT INTO substance_use_test values(null,4,4,false);
INSERT INTO physical_health_test VALUES (null,4,4,65,85,30,19,24,100);
CALL store_diagnosis(4,3);
CALL update_treatment_plan(4,3,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Tanuj', false, true, true, null);
INSERT INTO visit values (4,4,"enter details here");
INSERT INTO mental_health_test VALUES (null,4,0,0,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,4,8);
INSERT INTO depression_assessment VALUES(null,4,20,19);
INSERT INTO nutrition_test values(null,4,8,250,150);
INSERT INTO substance_use_test values(null,4,4,false);
INSERT INTO physical_health_test VALUES (null,4,4,65,85,30,19,24,100);
CALL store_diagnosis(4,4);
CALL update_treatment_plan(4,4,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Tanuj', true, true, true, null);
INSERT INTO visit values (5,4,"enter details here");
INSERT INTO mental_health_test VALUES (null,4,0,0,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,4,8);
INSERT INTO depression_assessment VALUES(null,4,20,19);
INSERT INTO nutrition_test values(null,4,8,250,150);
INSERT INTO substance_use_test values(null,4,4,false);
INSERT INTO physical_health_test VALUES (null,4,4,65,85,30,19,24,100);
CALL store_diagnosis(4,5);
CALL update_treatment_plan(4,5,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Tanuj', true, true, true, null);
INSERT INTO visit values (6,4,"enter details here");
INSERT INTO mental_health_test VALUES (null,4,0,0,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,4,8);
INSERT INTO depression_assessment VALUES(null,4,15,17);
INSERT INTO nutrition_test values(null,4,8,250,150);
INSERT INTO substance_use_test values(null,4,4,false);
INSERT INTO physical_health_test VALUES (null,4,4,65,85,30,19,24,100);
CALL store_diagnosis(4,6);
CALL update_treatment_plan(4,6,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Tanuj', true, true, true, 'Headache');
INSERT INTO visit values (7,4,"enter details here");
INSERT INTO mental_health_test VALUES (null,4,0,0,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,4,8);
INSERT INTO depression_assessment VALUES(null,4,13,15);
INSERT INTO nutrition_test values(null,4,8,250,150);
INSERT INTO substance_use_test values(null,4,4,false);
INSERT INTO physical_health_test VALUES (null,4,4,65,85,30,19,24,100);
CALL store_diagnosis(4,7);
CALL update_treatment_plan(4,7,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Tanuj', true, true, true, null);
INSERT INTO visit values (8,4,"enter details here");
INSERT INTO mental_health_test VALUES (null,4,0,0,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,4,8);
INSERT INTO depression_assessment VALUES(null,4,13,13);
INSERT INTO nutrition_test values(null,4,8,250,150);
INSERT INTO substance_use_test values(null,4,4,false);
INSERT INTO physical_health_test VALUES (null,4,4,65,85,30,19,24,100);
CALL store_diagnosis(4,8);
CALL update_treatment_plan(4,8,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Tanuj', true, true, true, null);
INSERT INTO visit values (9,4,"enter details here");
INSERT INTO mental_health_test VALUES (null,4,0,0,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,4,8);
INSERT INTO depression_assessment VALUES(null,4,13,13);
INSERT INTO nutrition_test values(null,4,8,250,150);
INSERT INTO substance_use_test values(null,4,4,false);
INSERT INTO physical_health_test VALUES (null,4,4,65,85,30,19,24,100);
CALL store_diagnosis(4,9);
CALL update_treatment_plan(4,9,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Tanuj', true, true, true, null);
INSERT INTO visit values (10,4,"enter details here");
INSERT INTO mental_health_test VALUES (null,4,0,0,1,1,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,4,8);
INSERT INTO depression_assessment VALUES(null,4,10,10);
INSERT INTO nutrition_test values(null,4,8,250,150);
INSERT INTO substance_use_test values(null,4,4,false);
INSERT INTO physical_health_test VALUES (null,4,4,65,85,30,19,24,100);
CALL store_diagnosis(4,10);
CALL update_treatment_plan(4,10,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Tanuj', true, true, true, null);
INSERT INTO visit values (11,4,"enter details here");
INSERT INTO mental_health_test VALUES (null,4,0,0,1,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,4,8);
INSERT INTO depression_assessment VALUES(null,4,14,14);
INSERT INTO nutrition_test values(null,4,8,250,150);
INSERT INTO substance_use_test values(null,4,4,false);
INSERT INTO physical_health_test VALUES (null,4,4,65,85,30,19,24,100);
CALL store_diagnosis(4,11);
CALL update_treatment_plan(4,11,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Tanuj', true, true, true, null);
INSERT INTO visit values (12,4,"enter details here");
INSERT INTO mental_health_test VALUES (null,4,0,0,1,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,4,8);
INSERT INTO depression_assessment VALUES(null,4,8,14);
INSERT INTO nutrition_test values(null,4,8,250,150);
INSERT INTO substance_use_test values(null,4,4,false);
INSERT INTO physical_health_test VALUES (null,4,4,65,85,30,19,24,100);
CALL store_diagnosis(4,12);
CALL update_treatment_plan(4,12,@success);
SELECT @success;

SELECT depression_diagnosis_treatment_tool.patient_gives_feedback('Tanuj', true, true, true, null);
INSERT INTO visit values (13,4,"enter details here");
INSERT INTO mental_health_test VALUES (null,4,0,0,0,0,0);
INSERT INTO seasonal_affective_disorder_test VALUES (null,4,8);
INSERT INTO depression_assessment VALUES(null,4,8,8);
INSERT INTO nutrition_test values(null,4,8,250,150);
INSERT INTO substance_use_test values(null,4,4,false);
INSERT INTO physical_health_test VALUES (null,4,4,65,85,30,19,24,100);
CALL store_diagnosis(4,13);
CALL update_treatment_plan(4,13,@success);
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