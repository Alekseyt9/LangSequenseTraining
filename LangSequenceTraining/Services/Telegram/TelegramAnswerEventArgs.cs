

namespace LangSequenceTraining.Services
{
    internal class TelegramAnswerEventArgs
    {
        public string UserName { get; set; }

        public long ChannelId { get; set; }

        public string Message { get; set; }

        public string? CallbackTag { get; set; }
    }
}
