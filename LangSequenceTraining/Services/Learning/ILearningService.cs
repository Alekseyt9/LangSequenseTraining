
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    public interface ILearningService
    {
        IEnumerable<Sequence> GetSequencesForRepeat(Guid userId);

        IEnumerable<Sequence> GetSequencesNew(Guid userId, Guid groupId);

        void SaveResult(Guid userId, IEnumerable<TrainingResult> resultInfos);
    }
}
