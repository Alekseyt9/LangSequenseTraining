
using LangSequenceTraining.Model;
using LangSequenceTraining.Model.Services;
using Newtonsoft.Json;

namespace LangSequenceTraining.Services
{
    internal class UserStateManager : IUserStateManager
    {
        private readonly IAppRepository _repository;
        private IUserRepository _userRepository;
        private IUserStateRepository _userStateRepository;

        public UserStateManager(IAppRepository repository, IUserRepository userRepository, IUserStateRepository userStateRepository)
        {
            _repository = repository;
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
