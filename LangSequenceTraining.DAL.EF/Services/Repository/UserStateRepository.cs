
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
            return _ctx.UserState.FirstOrDefault(x => x.UserId == userId);
        }

        public void SetUserState(Guid userId, UserState state)
        {
            if (state.Id == Guid.Empty)
            {
                _ctx.UserState.Add(state);
            }
            else
            {
                _ctx.UserState.Update(state);
            }

            _ctx.SaveChanges();
        }

    }
}
