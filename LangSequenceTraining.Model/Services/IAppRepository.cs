
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    public interface IAppRepository
    {
        User GetUser(string userName);

        IEnumerable<SequenceGroup> GetGroups();

        IEnumerable<Sequence> GetSequences(string groupName);

        IEnumerable<UserSequenceProgress> GetProgressData(Guid userId);

        UserState GetUserState(Guid userId);

        void SetUserState(Guid userId, UserState state);

    }
}
