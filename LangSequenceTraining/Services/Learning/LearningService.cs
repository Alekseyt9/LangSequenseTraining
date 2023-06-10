
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal class LearningService : ILearningService
    {
        private IAppRepository _repository;

        public LearningService(IAppRepository repository)
        {
            _repository = repository;
        }

        public IEnumerable<Sequence> GetSequencesForRepeat(Guid userId)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Sequence> GetSequencesNew(Guid userId, Guid groupId)
        {
            
        }

        public void SaveResult(IEnumerable<TrainingResult> resultInfos)
        {
            throw new NotImplementedException();
        }

    }
}
