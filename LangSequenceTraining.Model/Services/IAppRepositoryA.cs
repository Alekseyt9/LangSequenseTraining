
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    public interface IAppRepositoryA
    {
        IEnumerable<Sequence> GetNewSequences(Guid userId, Guid groupId);

        int GetFinishCount(Guid userId);

        int GetNewCount(Guid userId);

        IEnumerable<UserSequenceProgress> GetWaitingItems(Guid userId);

        IEnumerable<UserGroupStats> GetUserStats(Guid userId);

    }
}
