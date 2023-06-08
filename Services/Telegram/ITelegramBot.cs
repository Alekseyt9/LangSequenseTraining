

namespace LangSequenceTraining.Services.Telegram
{
    internal interface ITelegramBot
    {
        event EventHandler<TelegramMessageEventArgs> ReceiveMessage;

        Task SendMessage(long channelId, string msg);
    }
}
