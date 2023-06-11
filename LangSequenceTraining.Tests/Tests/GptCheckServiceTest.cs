
using LangSequenceTraining.Services;
using Microsoft.Extensions.Configuration;
using Xunit;

namespace LangSequenceTrainingTests.Tests
{
    public class GptCheckServiceTest
    {
        private IConfiguration _configuration;

        public GptCheckServiceTest()
        {
            var builder = new ConfigurationBuilder()
                .AddJsonFile(@"appsettings.json");
            _configuration = builder.Build();
        }

        [Fact]
        public async Task Test()
        {
            var serv = new GptCheckService(_configuration);
            await serv.Init();

            var res1 = await serv.Check("I have money");
            var res2 = await serv.Check("I has money");

            Assert.True(res1.IsCorrect);
            Assert.False(res2.IsCorrect);
            Assert.True(!string.IsNullOrEmpty(res2.Message));
        }

    }
}
