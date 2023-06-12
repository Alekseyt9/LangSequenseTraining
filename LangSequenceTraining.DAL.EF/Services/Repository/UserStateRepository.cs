
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Model;
using LangSequenceTraining.Model.Services;

namespace LangSequenceTraining.Services
{
    internal class UserStateRepository : IUserStateRepository
    {
        private readonly AppDbContext _ctx;
        private MemCache<Guid, UserState> _userStateCache;

        public UserStateRepository(AppDbContext ctx)
        {
            _ctx = ctx;
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
