

namespace LangSequenceTraining.Services
{
    internal class ProcessorContext
    {
        private IGptService _gptService;
        private string _message;
        private ITelegramBot _telegramBot;
        private long _telegramChannelId;

        public IGptService GptService => _gptService;

        public string Message => _message;

        public ProcessorContext(IGptService gptService, string message, ITelegramBot telegramBot, long telegramChannelId)
        {
            _gptService = gptService;
            _message = message;
            _telegramBot = telegramBot;
            _telegramChannelId = telegramChannelId;
        }

        public void SendMessage(string msg)
        {
            _telegramBot.SendMessage(_telegramChannelId, msg);
        }

    }
}
