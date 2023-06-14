
using LangSequenceTraining.Model;
using LangSequenceTraining.Services;

namespace LangSequenceTraining.Helpers
{
    public static class ExtResultHelper
    {
        public static void SaveExResult(ILearningService learningService, Guid userId,  List<MainExHistoryItem> hist)
        {
            var resultInfos = new List<TrainingResult>();
            var seqMap = new Dictionary<Guid, bool>();

            foreach (var h in hist)
            {
                if (seqMap.TryAdd(h.Sequence.Id, true))
                {
                    resultInfos.Add(new TrainingResult()
                    {
                        Sequence = h.Sequence,
                    });
                }

                if (!h.IsCorrect)
                {
                    seqMap[h.Sequence.Id] = false;
                }
            }

            foreach (var rInfo in resultInfos)
            {
                rInfo.IsSuccess = seqMap[rInfo.Sequence.Id];
            }

            learningService.SaveResult(userId, resultInfos);
        }

    }

}
