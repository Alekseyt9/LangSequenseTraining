
using LangSequenceTraining.Model;
using LangSequenceTraining.Services;

namespace LangSequenceTraining.Helpers
{
    internal static class ExChoiceHelper
    {
        public static ExChoiceItem GetNextEx(List<MainExState> exStateHistory, List<Sequence> seqList, List<string> exList)
        {
            var ratingMap = CreateRatingMap(seqList, exList);
            AcceptRating(ratingMap, exStateHistory);
            var res =  GetRatingResult(ratingMap, seqList);
            return res;
        }

        private static void AcceptRating(Dictionary<string, int> ratingMap, List<MainExState> exStateHistory)
        {
            var exCountMap = new Dictionary<string, int>();
            var seqCountMap = new Dictionary<Guid, int>();
            foreach (var h in exStateHistory)
            {
                seqCountMap[h.Sequence.Id]++;
                exCountMap[h.ExName]++;
            }

            var seqMax = seqCountMap.Max(x => x.Value);
            var exMax = exCountMap.Max(x => x.Value);

            // + 1 если менее часто, чем максимальная частота по паттерну
            foreach (var seqPair in seqCountMap.Where(x => x.Value < seqMax))
            {
                foreach (var h in exStateHistory.Where(x => x.Sequence.Id == seqPair.Key))
                {
                    ratingMap[GetKey(h)]++;
                }
            }

            // + 1 если менее часто, чем максимальная частота по упражнению
            foreach (var exPair in exCountMap.Where(x => x.Value < exMax))
            {
                foreach (var h in exStateHistory.Where(x => x.ExName == exPair.Key))
                {
                    ratingMap[GetKey(h)]++;
                }
            }

            // сбрасываем до -1, если пара уже имела успех
            foreach (var h in exStateHistory.Where(x => x.IsCorrect))
            {
                ratingMap[GetKey(h)] = -1;
            }

            // сбрасываем до -1, если больше или равно 3 неудачных попыток для пары паттерн-упражнение
            foreach (var hGroup in exStateHistory.Where(x => !x.IsCorrect).GroupBy(GetKey))
            {
                if (hGroup.Count() >= 3)
                {
                    ratingMap[hGroup.Key] = -1;
                }
            }

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
            return $"{ex}${s.Id}";
        }

        private static string GetKey(MainExState h)
        {
            return $"{h.ExName}${h.Sequence.Id}";
        }

    }

}
