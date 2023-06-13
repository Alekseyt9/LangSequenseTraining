

namespace LangSequenceTraining.Model.Services
{
    public interface IUserRepository
    {
        User GetUser(string userName);

        User GetUser(Guid id);

        void CreateUser(User user);
    }
}
