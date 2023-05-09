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
            _clips.Reset();
            _clips.AssertString("(user_profile (name Max) (gender male) (weight 72)" +
                "(height 184) (age 24) (restriction no) (day 4) (target 5)))");
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
    }
}
