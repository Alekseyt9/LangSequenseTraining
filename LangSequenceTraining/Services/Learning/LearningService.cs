
using LangSequenceTraining.Helpers;
using LangSequenceTraining.Model;
using LangSequenceTraining.Services.Learning;

namespace LangSequenceTraining.Services
{
    internal class LearningService : ILearningService
    {
        private class WaitingStat
        {
            public int RepeatCount { get; set; }
            public int WaitingCount { get; set; }
        }

        private readonly IAppRepository _repository;
        private readonly IAppRepositoryA _repositoryA;
        private readonly IUserProvider _userProvider;
        private readonly ISequenceProvider _sequenceProvider;

        public LearningService(IAppRepository repository, IAppRepositoryA repositoryA, 
            IUserProvider userProvider, ISequenceProvider sequenceProvider)
        {
            _repository = repository;
            _repositoryA = repositoryA;
            _userProvider = userProvider;
            _sequenceProvider = sequenceProvider;
        }

        public IEnumerable<Sequence> GetSequencesForRepeat(Guid userId)
        {
            var items = _repositoryA.GetWaitingItems(userId);
            var repItems = ExRepeatHelper.GetRepItems(items).OrderByDescending(x => x.LastUpdateTime).ToList();
            return repItems.Select(x => _sequenceProvider.GetSequence(x.SequenceId)).ToList();
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

        public StatInfo GetUserStat(Guid userId)
        {
            var infos = _repositoryA.GetWaitingItems(userId);
            var wStat = GetWaitingStat(infos);

            return new StatInfo()
            {
                FinishCount = _repositoryA.GetFinishCount(userId),
                NewCount = _repositoryA.GetNewCount(userId),
                WaitingCount = wStat.WaitingCount,
                Repeat = wStat.RepeatCount
            };
        }

        public IEnumerable<UserSequenceProgress> GetWaitingItems(Guid userId)
        {
            return _repositoryA.GetWaitingItems(userId);
        }

        private WaitingStat GetWaitingStat(IEnumerable<UserSequenceProgress> items)
        {
            var repItems = ExRepeatHelper.GetRepItems(items);

            return new WaitingStat()
            {
                RepeatCount = repItems.Count,
                WaitingCount = items.Count() - repItems.Count
            };
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
                if (!pr.StartTime.HasValue)
                {
                    pr.StartTime = DateTime.Now.ToUniversalTime();
                }
                pr.LastSuccess = resInfo.IsSuccess;

                if (resInfo.IsSuccess)
                {
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
