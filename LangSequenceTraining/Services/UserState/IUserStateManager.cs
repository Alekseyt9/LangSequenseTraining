using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal interface IUserStateManager
    {
        UserStateModel GetState(Guid userId);

        void SetState(Guid userId, UserStateModel state);
    }
}
