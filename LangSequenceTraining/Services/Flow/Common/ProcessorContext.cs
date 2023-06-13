

namespace LangSequenceTraining.Services
{
    internal class ProcessorContext
    {
        private readonly ContextServices _services;
        private readonly ContextState _state;

        public ContextServices Services => _services;

        public ContextState State => _state;

        public ProcessorContext(ContextServices services, ContextState state)
        {
            _state = state;
            _services = services;
        }

        public async Task SendMessage(string msg, FileData file = null)
        {
            await _services.TelegramBot.SendMessage(_state.ChannelId, msg, file);
        }

        public async Task DoTransition(string procName, TransitionMessageBase trMsg)
        {
            _services.ProcessorManager.SaveProcState(this);
            await _services.ProcessorManager.DoTransition(this, procName, trMsg);
        }

        public void End()
        {
            _services.ProcessorManager.SaveProcState(this);
        }

    }
}
