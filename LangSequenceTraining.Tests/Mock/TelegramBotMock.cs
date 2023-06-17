
using LangSequenceTraining.Services;

namespace LangSequenceTraining.Tests
{
    internal class TelegramBotMock : ITelegramBot
    {
        private string _lastSendedMsg;
        private string _lastReceivedMsg;

        public event ITelegramBot.AsyncEventHandler? ReceiveAnswer;

        public Task SendMessage(long channelId, string msg)
        {
            throw new NotImplementedException();
        }

        public Task SendMessage(long channelId, string msg, FileData file)
        {
            _lastSendedMsg = msg;
            return Task.CompletedTask;
        }

        public Task SendMessage(long channelId, string msg, ButtonInfo[] buttons)
        {
            throw new NotImplementedException();
        }

        public async Task UserMessageTest(string msg, string userName)
        {
            _lastReceivedMsg = msg;
            if (ReceiveAnswer != null)
            {
                await ReceiveAnswer(this, new TelegramAnswerEventArgs()
                {
                    Message = msg,
                    UserName = userName
                });
            }
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
