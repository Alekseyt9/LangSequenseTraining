using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services.Learning
{
    internal interface ILearningService
    {
        IEnumerable<Sequence> GetSequencesForRepeat(Guid userId);

        IEnumerable<Sequence> GetSequencesNew(Guid userId, Guid groupId);

        void SaveResult(IEnumerable<TrainingResult> resultInfos);

    }
}
