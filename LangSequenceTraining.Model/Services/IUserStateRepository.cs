

namespace LangSequenceTraining.Model.Services
{
    public interface IUserStateRepository
    {
        UserState GetUserState(Guid userId);

        void SetUserState(Guid userId, UserState state);
    }
}
