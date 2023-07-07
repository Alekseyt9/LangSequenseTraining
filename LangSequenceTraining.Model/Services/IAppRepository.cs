
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    public interface IAppRepository
    {
        IEnumerable<SequenceGroup> GetGroups();

        IEnumerable<Sequence> GetSequences();

        void SaveUserProgress(IEnumerable<UserSequenceProgress> prs);

        IEnumerable<UserSequenceProgress> GetExistedProgress(Guid userId, IEnumerable<Guid> idsList);

    }
}
