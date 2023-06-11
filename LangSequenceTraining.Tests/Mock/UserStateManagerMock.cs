
using LangSequenceTraining.Model;
using LangSequenceTraining.Services;

namespace LangSequenceTraining.Tests
{
    internal class UserStateManagerMock : IUserStateManager
    {
        private readonly Dictionary<Guid, UserStateModel> _modelMap = new Dictionary<Guid, UserStateModel>();

        public UserStateModel GetState(Guid userId)
        {
            if (_modelMap.ContainsKey(userId))
            {
                return _modelMap[userId];
            }

            var state = new UserStateModel()
            {
                ContextState = new ContextState(),
                CurrentProcessorName = "main",
                ProcessorStates = new Dictionary<string, ProcessorStateBase>()
            };
            return state;
        }

        public void SetState(Guid userId, UserStateModel state)
        {
            _modelMap[userId] = state;
        }

    }
}
