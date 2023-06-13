
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Model;
using LangSequenceTraining.Model.Services;

namespace LangSequenceTraining.Services
{
    internal class UserRepository : IUserRepository
    {
        private readonly AppDbContext _ctx;

        public UserRepository(AppDbContext ctx)
        {
            _ctx = ctx;
        }

        public User GetUser(string userName)
        {
            return _ctx.Users.FirstOrDefault(x => x.Name == userName);
        }

        public User GetUser(Guid id)
        {
            return _ctx.Users.FirstOrDefault(x => x.Id == id);
        }

        public void CreateUser(User user)
        {
            _ctx.Users.Add(user);
            _ctx.SaveChanges();
        }

    }
}
