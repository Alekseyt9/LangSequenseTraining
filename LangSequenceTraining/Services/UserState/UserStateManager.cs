
using LangSequenceTraining.Model;
using Newtonsoft.Json;

namespace LangSequenceTraining.Services
{
    internal class UserStateManager : IUserStateManager
    {
        private readonly IAppRepository _repository;

        public UserStateManager(IAppRepository repository)
        {
            _repository = repository;
        }

        public UserStateModel GetState(Guid userId)
        {
            var state = _repository.GetUserState(userId);
            if (state != null && !string.IsNullOrEmpty(state.State))
            {
                var jsonSerializerSettings = new JsonSerializerSettings()
                {
                    TypeNameHandling = TypeNameHandling.All
                };
                var obj = JsonConvert.DeserializeObject<UserStateModel>(state.State, jsonSerializerSettings);
                return obj;
            }

            return null;
        }

        public void SetState(Guid userId, UserStateModel state)
        {
            var jsonSerializerSettings = new JsonSerializerSettings()
            {
                TypeNameHandling = TypeNameHandling.All
            };
            var dataStr = JsonConvert.SerializeObject(state, jsonSerializerSettings);
            var st = _repository.GetUserState(userId);

            if (st == null)
            {
                var user = _repository.GetUser(userId);
                st = new UserState()
                {
                    Id = Guid.Empty,
                    User = user,
                    State = dataStr
                };
                _repository.SetUserState(userId, st);
            }

        }

    }
}
