(deftemplate MAIN::exercise
   (slot id)
   (slot name)
   (slot target_muscle_group)
   (slot priority)
   (slot jointness)
   (multislot support_muscle_groups)
   (multislot equipment)
)

(deffacts MAIN::exercise_chest
   (exercise (id 1)(name Bench_Press)(target_muscle_group Chest)(priority 1)(jointness Multi_joint)(support_muscle_groups Front_Delta Triceps)(equipment Bench Barbell))
   (exercise (id 2)(name Incline_Bench_Press)(target_muscle_group Chest)(priority 2)(jointness Multi_joint)(support_muscle_groups Front_Delta Triceps)(equipment Incline_Bench Dumbbells))
   (exercise (id 3)(name Push-Ups_With_Resistance_Band)(target_muscle_group Chest)(priority 3)(jointness Multi_joint)(support_muscle_groups Front_Delta Triceps)(equipment Resistance_Band))
   (exercise (id 4)(name Low_To_High_Dumbbell_Fly)(target_muscle_group Chest)(priority 4)(jointness Single_joint)(support_muscle_groups Front_Delta)(equipment Dumbbells))
   (exercise (id 5)(name Chest_Flies)(target_muscle_group Chest)(priority 5)(jointness Single_joint)(support_muscle_groups null)(equipment Dumbbells))
)

(deffacts MAIN::exercise_back
   (exercise (id 6)(name Pull-Ups)(target_muscle_group Back)(priority 1)(jointness Multi_joint)(support_muscle_groups Rear_Delta Biceps Trapezius)(equipment Pull-Up_Bar))
   (exercise (id 7)(name Bent-over_Rows)(target_muscle_group Back)(priority 2)(jointness Multi_joint)(support_muscle_groups Rear_Delta Biceps Trapezius)(equipment Barbell))
   (exercise (id 8)(name Chin-Ups)(target_muscle_group Back)(priority 3)(jointness Multi_joint)(support_muscle_groups Trapezius Rear_Delta Biceps)(equipment Pull-Up_Bar))
   (exercise (id 9)(name Dumbbell_Row)(target_muscle_group Back)(priority 4)(jointness Single_joint)(support_muscle_groups Rear_Delta Biceps)(equipment Dumbbells))
)

(deffacts MAIN::exercise_quadriceps
   (exercise (id 10)(name Barbell_Squat)(target_muscle_group Quadriceps)(priority 1)(jointness Multi_joint)(support_muscle_groups Calf)(equipment Barbell))
   (exercise (id 11)(name Leg_Press)(target_muscle_group Quadriceps)(priority 2)(jointness Multi_joint)(support_muscle_groups Calf)(equipment Leg_Press))
)

(deffacts MAIN::exercise_ham_strings
   (exercise (id 12)(name Straight_Led_Deadlift_Barbell)(target_muscle_group Ham_Strings)(priority 1)(jointness Multi_joint)(support_muscle_groups Glutes Lower_Back)(equipment Barbell))
   (exercise (id 13)(name Straight_Led_Deadlift_Dumbbells)(target_muscle_group Ham_Strings)(priority 2)(jointness Single_joint)(support_muscle_groups Glutes Lower_Back)(equipment Dumbbells))
)

(deffacts MAIN::exercise_glutes
   (exercise (id 14)(name Dumbbells_Lunges)(target_muscle_group Glutes)(priority 1)(jointness Multi_joint)(support_muscle_groups Quadriceps Ham_Strings)(equipment Dumbbells))
)

(deffacts MAIN::exercise_front_delta
   (exercise (id 15)(name OverHead_Barbell_Press)(target_muscle_group Front_Delta)(priority 100)(jointness Multi_joint)(support_muscle_groups Middle_Delta Trapezius)(equipment Barbell))
   (exercise (id 16)(name OverHead_Dumbbells_Press)(target_muscle_group Front_Delta)(priority 100)(jointness Single_joint)(support_muscle_groups Middle_Delta Trapezius)(equipment Dumbbells))
)

(deffacts MAIN::exercise_lateral_delta
   (exercise (id 17)(name Dumbbell_Lateral_Raise)(target_muscle_group Lateral_Delta)(priority 100)(jointness Single_joint)(support_muscle_groups null)(equipment Dumbbells))
)

(deffacts MAIN::exercise_rear_delta
   (exercise (id 18)(name Australian_Pull-Ups)(target_muscle_group Rear_Delta)(priority 100)(jointness Single_joint)(support_muscle_groups Back Biceps)(equipment Bar))
)