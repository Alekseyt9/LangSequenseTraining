

namespace LangSequenceTraining.Services
{
    internal interface ITelegramBot
    {
        public delegate Task AsyncEventHandler(object sender, TelegramAnswerEventArgs e);

        event AsyncEventHandler? ReceiveAnswer;

        Task SendMessage(long channelId, string msg);

        Task SendMessage(long channelId, string msg, FileData file);

        Task SendMessage(long channelId, string msg, ButtonInfo[] buttons);

    }
}
