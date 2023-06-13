
using LangSequenceTraining.Model;
using LangSequenceTraining.Model.Services;
using Newtonsoft.Json;

namespace LangSequenceTraining.Services
{
    internal class UserStateProvider : IUserStateProvider
    {
        private readonly IUserProvider _userProvider;
        private readonly IUserStateRepository _userStateRepository;
        private readonly MemCache<Guid, UserStateModel> _stateCache = new MemCache<Guid, UserStateModel>();

        public UserStateProvider(IUserProvider userProvider, IUserStateRepository userStateRepository)
        {
            _userProvider = userProvider;
            _userStateRepository = userStateRepository;
        }

        public UserStateModel GetState(Guid userId)
        {
            var obj = _stateCache.GetOrCreate(userId, id =>
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
            });

            return obj;
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
                var user = _userProvider.GetUser(userId);
                st = new UserState()
                {
                    Id = Guid.Empty,
                    User = user,
                };
            }
            st.State = dataStr;

            _stateCache.Set(userId, st);
            Task.Run(() =>
            {
                _userStateRepository.SetUserState(userId, st);
            });
        }

    }
}
