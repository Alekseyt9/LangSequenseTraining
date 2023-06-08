
using GptApiTest.Services.Flow.Common;
using GptApiTest.Services.Flow.Processors;
using LangSequenceTraining.DAL;
using LangSequenceTraining.Services.Telegram;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace GptApiTest.Env
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            using var host = CreateHostBuilder(args).Build();

            if (Environment.UserInteractive)
            {
                await StartInCons(host);
            }

            await host.RunAsync();
        }

        static async Task StartInCons(IHost host)
        {
            //var taskManager = host.Services.GetRequiredService<INotificationTaskManager>();
            //await taskManager.Start();

            var bot = host.Services.GetRequiredService<ITelegramBot>();
            bot.ReceiveMessage += async (sender, args) =>
            {
                /*
                var factory = host.Services.GetRequiredService<ITelegramCommandFactory>();
                var parser = host.Services.GetRequiredService<ITelegramCommandParser>();
                var cmdInfo = parser.Parse(args.Message);
                if (cmdInfo == null)
                {
                    return;
                }

                var cmd = (TelegramCommandBase)factory.Create(cmdInfo);
                cmd.Context = new TelegramBotContext()
                {
                    TelegramChannelId = args.ChannelId
                };
                var mediator = host.Services.GetRequiredService<IMediator>();
                await mediator.Send(cmd);
                */
            };
        }

        static IHostBuilder CreateHostBuilder(string[] args)
        {
            Directory.SetCurrentDirectory(AppDomain.CurrentDomain.BaseDirectory);

            var builder = new ConfigurationBuilder()
                .AddJsonFile($"appsettings.json", false, true);

            var configuration = builder.Build();

            return Host.CreateDefaultBuilder(args)
                .UseWindowsService(options => { options.ServiceName = "LangSequenceTraining_Service"; })
                .ConfigureServices((_, services) =>
                {
                    services
                        .AddSingleton<IConfiguration>(configuration)
                        .RegisterPersistence(configuration);

                    if (!Environment.UserInteractive)
                    {
                        //services.AddHostedService<Worker>();
                    }

                });
        }

        private async Task OpenAPI()
        {
            var apiKey = "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";
            var api = new OpenAI_API.OpenAIAPI(apiKey);

            var ctx = new Context(api);
            var proc = new Ex1Processor();
            proc.Start(ctx);

            while (true)
            {
                var str = Console.ReadLine();
                await proc.ReceiveMessage(ctx, str);
            }
        }

    }
}