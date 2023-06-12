
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Xunit;

namespace LangSequenceTraining.Tests
{
    public class FlowTest : IDisposable
    {
        private readonly IConfiguration _configuration;
        private readonly TelegramBotMock _telegramBot;
        private readonly ProcessorManager _procMan;
        private AppDbContext _dbContext;
        private AppRepository _repository;
        private AppRepositoryA _repositoryA;

        public FlowTest()
        {
            var builder = new ConfigurationBuilder().AddJsonFile(@"appsettings.json");
            _configuration = builder.Build();

            var connectString = _configuration["DbConnection"];
            var dbOption = new DbContextOptionsBuilder<AppDbContext>().UseNpgsql(connectString).Options;
            _dbContext = new AppDbContext(dbOption);
            _repository = new AppRepository(_dbContext);
            _repositoryA = new AppRepositoryA(_configuration);

            var processorProvider = new ProcessorProvider();
            var stateManager = new UserStateManagerMock();
            var gptService = new GptCheckService(_configuration);
            _telegramBot = new TelegramBotMock();
            var textToSpeech = new TextToSpeech(_configuration);
            var learningService = new LearningService(_repository, _repositoryA);

            _procMan = new ProcessorManager(processorProvider, stateManager, gptService, 
                _telegramBot, _repository, textToSpeech, stateManager, learningService);
            _telegramBot.ReceiveMessage += async (sender, args) =>
            {
                var user = _repository.GetUser(args.UserName);
                await _procMan.Process(user.Id, args.ChannelId, args.Message);
            };
        }

        [Fact]
        public void Test()
        {
            _telegramBot.UserMessageTest("/start", "testUser1");
            var msg = _telegramBot.GetLastBotMsg();

            _telegramBot.UserMessageTest("/tr 1", "testUser1");
            msg = _telegramBot.GetLastBotMsg();

            _telegramBot.UserMessageTest("Thank you for dinner", "testUser1");
            msg = _telegramBot.GetLastBotMsg();
        }

        public void Dispose()
        {
            var user = _repository.GetUser("testUser1");
            _dbContext.Remove(user);
            _dbContext.SaveChanges();

            _dbContext.Dispose();
        }

    }
}
