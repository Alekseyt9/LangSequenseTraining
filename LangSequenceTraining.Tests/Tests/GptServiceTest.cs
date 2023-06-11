
using LangSequenceTraining.Services;
using Microsoft.Extensions.Configuration;
using Xunit;

namespace LangSequenceTrainingTests.Tests
{
    public class GptServiceTest
    {
        private IConfiguration _configuration;

        public GptServiceTest()
        {
            var builder = new ConfigurationBuilder()
                .AddJsonFile(@"appsettings.json");
            _configuration = builder.Build();
        }

        [Fact]
        public async Task Test()
        {
            var serv = new GptService(_configuration);
            await serv.Init();
        }

    }
}
