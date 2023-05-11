(defglobal ?*id* = 1)

(deftemplate MAIN::recomendation
   (slot bad_practice)
   (slot weekly_plan_id))

(deftemplate MAIN::daily_plan
   (slot id_d)
   (slot age_group)
   (slot goal)
   (slot days)
   (slot day_n)
   (slot exersice_organization_type)
   (multislot exercises_id))

(deftemplate MAIN::weekly_plan
   (slot id_w)
   (slot days)
   (slot rest_days)
   (slot week_plan_type)
   (multislot daily_plans_id))

(defrule MAIN::UnderWeight_Fat_Loss
   (bmi_formal(formal_name undereight))
   (user_profile(goal fat_loss))
   =>
   (assert (recomendation (bad_practice "Considering your BMI (UnderWeight) we recommend to change your goal for Muscle gain and follow next training program:")
   (weekly_plan_id ?*id*)))
   (bind ?*id*=(+ ?*id* 1))
)

(defrule MAIN::Young_LimitDays
   (user_profile(available_days ?days&:(= ?days 1)|:(= ?days 7)))
   (user_profile(age ?age&:(>= ?age 18)&:(<= ?age 23)))
   =>
   (assert (recomendation (bad_practice "Considering your Age we recommend to change number of training days for 2-6 days")
   (weekly_plan_id 0)))
)

(defrule MAIN::Week_Plan_Muscle_gain_1days
   (user_profile(available_days ?days&:(= ?days 1))(goal Muscle_gain))
   (age_group ?ag)
   (daily_plan(days 1)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 1)(id_d ?id1))
   =>
   (assert (weekly_plan(id_w ?*id*)(days 1)(rest_days d1)(week_plan_type Full_Body)(daily_plans_id ?id1)))
   (bind ?*id*=(+ ?*id* 1))
)
(defrule MAIN::Week_Plan_Muscle_gain_2days
   (user_profile(available_days ?days&:(= ?days 2))(goal Muscle_gain))
   (age_group ?ag)
   (daily_plan(days 2)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 1)(id_d ?id1))
   (daily_plan(days 2)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 2)(id_d ?id2))
   =>
   (assert (weekly_plan(id_w ?*id*)(days 2)(rest_days d1r23d2)(week_plan_type Full_Body)(daily_plans_id ?id1 ?id2)))
   (bind ?*id*=(+ ?*id* 1))
)

(defrule MAIN::Week_Plan_Muscle_gain_3days
   (user_profile(available_days ?days&:(= ?days 3))(goal Muscle_gain))
   (age_group ?ag)
   (daily_plan(days 3)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 1)(id_d ?id1))
   (daily_plan(days 3)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 2)(id_d ?id2))
   (daily_plan(days 3)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 3)(id_d ?id3))
   =>
   (assert (weekly_plan(id_w ?*id*)(days 3)(rest_days d1r1d2r1d3)(week_plan_type Full_Body)(daily_plans_id ?id1 ?id2 ?id3)))
   (bind ?*id*=(+ ?*id* 1))
)

(defrule MAIN::Week_Plan_Muscle_gain_4days
   (user_profile(available_days ?days&:(= ?days 4))(goal Muscle_gain))
   (age_group ?ag)
   (daily_plan(days 4)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 1)(id_d ?id1))
   (daily_plan(days 4)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 2)(id_d ?id2))
   (daily_plan(days 4)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 3)(id_d ?id3))
   (daily_plan(days 4)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 4)(id_d ?id4))
   =>
   (assert (weekly_plan(id_w ?*id*)(days 4)(rest_days d1r0d2r12d3r0d4)(week_plan_type Upper_and_Lower_Body)(daily_plans_id ?id1 ?id2 ?id3 ?id4)))
   (bind ?*id*=(+ ?*id* 1))
)
(defrule MAIN::Week_Plan_Muscle_gain_5days
   (user_profile(available_days ?days&:(= ?days 5))(goal Muscle_gain))
   (age_group ?ag&:(neq ?ag "Old"))
   (daily_plan(days 5)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 1)(id_d ?id1))
   (daily_plan(days 5)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 2)(id_d ?id2))
   (daily_plan(days 5)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 3)(id_d ?id3))
   (daily_plan(days 5)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 4)(id_d ?id4))
   (daily_plan(days 5)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 5)(id_d ?id5))
   =>
   (assert (weekly_plan(id_w ?*id*)(days 5)(rest_days d1r0d2r0d3r1d4r0d5)(week_plan_type Profi_Upper_and_Lower_Body)(daily_plans_id ?id1 ?id2 ?id3 ?id4 ?id5)))
   (bind ?*id*=(+ ?*id* 1))
)
(defrule MAIN::Week_Plan_Muscle_gain_6days
   (user_profile(available_days ?days&:(= ?days 6))(goal Muscle_gain))
   (age_group ?ag&:(neq ?ag "Old"))
   (daily_plan(days 6)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 1)(id_d ?id1))
   (daily_plan(days 6)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 2)(id_d ?id2))
   (daily_plan(days 6)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 3)(id_d ?id3))
   (daily_plan(days 6)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 4)(id_d ?id4))
   (daily_plan(days 6)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 5)(id_d ?id5))
   (daily_plan(days 6)(goal Muscle_gain)(age_group ?ag)(exersice_organization_type Circullar)(day_n 6)(id_d ?id6))
   =>
   (assert (weekly_plan(id_w ?*id*)(days 6)(rest_days d1r0d2r0d3r1d4r0d5r0d6)(week_plan_type Profi_Upper_and_Lower_Body)(daily_plans_id ?id1 ?id2 ?id3 ?id4 ?id5 ?id6)))
   (bind ?*id*=(+ ?*id* 1))
)