
using LangSequenceTraining.Model;
using LangSequenceTraining.Model.Services;
using Newtonsoft.Json;

namespace LangSequenceTraining.Services
{
    /// <summary>
    /// todo   кэш на этом уровне, а не IUserStateRepository 
    /// </summary>
    internal class UserStateProvider : IUserStateProvider
    {
        private readonly IUserRepository _userRepository;
        private readonly IUserStateRepository _userStateRepository;

        public UserStateProvider(IUserRepository userRepository, IUserStateRepository userStateRepository)
        {
            _userRepository = userRepository;
            _userStateRepository = userStateRepository;
        }

        public UserStateModel GetState(Guid userId)
        {
            var state = _userStateRepository.GetUserState(userId);
            if (state != null && !string.IsNullOrEmpty(state.State))
            {
                var jsonSerializerSettings = new JsonSerializerSettings()
                {
                    TypeNameHandling = TypeNameHandling.All
                };
                var obj = JsonConvert.DeserializeObject<UserStateModel>(state.State, jsonSerializerSettings);
                return obj;
            }

            var stateModel = new UserStateModel()
            {
                ContextState = new ContextState(),
                CurrentProcessorName = "main",
                ProcessorStates = new Dictionary<string, ProcessorStateBase>()
            };

            return stateModel;
        }

        public void SetState(Guid userId, UserStateModel state)
        {
            var jsonSerializerSettings = new JsonSerializerSettings()
            {
                TypeNameHandling = TypeNameHandling.All
            };
            var dataStr = JsonConvert.SerializeObject(state, jsonSerializerSettings);
            var st = _userStateRepository.GetUserState(userId);

            if (st == null)
            {
                var user = _userRepository.GetUser(userId);
                st = new UserState()
                {
                    Id = Guid.Empty,
                    User = user,
                };
            }

            st.State = dataStr;
            _userStateRepository.SetUserState(userId, st);
        }

    }
}
