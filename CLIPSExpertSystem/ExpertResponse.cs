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
                "(height 184) (age 23) (restriction no) (available_days 1) (goal Fat_Loss)))");
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
        public Tuple<int, string, List<string>> GetDailyPlan()
        {
            var dailyPlanFact = _clips.FindFact("daily_plan");
            int day = (int)(NumberValue)dailyPlanFact["day_n"];
            String type = ((LexemeValue)dailyPlanFact["exersice_organization_type"]).Value;
            
            List<string> names = new List<string>();
            var exercises = ((MultifieldValue)dailyPlanFact["exercises"]).Value;
            foreach (var name in exercises)
            {
                names.Add(name.ToString());
            }
            return new Tuple<int, string, List<string>>(day,type,names);
        }
    }
}
