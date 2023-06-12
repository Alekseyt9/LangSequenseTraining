

using Telegram.Bot;

namespace LangSequenceTraining.Services
{
    internal interface ITelegramBot
    {
        public delegate Task AsyncEventHandler(object sender, TelegramMessageEventArgs e);

        event AsyncEventHandler? ReceiveMessage;

        Task SendMessage(long channelId, string msg, FileData file = null);
    }
}
