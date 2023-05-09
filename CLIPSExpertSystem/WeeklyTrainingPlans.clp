(deftemplate MAIN::daily_plan
   (slot id)
   (slot exersice_organization_type)
   (multislot exercises))

(deftemplate MAIN::weekly_plan
   (slot id)
   (slot days)
   (slot week_plan_type)
   (slot target)
   (multislot daily_plans))

(defrule MAIN::FullBody
   (health_indicator(parameterName BMI)(parameterValue ?bmi&:(>= ?bmi 40)|:(<= ?bmi 13)))
   =>
   (assert (bmi_formal (formal_name Critical))))