
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Model;
using LangSequenceTraining.Model.Services;
using LangSequenceTraining.Services;

namespace LangSequenceTraining.Services
{
    internal class UserRepository : IUserRepository
    {
        private readonly AppDbContext _ctx;
        private MemCache<string, User> _usersNameCache;
        private MemCache<string, User> _usersIdCache;

        public UserRepository(AppDbContext ctx)
        {
            _ctx = ctx;
        }

        public User GetUser(string userName)
        {
            var obj = _usersNameCache.GetOrCreate(userName, y =>
            {
                var user = _ctx.Users.FirstOrDefault(x => x.Name == y);
                if (user == null)
                {
                    user = new User()
                    {
                        Id = Guid.NewGuid(),
                        Name = y,
                    };
                    _ctx.Users.Add(user);
                    _ctx.SaveChanges();
                }

                return user;
            });

            return obj;
        }

        public User GetUser(Guid id)
        {
            var obj = _usersIdCache.GetOrCreate(id, y =>
            {
                var user = _ctx.Users.FirstOrDefault(x => x.Id == y);
                return user;
            });
            return obj;
        }

    }
}
