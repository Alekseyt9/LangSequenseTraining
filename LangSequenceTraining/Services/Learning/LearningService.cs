
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal class LearningService : ILearningService
    {
        private readonly IAppRepository _repository;
        private readonly IAppRepositoryA _repositoryA;
        private readonly IUserProvider _userProvider;

        public LearningService(IAppRepository repository, IAppRepositoryA repositoryA, IUserProvider userProvider)
        {
            _repository = repository;
            _repositoryA = repositoryA;
            _userProvider = userProvider;
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

        public void SaveResult(Guid userId, IEnumerable<TrainingResult> resultInfos)
        {
            var idsList = resultInfos.Select(x => x.Sequence.Id);
            var prs = _repository.GetExistedProgress(userId, idsList).ToList();

            AddNewProgress(userId, prs, resultInfos);
            ApplyProgress(prs, resultInfos);

            _repository.SaveUserProgress(prs);
        }

        private void AddNewProgress(Guid userId, List<UserSequenceProgress> res, IEnumerable<TrainingResult> resultInfos)
        {
            var map = res.ToDictionary(x => x.Sequence.Id, y => y);
            var user = _userProvider.GetUser(userId);

            foreach (var pr in resultInfos)
            {
                if (!map.ContainsKey(pr.Sequence.Id))
                {
                    res.Add(new UserSequenceProgress()
                    {
                        Sequence = pr.Sequence,
                        Stage = ProgressStage.Start,
                        User = user
                    });
                }
            }
        }

        private void ApplyProgress(IEnumerable<UserSequenceProgress> prInfos, IEnumerable<TrainingResult> resultInfos)
        {
            var map = resultInfos.ToDictionary(x => x.Sequence.Id, y => y);
            foreach (var pr in prInfos)
            {
                var resInfo = map[pr.Sequence.Id];

                pr.LastUpdateTime = DateTime.Now.ToUniversalTime();
                pr.StartTime = DateTime.Now.ToUniversalTime();

                if (resInfo.IsSuccess)
                {
                    pr.LastSuccessTime = DateTime.Now.ToUniversalTime();
                    pr.Stage = GetNextStage(pr.Stage);
                }

            }
        }

        private ProgressStage GetNextStage(ProgressStage stage)
        {
            if (stage != ProgressStage.Finish)
            {
                stage = (ProgressStage)((int)stage + 1);
            }

            return stage;
        }

    }
}
