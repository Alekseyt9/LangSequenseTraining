
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Xunit;

namespace LangSequenceTraining.Tests
{
    public class FlowTest
    {
        private readonly IConfiguration _configuration;
        private readonly TelegramBotMock _telegramBot;
        private readonly ProcessorManager _procMan;

        public FlowTest()
        {
            var builder = new ConfigurationBuilder().AddJsonFile(@"appsettings.json");
            _configuration = builder.Build();

            var connectString = _configuration["DbConnection"];
            var dbOption = new DbContextOptionsBuilder<AppDbContext>().UseNpgsql(connectString).Options;
            var dbContext = new AppDbContext(dbOption);
            var repository = new AppRepository(dbContext);
            var repositoryA = new AppRepositoryA(_configuration);

            var processorProvider = new ProcessorProvider();
            var stateManager = new UserStateManagerMock();
            var gptService = new GptCheckService(_configuration);
            _telegramBot = new TelegramBotMock();
            var textToSpeech = new TextToSpeech(_configuration);
            var learningService = new LearningService(repository, repositoryA);

            _procMan = new ProcessorManager(processorProvider, stateManager, gptService, 
                _telegramBot, repository, textToSpeech, stateManager, learningService);
            _telegramBot.ReceiveMessage += async (sender, args) =>
            {
                _procMan.Process(Guid.Empty, args.ChannelId, args.Message);
            };
        }

        [Fact]
        public void Test()
        {
            _telegramBot.UserMessageTest("/start", "testUser1");
            var msg = _telegramBot.GetLastBotMsg();

            _telegramBot.UserMessageTest("/tr 1", "testUser1");
            msg = _telegramBot.GetLastBotMsg();
        }

    }
}
