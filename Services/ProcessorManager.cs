


namespace LangSequenceTraining.Services
{
    internal class ProcessorManager : IProcessorManager
    {
        private readonly IProcessorProvider _processorProvider;
        private readonly IUserStateProvider _stateProvider;

        public ProcessorManager(IProcessorProvider processorProvider, IUserStateProvider stateProvider)
        {
            _processorProvider = processorProvider;
            _stateProvider = stateProvider;
        }

        public void Process(Guid userId, string msg)
        {
            var state = _stateProvider.GetUserState(userId);
            var proc = _processorProvider.GetProcessor(state.CurrentProcessorName);
            var procState = state.State.ContainsKey(state.CurrentProcessorName)
                ? state.State[state.CurrentProcessorName]
                : null;
            proc.Process(procState, msg);
        }

    }
}
