﻿
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal class ProcessorManager : IProcessorManager
    {
        private readonly IProcessorProvider _processorProvider;
        private readonly IUserStateManager _stateManager;
        private readonly IGptCheckService _gptCheckService;
        private readonly ITelegramBot _telegramBot;
        private readonly IAppRepository _repository;
        private readonly ITextToSpeech _textToSpeech;
        private readonly IUserStateManager _userStateManager;
        private readonly ILearningService _learningService;

        public ProcessorManager(
            IProcessorProvider processorProvider, IUserStateManager stateManager,
            IGptCheckService gptCheckService, ITelegramBot telegramBot,
            IAppRepository repository, ITextToSpeech textToSpeech,
            IUserStateManager userStateManager, ILearningService learningService
        )
        {
            _processorProvider = processorProvider;
            _stateManager = stateManager;
            _gptCheckService = gptCheckService;
            _telegramBot = telegramBot;
            _repository = repository;
            _textToSpeech = textToSpeech;
            _userStateManager = userStateManager;
            _learningService = learningService;
        }

        public void Process(Guid userId, long channelId, string msg)
        {
            var state = _stateManager.GetState(userId);
            if (state == null)
            {
                state = new UserStateModel()
                {
                    ProcessorStates = new Dictionary<string, ProcessorStateBase>(),
                    CurrentProcessorName = "main",
                };
            }

            state.ContextState = new ContextState()
            {
                Message = msg
            };

            var ctx = new ProcessorContext(new ContextServices(_gptCheckService, _telegramBot, _repository,
                    this, _textToSpeech, _learningService), state.ContextState);

            DoTransition(ctx, state.CurrentProcessorName, null);
        }

        public void DoTransition(ProcessorContext ctx, string nextProcName, TransitionMessageBase trMsg)
        {
            var userState = _userStateManager.GetState(ctx.State.UserId);
            userState.ProcessorStates[userState.CurrentProcessorName] = ctx.State.CurProcState;
            _userStateManager.SetState(ctx.State.UserId, userState);

            var proc = _processorProvider.GetProcessor(nextProcName);
            
            var nextProcState = userState != null && userState.ProcessorStates.ContainsKey(nextProcName)
                ? (ProcessorStateBase)userState?.ProcessorStates[nextProcName]
                : null;
            ctx.State.CurProcState = nextProcState;
            proc.Process(ctx, trMsg);
        }

    }
}
