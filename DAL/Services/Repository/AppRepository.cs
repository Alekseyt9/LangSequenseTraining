
using LangSequenceTraining.Model;
using LangSequenceTraining.Services;

namespace LangSequenceTraining.DAL.Services
{
    internal class AppRepository : IAppRepository
    {
        private AppDbContext _ctx;

        public AppRepository(AppDbContext ctx)
        {
            _ctx = ctx;
        }

        public User GetUser(string userName)
        {
            var user = _ctx.Users.FirstOrDefault(x => x.Name == userName);
            if (user == null)
            {
                user = new User()
                {
                    Id = Guid.NewGuid(),
                    Name = userName,
                };
                _ctx.Users.Add(user);
                _ctx.SaveChanges();
            }

            return user;
        }

        public IEnumerable<SequenceGroup> GetGroups()
        {
            return _ctx.SequenceGroup.OrderBy(x => x.Name).ToList();
        }

    }
}
