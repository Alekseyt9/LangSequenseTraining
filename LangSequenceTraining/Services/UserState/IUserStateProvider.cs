using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    public interface IUserStateProvider
    {
        UserStateModel GetState(Guid userId);

        void SetState(Guid userId, UserStateModel state);
    }
}
