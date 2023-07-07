
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    public interface IAppRepositoryA
    {
        IEnumerable<Sequence> GetNewSequences(Guid userId, Guid groupId);

        IEnumerable<UserSequenceProgress> GetWaitingItems(Guid userId);

        IEnumerable<UserGroupStats> GetUserStats(Guid userId);

    }
}
