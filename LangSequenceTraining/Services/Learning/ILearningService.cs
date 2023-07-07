
using LangSequenceTraining.Model;
using LangSequenceTraining.Services.Learning;

namespace LangSequenceTraining.Services
{
    public interface ILearningService
    {
        IEnumerable<Sequence> GetSequencesForRepeat(Guid userId);

        IEnumerable<Sequence> GetSequencesNew(Guid userId, Guid groupId);

        void SaveResult(Guid userId, IEnumerable<TrainingResult> resultInfos);

        IEnumerable<UserSequenceProgress> GetWaitingItems(Guid userId);

    }
}
