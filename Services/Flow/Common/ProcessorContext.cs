

namespace LangSequenceTraining.Services
{
    internal class ProcessorContext
    {
        private string _message;
        private long _telegramChannelId;
        private ContextServices _services;

        public string Message => _message;

        public long ChannelId => _telegramChannelId;

        public ContextServices Services => _services;

        public ProcessorContext(ContextServices services, string message, long telegramChannelId)
        {
            _message = message;
            _telegramChannelId = telegramChannelId;
            _services = services;
        }

        public void SendMessage(string msg, FileData file = null)
        {
            _services.TelegramBot.SendMessage(_telegramChannelId, msg, file);
        }

    }
}
