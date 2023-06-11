
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Services;
using LangSequenceTraining.Tests.Mock;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Xunit;

namespace LangSequenceTraining.Tests.Tests
{
    public class FlowTest
    {
        private IConfiguration _configuration;

        public FlowTest()
        {
            var builder = new ConfigurationBuilder()
                .AddJsonFile(@"appsettings.json");
            _configuration = builder.Build();
        }

        [Fact]
        public void Test()
        {
            var connectString = _configuration["DbConnection"];
            var dbOption = new DbContextOptionsBuilder<AppDbContext>().UseNpgsql(connectString).Options;
            var dbContext = new AppDbContext(dbOption);
            var repository = new AppRepository(dbContext);

            var processorProvider = new ProcessorProvider();
            var stateManager = new UserStateManagerMock();
            var gptService = new GptCheckService(_configuration);
            var telegramBot = new TelegramBotMock();
            var textToSpeech = new TextToSpeech(_configuration);

            var procMan = new ProcessorManager(
                processorProvider, stateManager, gptService, telegramBot, repository, textToSpeech, stateManager);

            telegramBot.ReceiveMessage += async (sender, args) =>
            {
                procMan.Process(Guid.Empty, args.ChannelId, args.Message);
            };

            telegramBot.UserMessageTest("/start");
            var msg = telegramBot.GetLastBotMsg();

            telegramBot.UserMessageTest("/tr 1");
            msg = telegramBot.GetLastBotMsg();
        }

    }
}
