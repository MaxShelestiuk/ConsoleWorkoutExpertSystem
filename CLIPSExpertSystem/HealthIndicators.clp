(deftemplate MAIN::user_profile
   (slot name)
   (slot gender)
   (slot weight)
   (slot height)
   (slot age)
   (slot restriction)
   (slot available_days)
   (slot goal))

(deftemplate MAIN::health_indicator
   (slot parameterName)
   (slot parameterValue))

(deftemplate MAIN::bmi_formal
   (slot formal_name))

(defrule MAIN::AgeGroupYoung
   (user_profile (age ?a&:(>= ?a 18)&:(<= ?a 23)))
   =>
   (assert (age_group Young))
)
(defrule MAIN::AgeGroupModerate
   (user_profile (age ?a&:(>= ?a 24)&:(<= ?a 45)))
   =>
   (assert (age_group Moderate))
)
(defrule MAIN::AgeGroupOld
   (user_profile (age ?a&:(>= ?a 46)))
   =>
   (assert (age_group Old))
)

(defrule MAIN::CalculateMaleBMR
   (user_profile (weight ?w) (height ?h) (age ?a) (gender male))
   =>
   (assert (health_indicator(parameterName BMR) (parameterValue =(- (+ (+ 66.5 (* 13.75 ?w)) (* 5.003 ?h)) (* 6.75 ?a))))))

(defrule MAIN::CalculateFemaleBMR
   (user_profile (weight ?w) (height ?h) (age ?a) (gender female))
   =>
   (assert (health_indicator(parameterName BMR) (parameterValue =(- (+ (+ 655.1 (* 9.563 ?w)) (* 1.85 ?h)) (* 4.676 ?a))))))

(defrule MAIN::CalculateBMI
   (user_profile (weight ?w) (height ?h))
   =>
   (assert (health_indicator(parameterName BMI) (parameterValue =(/ ?w (** (/ ?h 100) 2))))))

(defrule MAIN::BMIOptimal
   (health_indicator(parameterName BMI)(parameterValue ?bmi&:(>= ?bmi 18.5)&:(<= ?bmi 24.9)))
   =>
   (assert (bmi_formal (formal_name Optimal))))

(defrule MAIN::BMICritical
   (health_indicator(parameterName BMI)(parameterValue ?bmi&:(>= ?bmi 40)|:(<= ?bmi 13)))
   =>
   (assert (bmi_formal (formal_name Critical))))

(defrule MAIN::BMIUnderWeight
   (health_indicator(parameterName BMI)(parameterValue ?bmi&:(< ?bmi 18.5)))
   =>
   (assert (bmi_formal (formal_name UnderWeight))))

(defrule MAIN::BMIOverWeight
   (health_indicator(parameterName BMI)(parameterValue ?bmi&:(>= ?bmi 25)&:(<= ?bmi 29.9)))
   =>
   (assert (bmi_formal (formal_name OverWeight))))

(defrule MAIN::BMIObese1
   (health_indicator(parameterName BMI)(parameterValue ?bmi&:(>= ?bmi 30)&:(<= ?bmi 34.9)))
   =>
   (assert (bmi_formal (formal_name Obese1))))

(defrule MAIN::BMIObese2
   (health_indicator(parameterName BMI)(parameterValue ?bmi&:(>= ?bmi 35)&:(<= ?bmi 39.9)))
   =>
   (assert (bmi_formal (formal_name Obese2))))