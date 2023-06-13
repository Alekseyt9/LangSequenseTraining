
using LangSequenceTraining.Services;
using Microsoft.Extensions.Configuration;
using Xunit;

namespace LangSequenceTraining.Tests
{
    public class GptCheckServiceTest
    {
        private readonly IConfiguration _configuration;

        public GptCheckServiceTest()
        {
            var builder = new ConfigurationBuilder().AddJsonFile(@"appsettings.json");
            _configuration = builder.Build();
        }

        [Fact]
        public async Task Test()
        {
            var serv = new GptCheckService(_configuration);

            var res1 = await serv.Check("I have a lot of money");
            var res2 = await serv.Check("I has a lot of money");

            Assert.True(res1.IsCorrect);
            Assert.False(res2.IsCorrect);
            Assert.True(!string.IsNullOrEmpty(res2.Message));
        }

    }
}
