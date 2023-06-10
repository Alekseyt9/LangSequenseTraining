
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services.Learning
{
    internal class LearningService : ILearningService
    {
        public IEnumerable<Sequence> GetSequencesForRepeat(Guid userId)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Sequence> GetSequencesNew(Guid userId, Guid groupId)
        {
            throw new NotImplementedException();
        }

        public void SaveResult(IEnumerable<TrainingResult> resultInfos)
        {
            throw new NotImplementedException();
        }

    }
}
