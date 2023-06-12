
using LangSequenceTraining.Model;
using LangSequenceTraining.Services;

namespace LangSequenceTraining.Helpers
{
    internal static class ExChoiceHelper
    {
        public static ExChoiceItem GetNextEx(List<MainExState> exStateHistory, List<Sequence> seqList, List<string> exList)
        {
            var ratingMap = CreateRatingMap(seqList, exList);

            var res =  GetRatingResult(ratingMap, seqList);
            return res;
        }

        private static ExChoiceItem GetRatingResult(Dictionary<string, int> ratingMap, List<Sequence> seqList)
        {
            if (ratingMap.Any(x => x.Value >= 0))
            {
                var r = ratingMap.Where(x => x.Value > 0).Max();
                var pKey = ParseKey(r.Key, seqList);
                return new ExChoiceItem()
                {
                    ExName = pKey.Item1,
                    Sequence = pKey.Item2
                };
            }

            return new ExChoiceItem()
            {
                IsFinish = true
            };
        }

        private static Dictionary<string, int> CreateRatingMap(List<Sequence> seqList, List<string> exList)
        {
            var ratingMap = new Dictionary<string, int>();
            foreach (var e in exList)
            {
                foreach (var s in seqList)
                {
                    ratingMap[GetKey(s, e)] = 0;
                }
            }

            return ratingMap;
        }

        private static Tuple<string, Sequence> ParseKey(string k, List<Sequence> seqList)
        {
            var arr = k.Split('$');
            var k1 = arr[0];
            var k2 = seqList.First(x => x.Id == Guid.Parse(arr[1]));
            return new Tuple<string, Sequence>(k1, k2);
        }

        private static string GetKey(Sequence s, string ex)
        {
            return $"{ex}${s.Id.ToString()}";
        }

    }

}
