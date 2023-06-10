using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal class UserStateManager : IUserStateManager
    {
        private IAppRepository _repository;

        public UserStateManager(IAppRepository repository)
        {
            _repository = repository;
        }

        public UserStateModel GetState(Guid userId)
        {
            UserStateModel res = null;
            var state = _repository.GetUserState(userId);
            if (state != null && !string.IsNullOrEmpty(state.State))
            {

            }

            return res;
        }

        public void SetState(Guid userId, UserStateModel state)
        {

        }

    }
}
