using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal interface IUserProvider
    {
        User GetUser(string userName);

        User GetUser(Guid id);
    }
}
