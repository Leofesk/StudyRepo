using System;

namespace FindAverageValueOfArray
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] array = WorkWithArray.Generate(1000);
            Console.WriteLine(WorkWithArray.FindAverage(array));
        }
    }
}
