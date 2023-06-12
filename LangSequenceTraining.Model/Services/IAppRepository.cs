
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    public interface IAppRepository
    {
        IEnumerable<SequenceGroup> GetGroups();

        IEnumerable<Sequence> GetSequences(string groupName);

        IEnumerable<UserSequenceProgress> GetProgressData(Guid userId);

        void SaveUserProgress(IEnumerable<UserSequenceProgress> prs);

        IEnumerable<UserSequenceProgress> GetExistedProgress(Guid userId, IEnumerable<Guid> idsList);

    }
}
