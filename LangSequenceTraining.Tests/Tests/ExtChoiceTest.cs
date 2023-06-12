
using LangSequenceTraining.Helpers;
using LangSequenceTraining.Services;
using Xunit;

namespace LangSequenceTraining.Tests
{
    public class ExtChoiceTest
    {
        [Fact]
        public void Test()
        {
            var hist = new List<MainExState>();
            var exNames = new string[] { "ex1", "ex2" };
            var res = ExChoiceHelper.GetNextEx(hist, exNames);

        }

    }


}
