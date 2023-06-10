using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services.UserState
{
    internal interface IUserStateManager
    {
        UserStateModel GetState(Guid userId);

        void SetState(Guid userId, UserStateModel state);
    }
}
