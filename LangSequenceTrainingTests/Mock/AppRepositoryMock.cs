
using LangSequenceTraining.Model;
using LangSequenceTraining.Services;

namespace LangSequenceTrainingTests.Mock
{
    internal class AppRepositoryMock : IAppRepository
    {
        public User GetUser(string userName)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<SequenceGroup> GetGroups()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Sequence> GetSequences(string groupName)
        {
            throw new NotImplementedException();
        }

        public UserState GetUserState(Guid userId)
        {
            throw new NotImplementedException();
        }

        public void SetUserState(Guid userId, UserState state)
        {
            throw new NotImplementedException();
        }
    }
}
