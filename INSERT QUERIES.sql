INSERT INTO medication_category VALUES
('SSRI',"Selective Serotonin Reuptake Inhibitors"),
('NDRI',"Dopamine Norepinephrine Reuptake Inhibitor"),
('SNRI',"Serotonin Norepinephrine Reuptake Inhibitor"),
('NSM',"Norepinephrine Serotonin Modulator"),
('TCA',"Tricyclics and tetracyclics"),
('MAOI',"Monoamine Oxidase Inhibitor"),
("OTHER","medications not belonging to Neurological Treatment");

INSERT INTO medication_detail (id,medication_category_id,type,name,min_dose,start_dose,start_period,inc_or_dec,max_dose)
VALUES
(1,"SSRI","fluoxetine","Prozac",10,20,4,10,80),
(2,"SSRI","paroxetine","Paxil",10,20,4,10,50),
(3,"SSRI","sertraline","Zoloft",25,50,4,25,200),
(4,"SSRI","citalopram","Celexa",10,20,4,10,40),
(5,"SSRI","escitalopram","Lexapro",10,20,4,10,30),
(6,"NDRI","bupropion","wellbutrin",100,200,4,50,450),
(7,"SNRI","desvenlafaxine","pristiq",25,50,4,200,50),
(8,"SNRI","venlafaxine","effexor",37,74,4,37,370),
(9,"SNRI","Duloxetine","duloxetine",20,40,4,null,80),
(10,"NSM","Mirtazapine","Remeron",15,30,4,15,45),
(11,"TCA","Desipramine","Norpramin",25,50,4,25,300),
(12,"TCA","Nortriptyline","Pamelor",25,50,4,25,100),
(13,"MAOI","Phenelzine","Nardil",15,30,4,15,90),
(14,"NDRI","bupropion","Aplenzin",100,150,4,50,450),
(15,"OTHER","glimepiride","Amaryl",1,2,4,1,4),
(16,"OTHER","Levothyroxine","Synthroid",20,30,4,10,100),
(17,"OTHER","Fludrocortisone","Florinef",0.1,0.1,4,0.05,0.2),
(18,"OTHER","zeaxanthin","zeaxanthin",1,1,4,1,5),
(19,"OTHER","atenolol","Tenormin",25,50,4,25,200),
(20,"OTHER","ACE inhibitor(Lisinopril)","Zestril",20,40,4,20,80),
(21,"OTHER","Beta blockers","Nebivolol",5,10,4,5,20),
(22,"OTHER", "Liothyronine","Cytome",25,50,4,25,75),
(23, "OTHER", "Levothyroxine","Levoxyl",25,50,4,25,200),
(24, "OTHER","erythropoietin","Epogen",25,50,4,25,300),
(25, "OTHER","Midodrine","ProAmatine",2,4,4,2,10),
(26, "OTHER","Topamax","Trokendi XR",25,50,4,25,200),
(27, "OTHER", "Tolterodine","Detrol",1,1,4,1,2),
(28, "OTHER","glimepiride-pioglitazon","Duetact",2,4,4,2,30),
(29,"OTHER", "glipizide-metformin","Metaglip",5,10,4,5,250);

INSERT INTO diet_plan (id,reason,symptom_description,plan_description)
VALUES
(1,"nutrition_deficiency","patient is having low vitamin b6 / b12 and folic acid levels","add egg beaf oyesters mussels to your diet. For a vegetarial option - add green leafy vegetables as well as legumes to your diet"),
(2,"seasonal_affective_disorder","patient os suffering through vitamin D deficiency", "add Fatty fish, like tuna, mackerel, and salmon. Add dairy products orange juice soy milk, and cereals.");

INSERT INTO PHQ9_score_map (id,type,PHQ_9_min,PHQ_9_max)
VALUES
(1,"none",0,4),
(2,"mild",5,9),
(3,"moderate",10,14),
(4,"moderately severe",15,20),
(5,"severe",21,27);

