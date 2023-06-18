
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal class ProcessorManager : IProcessorManager
    {
        private readonly IProcessorProvider _processorProvider;
        private readonly IUserStateProvider _stateProvider;
        private readonly ICheckServiceProvider _checkServiceProvider;
        private readonly ITelegramBot _telegramBot;
        private readonly IAppRepository _repository;
        private readonly ITextToSpeech _textToSpeech;
        private readonly IUserStateProvider _userStateProvider;
        private readonly ILearningService _learningService;
        private readonly ISequenceProvider _sequenceProvider;

        public ProcessorManager(
            IProcessorProvider processorProvider, IUserStateProvider stateProvider,
            ICheckServiceProvider checkServiceProvider, ITelegramBot telegramBot,
            IAppRepository repository, ITextToSpeech textToSpeech,
            IUserStateProvider userStateProvider, ILearningService learningService,
            ISequenceProvider sequenceProvider
        )
        {
            _processorProvider = processorProvider;
            _stateProvider = stateProvider;
            _checkServiceProvider = checkServiceProvider;
            _telegramBot = telegramBot;
            _repository = repository;
            _textToSpeech = textToSpeech;
            _userStateProvider = userStateProvider;
            _learningService = learningService;
            _sequenceProvider = sequenceProvider;
        }

        public async Task Process(Guid userId, long channelId, string msg)
        {
            var state = _stateProvider.GetState(userId);
            if (state == null)
            {
                state = new UserStateModel()
                {
                    ProcessorStates = new Dictionary<string, ProcessorStateBase>(),
                    CurrentProcessorName = "main",
                };
            }

            if (string.IsNullOrEmpty(state.CurrentProcessorName))
            {
                state.CurrentProcessorName = "main";
            }

            state.ContextState = new ContextState()
            {
                Message = msg,
                UserId = userId,
                ChannelId = channelId,
            };

            var ctx = new ProcessorContext(new ContextServices(_checkServiceProvider, _telegramBot, _repository,
                    this, _textToSpeech, _learningService, _sequenceProvider), state.ContextState);

            await DoTransition(ctx, state.CurrentProcessorName, null);
        }

        public async Task DoTransition(ProcessorContext ctx, string nextProcName, TransitionMessageBase trMsg)
        {
            try
            {
                var userState = _userStateProvider.GetState(ctx.State.UserId);
                userState.CurrentProcessorName = nextProcName;
                _userStateProvider.SetState(ctx.State.UserId, userState);

                var proc = _processorProvider.GetProcessor(nextProcName);
                var nextProcState = userState != null && userState.ProcessorStates.ContainsKey(nextProcName)
                    ? (ProcessorStateBase)userState?.ProcessorStates[nextProcName]
                    : null;
                ctx.State.CurProcState = nextProcState;
                await proc.Process(ctx, trMsg);
            }
            catch (Exception ex)
            {
                await ctx.SendMessage($"Ошибка: {ex.Message} {ex.InnerException?.Message}");
            }
        }

        public void SaveProcState(ProcessorContext ctx)
        {
            var userState = _userStateProvider.GetState(ctx.State.UserId);
            userState.ProcessorStates[userState.CurrentProcessorName] = ctx.State.CurProcState;
            _userStateProvider.SetState(ctx.State.UserId, userState);
        }

    }
}
