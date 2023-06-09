
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal class ProcessorManager : IProcessorManager
    {
        private readonly IProcessorProvider _processorProvider;
        private readonly IUserStateProvider _stateProvider;

        private readonly IGptService _gptService;
        private readonly ITelegramBot _telegramBot;
        private readonly IAppRepository _repository;
        private readonly IProcessorManager _processorManager;

        public ProcessorManager(
            IProcessorProvider processorProvider, IUserStateProvider stateProvider,
            IGptService gptService, ITelegramBot telegramBot, 
            IAppRepository repository, IProcessorManager processorManager
            )
        {
            _processorProvider = processorProvider;
            _stateProvider = stateProvider;
            _gptService = gptService;
            _telegramBot = telegramBot;
            _repository = repository;
            _processorManager = processorManager;
        }

        public void Process(Guid userId, long channelId, string msg)
        {
            var state = _stateProvider.GetUserState(userId);

            if (state == null)
            {
                state = new UserStateModel()
                {
                    State = new Dictionary<string, object>(),
                    CurrentProcessorName = "main"
                };
            }

            var proc = _processorProvider.GetProcessor(state.CurrentProcessorName);
            var procState = state.State.ContainsKey(state.CurrentProcessorName)
                ? state.State[state.CurrentProcessorName]
                : null;
            var services = new ContextServices(_gptService, _telegramBot, _repository, _processorManager);
            var ctx = new ProcessorContext(services, msg, channelId);
            proc.Process(ctx);
        }

        public void DoTransition(string procName, object param)
        {

        }

    }
}