INSERT INTO side_effects (id,Category,Symptoms,Description,Action)
VALUES
(1,"Cardiovascular","Arrhythmias","a condition in which the heart beats with an irregular or abnormal rhythm","Change"),
(2,"Cardiovascular","Cardiomyopathy","heart is abnormally enlarged/stiffened","Treat"),
(3,"Cardiovascular","Pericarditis","inflamed heart lininning","Treat"),
(4,"Cardiovascular","Cholesterol","Increase in blood cholestoral levels","Change"),
(5,"Anticholinergic","Constipation","a condition in which there is difficulty in emptying the bowels, usually associated with hardened feces","Treat"),
(6,"Anticholinergic","Xerostomia","Dry mouth, a condition in which the salivary glands in your mouth don't make enough saliva to keep your mouth wet","Treat"),
(7,"Anticholinergic","Delirium","an acutely disturbed state of mind that occurs in fever, intoxication, and other disorders and is characterized by restlessness, illusions, and incoherence of thought and speech","Change"),
(8,"Anticholinergic","Urinary" ,"Hesitency,difficulty in beginning the flow of urine","Treat"),
(9,"Neurologic","Headaches","a painful sensation in any part of the head, ranging from sharp to dull, that may occur with other symptoms","Treat"),
(10,"Neurologic","Migraine","a primary headache disorder characterized by recurrent headaches that are moderate to severe","Treat"),
(11,"Neurologic","Myoclonus/ Muscle Tremors","spasmodic jerky contraction of groups of muscles","Change"),
(12,"Neurologic","Seizures","an abnormal electrical discharge in the brain","Change"),
(13,"Sexual","Erectile dysfunction","inability to get or keep an erection firm enough to have sexual intercourse","Treat"),
(14,"Sexual","Orgasym dysfunction/Anorgasmia","difficulty reaching an orgasm despite sexual arousal and stimulation","Treat"),
(15,"Sexual","Priapism","persistent and painful erection of the penis","Change"),
(16,"Sexual","Low sex drive","loss of desire","Treat"),
(17,"Other","Fall Risk","sudden dizziness, faint like feeling","Change"),
(18,"Other","Insomnia","difficulty in sleeping and constant feeling of tiredness","Treat"),
(19,"Other","Nausea","Patient observes nausea, vomitting and gastrointestinal issues","Treat"),
(20,"Other","Hyper-Salivation" ,"Saliva Overproduction","Change"),
(21,"Other","Sedation/Fatigue","Sudden increase in sleep times especially at odd hours and constant feeling of tiredness","Treat"),
(22,"Other","Weight Gain","Sudden weight increase","Treat"),
(23,"Other","Osteopenia","Reduced bone mass of lesser severity than osteoporosis","Treat");

INSERT INTO physical_activity (id,physical_activity)
VALUES
(1,"Yoga or Aerobic"),
(2,"Jog or walk or bike or swimming"),
(3,"strength training or Kegels or yoga"),
(4,"accupuncture"),
(5,"cycling or jogging or weight training"),
(6,"Hydrotherapy"),
(7,"running or hiit"),
(8,"breathing exercises and neck and spine relaxation exercises"),
(9,"pilates");

INSERT INTO physical_activity_map (id,side_effects_id,physical_activity_id,PHQ9_depression_id)
VALUES
(1,null,1,2),
(2,null,2,3),
(3,null,8,4),
(4,null,3,5),
(5,18,1, null),
(7,16,3, null),
(8,17,4, null),
(9,22,5, null),
(10,11,6, null),
(11,21,7, null),
(12,9,8, null),
(13,13,9, null);

INSERT INTO standard_medication_change_map (depression_type,standard_medication_id,side_effect_id,changed_medication_id)
VALUES
(2,1,null,null),
(3,1,null,null),
(4,8,null,null),
(5,4,null,null),
(3,1,1,2),
(3,1,4,3),
(3,1,7,4),
(3,1,11,5),
(3,1,12,14),
(3,1,15,10),
(3,1,17,13),
(3,1,20,3),
(2,1,1,2),
(2,1,4,2),
(2,1,7,2),
(2,1,11,2),
(2,1,12,3),
(2,1,15,3),
(2,1,17,3),
(2,1,20,3),
(4,8,1,6),
(4,8,4,9),
(4,8,7,10),
(4,8,11,13),
(4,8,12,9),
(4,8,15,6),
(4,8,17,10),
(4,8,20,13),
(5,4,1,7),
(5,4,4,11),
(5,4,7,12),
(5,4,11,7),
(5,4,12,11),
(5,4,15,12),
(5,4,17,7),
(5,4,20,13);

