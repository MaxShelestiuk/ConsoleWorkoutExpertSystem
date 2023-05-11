using CLIPSNET;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CLIPSExpertSystem
{
    public class ExpertResponse
    {
        private CLIPSNET.Environment _clips;
        public ExpertResponse()
        {
            _clips = new CLIPSNET.Environment();
            _clips.LoadFromResource("CLIPSExpertSystem", "CLIPSExpertSystem.HealthIndicators.clp");
            _clips.LoadFromResource("CLIPSExpertSystem", "CLIPSExpertSystem.Exercises.clp");
            _clips.LoadFromResource("CLIPSExpertSystem", "CLIPSExpertSystem.Recomendations.clp");
            _clips.Reset();
            _clips.AssertString("(user_profile (name Max) (gender male) (weight 58)" +
                "(height 184) (age 23) (restriction no) (available_days 2) (goal Muscle_gain)))");
            _clips.AssertString("(daily_plan(id_d 1)(age_group Young)(goal Muscle_gain)(days 5)(day_n 1)(exersice_organization_type Circullar)(exercises_id 1 5 7 9 10 3 6))");
            _clips.AssertString("(daily_plan(id_d 2)(age_group Young)(goal Muscle_gain)(days 5)(day_n 2)(exersice_organization_type Circullar)(exercises_id 2 4 8 10 12 13 16))");
            _clips.AssertString("(daily_plan(id_d 10)(age_group Young)(goal Muscle_gain)(days 5)(day_n 3)(exersice_organization_type Circullar)(exercises_id 1 5 7 9 10 3 6))");
            _clips.AssertString("(daily_plan(id_d 20)(age_group Young)(goal Muscle_gain)(days 5)(day_n 4)(exersice_organization_type Circullar)(exercises_id 2 4 8 10 12 13 16))");
            _clips.AssertString("(daily_plan(id_d 40)(age_group Young)(goal Muscle_gain)(days 5)(day_n 5)(exersice_organization_type Circullar)(exercises_id 2 4 8 10 12 13 16))");
            _clips.Run();
        }
        public double GetBMIValue()
        {
            var bmiFact = _clips.FindFact("?f", "health_indicator", "(eq ?f:parameterName BMI)");
            double bmiValue = (double)(((NumberValue)bmiFact["parameterValue"]));
            return bmiValue;
        }
        public double GetBMRValue()
        {
            var bmrFact = _clips.FindFact("?f", "health_indicator", "(eq ?f:parameterName BMR)");
            double bmrValue = (double)(((NumberValue)bmrFact["parameterValue"]));
            return bmrValue;
        }
        public string GetBMIFormal()
        {
            var bmiFormalFact = _clips.FindFact("bmi_formal");
            String bmiFormalName = ((LexemeValue)bmiFormalFact["formal_name"]).Value;
            return bmiFormalName;
        }
        public List<string> GetExercises()
        {
            var exercises = _clips.FindAllFacts("exercise");
            List<string> names = new List<string>();
            foreach (var exercise in exercises)
            {
                string name = ((LexemeValue)exercise["name"]).Value;
                names.Add(name);
            }
            return names;
        }
        public Tuple<string,int> GetRecomendation()
        {
            var recomendationFact = _clips.FindFact("recomendation");
            String badPractice = ((LexemeValue)recomendationFact["bad_practice"]).Value;
            int id = (int)(((NumberValue)recomendationFact["weekly_plan_id"])); ;
            return new Tuple<string, int>(badPractice,id);
        }
        //public Tuple<int, string, List<string>> GetDailyPlan()
        //{
        //    var dailyPlanFact = _clips.FindFact("daily_plan");
        //    int day = (int)(NumberValue)dailyPlanFact["day_n"];
        //    String type = ((LexemeValue)dailyPlanFact["exersice_organization_type"]).Value;

        //    List<string> names = new List<string>();
        //    var exercises = ((MultifieldValue)dailyPlanFact["exercises"]).Value;
        //    foreach (var name in exercises)
        //    {
        //        names.Add(name.ToString());
        //    } 
        //    return new Tuple<int, string, List<string>>(day,type,names);
        //}
        public Tuple<int, int, string, string, List<int>> GetWeekPlan()
        {
            var weekPlanFact = _clips.FindFact("weekly_plan");
            int weekId = (int)(NumberValue)weekPlanFact["id_w"];
            int days = (int)(NumberValue)weekPlanFact["days"];
            string restDays = ((LexemeValue)weekPlanFact["rest_days"]).Value;
            string weekPlanType = ((LexemeValue)weekPlanFact["week_plan_type"]).Value;

            List<int> dayPlansIds = new List<int>();
            var dayPlans = ((MultifieldValue)weekPlanFact["daily_plans_id"]).Value;
            foreach (var id in dayPlans)
            {
                dayPlansIds.Add((int)(NumberValue)id);
            }
            return new Tuple<int, int, string, string, List<int>>(weekId, days, restDays, weekPlanType, dayPlansIds);
        }
    }
}
