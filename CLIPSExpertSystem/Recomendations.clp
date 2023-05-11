(defglobal ?*id* = 0)

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
   (multislot exercises))

(deftemplate MAIN::weekly_plan
   (slot id_w)
   (slot days)
   (slot rest_days)
   (slot week_plan_type)
   (multislot daily_plan_ids))

(defrule MAIN::UnderWeight_Fat_Loss
   (bmi_formal(formal_name UnderWeight))
   (user_profile(target Fat_Loss))
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

(defrule MAIN::Week_Plan_Muscle_gain_Young_2days
   (user_profile(available_days ?days&:(= ?days 2))(goal Muscle_gain))
   (age_group young)
   (daily_plan(days 2)(goal Muscle_gain)(age_group young)(exersice_organization_type circular)(day_n 1)(id_d ?id1))
   (daily_plan(days 2)(goal Muscle_gain)(age_group young)(exersice_organization_type circular)(day_n 2)(id_d ?id2))
   =>
   (assert (weekly_plan(id_w ?*id*)(days 2)(rest_days 2)(week_plan_type Classic)(daily_plan_ids ?id1 ?id2)))))
   (bind ?*id*=(+ ?*id* 1))
)