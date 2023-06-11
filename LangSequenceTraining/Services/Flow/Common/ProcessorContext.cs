

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

        public void SendMessage(string msg, FileData file = null)
        {
            _services.TelegramBot.SendMessage(_state.ChannelId, msg, file);
        }

    }
}
