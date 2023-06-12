

namespace LangSequenceTraining.Services
{
    internal class TelegramMessageEventArgs
    {
        public string UserName { get; set; }
        public long ChannelId { get; set; }
        public string Message { get; set; }
    }
}
