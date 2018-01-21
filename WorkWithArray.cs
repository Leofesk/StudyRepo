using System;

namespace FindAverageValueOfArray
{
    public class WorkWithArray
    {
        public static int[] Generate(int size)
        {
            int[] array = new int[size];
            Random rnd = new Random();

            for (int i = 0; i < array.Length; i++)
            {
                array[i] = rnd.Next(1, 99);
            }

            return array;
        }

        public static int FindAverage(int[] array)
        {
            int tmp = 0;

            for (int i = 0; i < array.Length; i++)
            {
                tmp = tmp + array[i];
            }

            return tmp / array.Length;
        }
    }
}
