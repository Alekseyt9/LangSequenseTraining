
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    public interface IAppRepository
    {


        IEnumerable<SequenceGroup> GetGroups();

        IEnumerable<Sequence> GetSequences(string groupName);

        IEnumerable<Sequence> GetNewSequences(Guid userId, Guid groupId);

        IEnumerable<UserSequenceProgress> GetProgressData(Guid userId);

        UserState GetUserState(Guid userId);

        void SetUserState(Guid userId, UserState state);

        void SaveUserProgress(IEnumerable<UserSequenceProgress> prs);

        IEnumerable<UserSequenceProgress> GetExistedProgress(Guid userId, IEnumerable<Guid> idsList);

    }
}
