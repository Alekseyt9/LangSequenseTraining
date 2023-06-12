
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
            var seqList = GetTestSeqs();

            var res = ExChoiceHelper.GetNextEx(hist, seqList, exNames);
            if (!res.IsFinish)
            {
                hist.Add(new MainExState()
                {
                    Sequence = res.Sequence,
                    ExName = res.ExName,
                    IsCorrect = true
                });
            }

            var i = 0;
            while (!res.IsFinish || i < 100)
            {
                res = ExChoiceHelper.GetNextEx(hist, seqList, exNames);
                if (!res.IsFinish)
                {
                    hist.Add(new MainExState()
                    {
                        Sequence = res.Sequence,
                        ExName = res.ExName,
                        IsCorrect = true
                    });
                }
                i++;
            }
            Assert.True(res.IsFinish);
        }

        private List<Sequence> GetTestSeqs()
        {
            return new List<Sequence>()
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
        }

    }


}
