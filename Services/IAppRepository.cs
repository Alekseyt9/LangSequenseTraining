
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal interface IAppRepository
    {
        User GetUser(string userName);

        IEnumerable<SequenceGroup> GetGroups();

        IEnumerable<Sequence> GetSequences(string groupName);

        UserState GetUserState(Guid userId);

        void SetUserState(Guid userId, UserState state);

    }
}
