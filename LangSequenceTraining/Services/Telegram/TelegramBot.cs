
using LangSequenceTraining.Helpers;
using LangSequenceTraining.Model;
using Microsoft.Extensions.Configuration;
using Telegram.Bot;
using Telegram.Bot.Polling;
using Telegram.Bot.Types;
using Telegram.Bot.Types.Enums;
using Telegram.Bot.Types.ReplyMarkups;

namespace LangSequenceTraining.Services
{
    internal class TelegramBot : ITelegramBot
    {
        private readonly TelegramBotClient _botClient;

        public event ITelegramBot.AsyncEventHandler? ReceiveAnswer;

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

        private async Task HandleUpdateAsync(ITelegramBotClient botClient, Update update, CancellationToken cancellationToken)
        {
            if (update.Message != null && !string.IsNullOrEmpty(update.Message.Text))
            {
                var msg = update.Message.Text;
                var chatId = update.Message.Chat.Id;
                var userId = update.Message.From.Username;
                if (ReceiveAnswer != null)
                {
                    await ReceiveAnswer(this, new TelegramAnswerEventArgs()
                    {
                        ChannelId = chatId,
                        Message = msg,
                        UserName = userId,
                    });
                }
            }

            if (update.CallbackQuery != null)
            {
                if (ReceiveAnswer != null)
                {
                    await ReceiveAnswer(this, new TelegramAnswerEventArgs()
                    {
                        ChannelId = update.CallbackQuery.Message.Chat.Id,
                        Message = update.CallbackQuery?.Data,
                        UserName = update.CallbackQuery.From.Username,
                    });
                }
            }

        }

        public async Task SendMessage(long channelId, string msg)
        {
            using var cts = new CancellationTokenSource();
            var msgArr = msg.SplitString(4096);

            foreach (var m in msgArr)
            {
                var sentMessage = await _botClient.SendTextMessageAsync(
                    channelId, m, cancellationToken: cts.Token,
                    parseMode: ParseMode.Html, disableWebPagePreview: true);
            }
        }

        public async Task SendMessage(long channelId, string msg, FileData file)
        {
            using var cts = new CancellationTokenSource();
            InputFile iof = InputFile.FromStream(file.Stream, file.Name);
            var result = await _botClient.SendDocumentAsync(channelId, iof, caption: msg, cancellationToken: cts.Token);
            file.Stream.Close();
        }

        public async Task SendMessage(long channelId, string msg, ButtonInfo[] buttons)
        {
            var rkm = new InlineKeyboardMarkup(buttons.Select(x => new InlineKeyboardButton(x.Text)
            {
                CallbackData = x.Tag
            }));
            var sentMessage = await _botClient.SendTextMessageAsync(
                channelId, msg, 
                parseMode: ParseMode.Html, disableWebPagePreview: true, replyMarkup: rkm);
        }

    }
}
