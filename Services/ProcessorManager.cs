
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal class ProcessorManager : IProcessorManager
    {
        private readonly IProcessorProvider _processorProvider;
        private readonly IUserStateManager _stateManager;
        private readonly IGptService _gptService;
        private readonly ITelegramBot _telegramBot;
        private readonly IAppRepository _repository;
        private readonly ITextToSpeech _textToSpeech;
        private readonly UserStateManager _userStateManager;

        public ProcessorManager(
            IProcessorProvider processorProvider, IUserStateManager stateManager,
            IGptService gptService, ITelegramBot telegramBot, 
            IAppRepository repository, ITextToSpeech textToSpeech, UserStateManager userStateManager
            )
        {
            _processorProvider = processorProvider;
            _stateManager = stateManager;
            _gptService = gptService;
            _telegramBot = telegramBot;
            _repository = repository;
            _textToSpeech = textToSpeech;
            _userStateManager = userStateManager;
        }

        public void Process(Guid userId, long channelId, string msg)
        {
            var state = _stateManager.GetState(userId);
            if (state == null)
            {
                state = new UserStateModel()
                {
                    ProcessorStates = new Dictionary<string, object>(),
                    CurrentProcessorName = "main"
                };
            }
            /*var procState = state.ProcessorStates.ContainsKey(state.CurrentProcessorName)
                ? (ProcessorStateBase)state.ProcessorStates[state.CurrentProcessorName]
                : null;*/

            var ctx = new ProcessorContext(
                new ContextServices(_gptService, _telegramBot, _repository, this, _textToSpeech),
                state.ContextState);

            DoTransition(ctx, state.CurrentProcessorName, null);
        }

        public void DoTransition(ProcessorContext ctx, string procName, TransitionMessageBase trMsg)
        {
            var proc = _processorProvider.GetProcessor(procName);
            var userState = _userStateManager.GetState(ctx.State.UserId);
            var procState = userState != null && userState.ProcessorStates.ContainsKey(procName)
                ? (ProcessorStateBase)userState?.ProcessorStates[procName]
                : null;
            proc.Process(ctx, procState, trMsg);
        }

    }
}
