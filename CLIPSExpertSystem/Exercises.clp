(deftemplate MAIN::exercise
   (slot name)
   (slot target_muscle_group)
   (multislot support_muscle_groups)
   (multislot equipment)
)

(deffacts MAIN::exercise_chest
   (exercise (name Bench_Press)(target_muscle_group Chest)(support_muscle_groups Front_Delta Triceps)(equipment Bench Barbell))
   (exercise (name Incline_Bench_Press)(target_muscle_group Chest)(support_muscle_groups Front_Delta Triceps)(equipment Incline_Bench Dumbbells))
   (exercise (name Push-Ups_With_Resistance_Band)(target_muscle_group Chest)(support_muscle_groups Front_Delta Triceps)(equipment Resistance_Band))
)

(deffacts MAIN::exercise_back
   (exercise (name Pull-Ups)(target_muscle_group Back)(support_muscle_groups Rear_Delta Biceps Trapezius)(equipment Pull-Up_Bar))
   (exercise (name Bent-over_Rows)(target_muscle_group Back)(support_muscle_groups Rear_Delta Biceps Trapezius)(equipment Barbell))
   (exercise (name Chin-Ups)(target_muscle_group Back)(support_muscle_groups Trapezius Rear_Delta Biceps)(equipment Pull-Up_Bar))
)

(deffacts MAIN::exercise_quadriceps
   (exercise (name Barbell_Squat)(target_muscle_group Quadriceps)(support_muscle_groups Calf)(equipment Barbell))
   (exercise (name Leg_Press)(target_muscle_group Quadriceps)(support_muscle_groups Calf)(equipment Leg_Press))
)

(deffacts MAIN::exercise_ham_strings
   (exercise (name Straight_Led_Deadlift_Barbell)(target_muscle_group Ham_Strings)(support_muscle_groups Glutes Lower_Back)(equipment Barbell))
   (exercise (name Straight_Led_Deadlift_Dumbbells)(target_muscle_group Ham_Strings)(support_muscle_groups Glutes Lower_Back)(equipment Dumbbells))
)

(deffacts MAIN::exercise_front_delta
   (exercise (name OverHead_Barbell_Press)(target_muscle_group Front_Delta)(support_muscle_groups Middle_Delta Trapezius)(equipment Barbell))
   (exercise (name OverHead_Dumbbells_Press)(target_muscle_group Front_Delta)(support_muscle_groups Middle_Delta Trapezius)(equipment Dumbbells))
)

(deffacts MAIN::exercise_latetal_delta
   (exercise (name Dumbbells_Latetal_Raise)(target_muscle_group Latetal_Delta)(support_muscle_groups null)(equipment Dumbbells))
)

(deffacts MAIN::exercise_rear_delta
   (exercise (name Australian_Pull-Ups)(target_muscle_group Rear_Delta)(support_muscle_groups Back Biceps)(equipment Bar))
)