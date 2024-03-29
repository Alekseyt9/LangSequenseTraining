﻿
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Model.Services;
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
        private readonly IProcessorManager _procMan;
        private readonly AppDbContext _dbContext;
        private readonly IAppRepository _repository;
        private readonly IAppRepositoryA _repositoryA;
        private readonly IUserRepository _userRepository;
        private readonly IUserProvider _userProvider;

        public FlowTest()
        {
            var builder = new ConfigurationBuilder().AddJsonFile(@"appsettings.json");
            _configuration = builder.Build();

            var connectString = _configuration["DbConnection"];
            var dbOption = new DbContextOptionsBuilder<AppDbContext>().UseNpgsql(connectString).Options;
            _dbContext = new AppDbContext(dbOption);
            _repository = new AppRepository(_dbContext);
            _repositoryA = new AppRepositoryA(_configuration);
            _userRepository = new UserRepository(_dbContext);
            _userProvider = new UserProvider(_userRepository);

            var processorProvider = new ProcessorProvider();
            var stateManager = new UserStateProviderMock();
            var checkServiceProvider = new CheckServiceProvider(_configuration);
            _telegramBot = new TelegramBotMock();
            var textToSpeech = new TextToSpeech(_configuration);
            var seqProv = new SequenceProvider(_repository);
            var learningService = new LearningService(_repository, _repositoryA, _userProvider, seqProv);
            var sequenceProvider = new SequenceProvider(_repository);

            _procMan = new ProcessorManager(processorProvider, stateManager, checkServiceProvider, 
                _telegramBot, _repository, _repositoryA, textToSpeech, stateManager, learningService, sequenceProvider);
            _telegramBot.ReceiveAnswer += async (s, args) =>
            {
                var user = _userProvider.GetUser(args.UserName);
                await _procMan.Process(user.Id, args.ChannelId, args.Message);
            };

        }

        [Fact]
        public async Task Test()
        {
            await _telegramBot.UserMessageTest("/start", "testUser1");
            var msg = _telegramBot.GetLastBotMsg();

            await _telegramBot.UserMessageTest("/tr 1", "testUser1");
            msg = _telegramBot.GetLastBotMsg();

            await _telegramBot.UserMessageTest("Thank you for dinner", "testUser1");
            msg = _telegramBot.GetLastBotMsg();
        }

        public void Dispose()
        {
            var user = _userRepository.GetUser("testUser1");
            _dbContext.Remove(user);
            _dbContext.SaveChanges();

            _dbContext.Dispose();
        }

    }
}
