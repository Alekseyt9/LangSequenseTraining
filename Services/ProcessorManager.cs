
using LangSequenceTraining.Model;
using LangSequenceTraining.Services.TextToSpeech;

namespace LangSequenceTraining.Services
{
    internal class ProcessorManager : IProcessorManager
    {
        private readonly IProcessorProvider _processorProvider;
        private readonly IUserStateProvider _stateProvider;
        private readonly IGptService _gptService;
        private readonly ITelegramBot _telegramBot;
        private readonly IAppRepository _repository;
        private readonly ITextToSpeech _textToSpeech;

        public ProcessorManager(
            IProcessorProvider processorProvider, IUserStateProvider stateProvider,
            IGptService gptService, ITelegramBot telegramBot, 
            IAppRepository repository, ITextToSpeech textToSpeech
            )
        {
            _processorProvider = processorProvider;
            _stateProvider = stateProvider;
            _gptService = gptService;
            _telegramBot = telegramBot;
            _repository = repository;
            _textToSpeech = textToSpeech;
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
            var procState = state.State.ContainsKey(state.CurrentProcessorName)
                ? (ProcessorStateBase)state.State[state.CurrentProcessorName]
                : null;
            if (procState == null)
            {
                procState = new ProcessorStateBase()
                {
                    ChannelId = channelId,
                    Message = msg
                };
            }

            DoTransition(state.CurrentProcessorName, procState);
        }

        public void DoTransition(string procName, ProcessorStateBase procState)
        {
            var proc = _processorProvider.GetProcessor(procName);
            var services = new ContextServices(_gptService, _telegramBot, _repository, this, _textToSpeech);
            var ctx = new ProcessorContext(services, procState.Message, procState.ChannelId);
            proc.Process(ctx, procState);
        }

    }
}