INSERT INTO standard_medication_treat_map (side_effect_id,treatment_course)
VALUES
(2,"antihypertensive(Benazepril) dosage 5mg/day"),
(3,"fludrocortisone(FLORINEF) dosage: 0.2mg/day; also add salt to diet"),
(5,"laxative(dulcolax) dosage: 5mg/day"),
(6,"increase water intake; suggest use of sugarless gum or candy"),
(8,"bethanechol(Urecholine): 5mg/day"),
(9,"Pamelor dosage: 10mg/day"),
(10,"Ibuprofen (Motrin) dosage: 1 caplet/day"),
(13,"viagra (sildenafil)"),
(14,"viagra (sildenafil)"),
(16,"meditation and other forms of stress relief"),
(18,"Use morning dosing. Add a sedative-hypnotic at bed-time, Add melatonin"),
(19,"Zofran dosage: 4mg in the morning"),
(21,"Use bedtime dosing. Modafinil/methylphenidate, dosage:200 mg orally once a day in the morning"),
(22,"consider a strict diet plan"),
(23,"bisphosphonates + calcium supplements");

INSERT INTO therapy (therapy_name,description,depression_type,Symptom) VALUES
("Cognitive Behavioral Therapy","a type of psychotherapy in which negative patterns of thought about the self and the world are challenged in order to treat depression",4,"stress"),
("Interpersonal Therapy","a form of psychotherapy in which the focus is on a patient's relationships with peers and family members and the way they see themselves",4,"anxiety"),
("Psycholigical Counselling","techniques designed to encourage communication of conflicts and insight into problems, with the goal being relief of symptoms, changes in behavior leading to improved social and vocational functioning, and personality growth",5,null),
("Exposure Therapy","exposure therapy is a technique in behavior therapy to treat anxiety disorders",5,"stress or anxiety"),
("Light Therapy","Light therapy is a way to treat seasonal affective disorder (SAD) and certain other conditions by exposure to artificial light",null,"vitamin D deficiency"),
("meditation therapy","a method of relaxation and consciousness expansion by focusing on a mantra or a keyword, sound, or image while eliminating outside stimuli from one's awareness",null,"sleep disturbance"),
("psychotherapy","Talk therapy, also known as psychotherapy, is based on the core idea that talking about the things that are bothering you can help clarify them and put them in perspective",null,"grief reaction");

INSERT INTO standard_test_values (temp) values (1);
 
INSERT INTO physical_standard_medication_change_map 
(physical_symptom,standard_medication_id,side_effect_id,changed_medication_id) VALUES
("Hypothyroidism", 16, null, null),
("Low Blood Pressure",17, null, null),
("High Blood Pressure",19, null,null),
("Poor Vision", 18, null, null),
("Diabetes", 15, null, null),
("Hypothyroidism", 16, 1, 22),
("Hypothyroidism", 16, 4, 23),
("Hypothyroidism", 16, 7, 22),
("Hypothyroidism", 16, 11, 23),
("Hypothyroidism", 16, 12, 22),
("Hypothyroidism", 16, 15, 23),
("Hypothyroidism", 16, 17, 22),
("Hypothyroidism", 16, 20, 23),
("Low Blood Pressure",17, 1, 24),
("Low Blood Pressure",17, 4, 25),
("Low Blood Pressure",17, 7, 24),
("Low Blood Pressure",17, 11, 25),
("Low Blood Pressure",17, 12, 24),
("Low Blood Pressure",17, 15, 25),
("Low Blood Pressure",17, 17, 24),
("Low Blood Pressure",17, 20, 25),
("High Blood Pressure",19, 1, 20),
("High Blood Pressure",19, 4, 21),
("High Blood Pressure",19, 7, 20),
("High Blood Pressure",19, 11, 21),
("High Blood Pressure",19, 12, 20),
("High Blood Pressure",19, 15, 21),
("High Blood Pressure",19, 17, 20),
("High Blood Pressure",19, 20, 21),
("Poor Vision", 18, 1, 26),
("Poor Vision", 18, 4, 27),
("Poor Vision", 18, 7, 26),
("Poor Vision", 18, 11, 27),
("Poor Vision", 18, 12, 26),
("Poor Vision", 18, 15, 27),
("Poor Vision", 18, 17, 26),
("Poor Vision", 18, 20, 27),
("Diabetes", 15, 1, 28),
("Diabetes", 15, 4, 29),
("Diabetes", 15, 7, 28),
("Diabetes", 15, 11, 29),
("Diabetes", 15, 12, 28),
("Diabetes", 15, 15, 29),
("Diabetes", 15, 17, 28),
("Diabetes", 15, 20, 29);

INSERT INTO treatment_effectiveness_calculation_standard 
VALUES
(1,5,26,"Adequate","No Change"),
(2,2,4,"Possibly Inadequate","Increase Medication Dose"),
(3,0,1,"Inadequate","Increase Medication Dose and add Psychological Counselling");