
using LangSequenceTraining.DAL;
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Services;
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
            var bot = host.Services.GetRequiredService<ITelegramBot>();
            bot.ReceiveMessage += async (sender, args) =>
            {
                var servScopeFactory = host.Services.GetRequiredService<IServiceScopeFactory>();
                using var scope = servScopeFactory.CreateScope();
                var procMan = scope.ServiceProvider.GetRequiredService<IProcessorManager>();
                var userName = args.UserId;
                var repository = scope.ServiceProvider.GetRequiredService<IAppRepository>();
                var user = repository.GetUser(userName);
                procMan.Process(user.Id, args.ChannelId, args.Message);
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
                        .AddSingleton<ITelegramBot, TelegramBot>()
                        .AddSingleton<ITextToSpeech, TextToSpeech>()
                        .AddSingleton<IGptService, GptService>()
                        .AddScoped<IProcessorManager, ProcessorManager>()
                        .AddScoped<IProcessorProvider, ProcessorProvider>()
                        .AddScoped<IUserStateManager, UserStateManager>()
                        .AddScoped<IAppRepository, AppRepository>()
                        .AddScoped<IProcessorManager, ProcessorManager>()
                        .AddScoped<ILearningService, LearningService>()
                        .RegisterPersistence(configuration)
                        .RegisterPersistenceA(configuration)
                        ;

                    if (!Environment.UserInteractive)
                    {
                        //services.AddHostedService<Worker>();
                    }
                });
        }

    }
}