
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal class LearningService : ILearningService
    {
        private readonly IAppRepository _repository;
        private readonly IAppRepositoryA _repositoryA;

        public LearningService(IAppRepository repository, IAppRepositoryA repositoryA)
        {
            _repository = repository;
            _repositoryA = repositoryA;
        }

        public IEnumerable<Sequence> GetSequencesForRepeat(Guid userId)
        {
            var progresses = _repository.GetProgressData(userId).Where(x => x.Stage != ProgressStage.Finish);
            // todo второй фильтр - по времени

            return progresses.Select(x => x.Sequence).ToList();
        }

        public IEnumerable<Sequence> GetSequencesNew(Guid userId, Guid groupId)
        {
            var res = _repositoryA.GetNewSequences(userId, groupId);
            return res;
        }

        public void SaveResult(IEnumerable<TrainingResult> resultInfos)
        {
            throw new NotImplementedException();
        }

    }
}
