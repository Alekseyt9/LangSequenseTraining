
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal interface IAppRepository
    {
        User GetUser(string userId);
    }
}
