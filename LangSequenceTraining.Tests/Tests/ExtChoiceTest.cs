
using LangSequenceTraining.Helpers;
using LangSequenceTraining.Model;
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
            var exNames = new List<string>() { "ex1", "ex2" };

            var seqList = new List<Sequence>()
            {
                new Sequence()
                {
                    Id = new Guid("1873D1BA-4103-4F3C-9A28-60BFC02CED14"),
                    Text = "seq1"
                },
                new Sequence()
                {
                    Id = new Guid("3737BD86-A1FF-4A16-BCF2-DA374AC1E368"),
                    Text = "seq2"
                },
                new Sequence()
                {
                    Id = new Guid("B3CCC125-CCBF-4B84-8711-A4F3CE33446E"),
                    Text = "seq3"
                },
            };

            var res = ExChoiceHelper.GetNextEx(hist, seqList, exNames);

        }

    }


}
