
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal interface IUserStateProvider
    {
        UserStateModel GetUserState(Guid userId);
    }
}
