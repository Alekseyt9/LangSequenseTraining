﻿
using LangSequenceTraining.Helpers;
using Microsoft.Extensions.Configuration;
using Telegram.Bot;
using Telegram.Bot.Polling;
using Telegram.Bot.Types;
using Telegram.Bot.Types.Enums;

namespace LangSequenceTraining.Services.Telegram
{
    internal class TelegramBot : ITelegramBot
    {
        TelegramBotClient _botClient;

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

            if (ReceiveMessage != null)
            {
                ReceiveMessage(this, new TelegramMessageEventArgs()
                {
                    ChannelId = chatId,
                    Message = messageText
                });
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

    }
}