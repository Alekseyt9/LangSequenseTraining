


using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal class ProcessorManager : IProcessorManager
    {
        private readonly IProcessorProvider _processorProvider;
        private readonly IUserStateProvider _stateProvider;

        private readonly IGptService _gptService;
        private readonly ITelegramBot _telegramBot;

        public ProcessorManager(
            IProcessorProvider processorProvider, IUserStateProvider stateProvider,
            IGptService gptService, ITelegramBot telegramBot
            )
        {
            _processorProvider = processorProvider;
            _stateProvider = stateProvider;
            _gptService = gptService;
            _telegramBot = telegramBot;
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
            var ctx = new ProcessorContext(_gptService, msg, _telegramBot, channelId);
            proc.Process(ctx);
        }

    }
}
