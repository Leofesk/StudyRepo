using NUnit.Framework;

namespace FindAverageValueOfArray
{
    [TestFixture]
    class WorkWithArrayTests
    {
        [Test]
        [Description("AverageCalculating")]
        [Category("Base")]
        public void AverageCalculating()
        {
            int[] array = {2, 3, 4};
            Assert.AreEqual(3, WorkWithArray.FindAverage(array), "The method does not calculate the correct average value!");
        }

        [Test]
        [Description("GenerateArrayLength")]
        [Category("Base")]
        public void GenerateArrayLength()
        {
            int[] array = WorkWithArray.Generate(10);
            Assert.AreEqual(10, array.Length, "The method generates not correct number of array elements!");
        }
    }
}
