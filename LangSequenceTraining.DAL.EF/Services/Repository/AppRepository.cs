
using LangSequenceTraining.Model;
using LangSequenceTraining.Services;

namespace LangSequenceTraining.DAL.Services
{
    public class AppRepository : IAppRepository
    {
        private readonly AppDbContext _ctx;

        public AppRepository(AppDbContext ctx)
        {
            _ctx = ctx;
        }

        public IEnumerable<SequenceGroup> GetGroups()
        {
            return _ctx.SequenceGroup.OrderBy(x => x.Name).ToList();
        }

        public IEnumerable<Sequence> GetSequences(string groupName)
        {
            var gr = _ctx.SequenceGroup.First(x => x.Name == groupName);
            return _ctx.Sequences.Where(x => x.SequenceGroupId == gr.Id).ToList();
        }

        public IEnumerable<Sequence> GetNewSequences(Guid userId, Guid groupId)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<UserSequenceProgress> GetProgressData(Guid userId)
        {
            return _ctx.UserSequenceProgress.Where(x => x.UserId == userId).ToList();
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

        public void SaveUserProgress(IEnumerable<UserSequenceProgress> prs)
        {
            foreach (var pr in prs)
            {
                if (pr.Id == Guid.Empty)
                {
                    _ctx.UserSequenceProgress.Add(pr);
                }
                else
                {
                    _ctx.UserSequenceProgress.Update(pr);
                }
            }
        }

        public IEnumerable<UserSequenceProgress> GetExistedProgress(Guid userId, IEnumerable<Guid> idsList)
        {
            var idsHs = new HashSet<Guid>(idsList);
            return _ctx.UserSequenceProgress.Where(x => x.UserId == userId && idsHs.Contains(x.Sequence.Id)).ToList();
        }

    }
}
