using System;

namespace FindAverageValueOfArray
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] array = WorkWithArray.Generate(Convert.ToInt32(args[0]));
            Console.WriteLine("Average Value: " + WorkWithArray.FindAverage(array));
        }
    }
}
