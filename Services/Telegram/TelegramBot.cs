
using LangSequenceTraining.Helpers;
using Microsoft.Extensions.Configuration;
using System.IO;
using Telegram.Bot;
using Telegram.Bot.Polling;
using Telegram.Bot.Types;
using Telegram.Bot.Types.Enums;

namespace LangSequenceTraining.Services
{
    internal class TelegramBot : ITelegramBot
    {
        private readonly TelegramBotClient _botClient;

        public event EventHandler<TelegramMessageEventArgs>? ReceiveMessage;

        public TelegramBot(IConfiguration config)
        {
            var token = config["Telegram_bot_key"];
            _botClient = new TelegramBotClient(token);
            using var cts = new CancellationTokenSource();

            var receiverOptions = new ReceiverOptions
            {
                AllowedUpdates = Array.Empty<UpdateType>()
            };
            _botClient.StartReceiving(
                HandleUpdateAsync,
                HandlePollingErrorAsync,
                receiverOptions,
                cts.Token
            );
        }

        private Task HandlePollingErrorAsync(ITelegramBotClient arg1, Exception arg2, CancellationToken arg3)
        {
            return Task.CompletedTask;
        }

        async Task HandleUpdateAsync(ITelegramBotClient botClient, Update update, CancellationToken cancellationToken)
        {
            if (update.Message is not { } message)
            {
                return;
            }

            if (message.Text is not { } messageText)
            {
                return;
            }

            var chatId = message.Chat.Id;
            var userId = message.From.Username;

            if (ReceiveMessage != null)
            {
                ReceiveMessage(this, new TelegramMessageEventArgs()
                {
                    ChannelId = chatId,
                    Message = messageText,
                    UserId = userId
                });
            }
        }

        public async Task SendMessage(long channelId, string msg, FileData file = null)
        {
            using var cts = new CancellationTokenSource();

            if (file != null)
            {
                InputFile iof = InputFile.FromStream(file.Stream, file.Name);
                var result = await _botClient.SendDocumentAsync(channelId, iof, caption: msg);
                file.Stream.Close();
            }
            else
            {
                var msgArr = msg.SplitString(4096);
                foreach (var m in msgArr)
                {
                    var sentMessage = await _botClient.SendTextMessageAsync(
                        channelId, m, cancellationToken: cts.Token,
                        parseMode: ParseMode.Html, disableWebPagePreview: true);
                }
            }
        }

    }
}
