
using LangSequenceTraining.Services;

namespace LangSequenceTraining.Tests
{
    internal class TelegramBotMock : ITelegramBot
    {
        private string _lastSendedMsg;
        private string _lastReceivedMsg;

        public event EventHandler<TelegramMessageEventArgs>? ReceiveMessage;

        public Task SendMessage(long channelId, string msg, FileData file = null)
        {
            _lastSendedMsg = msg;
            return Task.CompletedTask;
        }

        public void UserMessageTest(string msg, string userName)
        {
            _lastReceivedMsg = msg;
            ReceiveMessage?.Invoke(this, new TelegramMessageEventArgs()
            {
                Message = msg,
                UserName = userName
            });
        }

        public string GetLastBotMsg()
        {
            return _lastSendedMsg;
        }

        public string GetLastUserMsg()
        {
            return _lastReceivedMsg;
        }

    }
}
