
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    public interface IAppRepositoryA
    {
        User GetUser(string userName);

        IEnumerable<SequenceGroup> GetGroups();

        IEnumerable<Sequence> GetSequences(string groupName);

        IEnumerable<Sequence> GetNewSequences(Guid userId, Guid groupId);

        IEnumerable<UserSequenceProgress> GetProgressData(Guid userId);

        UserState GetUserState(Guid userId);

        void SetUserState(Guid userId, UserState state);

    }
}
