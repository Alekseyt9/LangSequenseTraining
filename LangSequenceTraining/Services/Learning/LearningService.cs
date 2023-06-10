
using LangSequenceTraining.Model;
using LangSequenceTraining.Model.Base;
using System.Text.RegularExpressions;

namespace LangSequenceTraining.Services
{
    internal class LearningService : ILearningService
    {
        private readonly IAppRepository _repository;

        public LearningService(IAppRepository repository)
        {
            _repository = repository;
        }

        public IEnumerable<Sequence> GetSequencesForRepeat(Guid userId)
        {
            var progresses = _repository.GetProgressData(userId).Where(x => x.Stage != ProgressStage.Finish);
            // todo второй фильтр - по времени

            return progresses.Select(x => x.Sequence).ToList();
        }

        public IEnumerable<Sequence> GetSequencesNew(Guid userId, Guid groupId)
        {
            // todo из группы, за исключением тех, где есть прогресс 
            return null;
        }

        public void SaveResult(IEnumerable<TrainingResult> resultInfos)
        {
            throw new NotImplementedException();
        }

    }
}
