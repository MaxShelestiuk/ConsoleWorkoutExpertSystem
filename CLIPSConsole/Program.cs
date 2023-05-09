using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CLIPSExpertSystem;

namespace CLIPSConsole
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ExpertResponse expertResponse = new ExpertResponse();

            Console.WriteLine("BMI " + expertResponse.GetBMIValue());

            Console.WriteLine("BMR " + expertResponse.GetBMRValue());

            Console.WriteLine("Formal " + expertResponse.GetBMIFormal());

            Console.WriteLine("Exercises:");
            foreach (var exercise in expertResponse.GetExercises())
            {
                Console.WriteLine(exercise);
            }

            Console.ReadLine();
        }
    }
}
