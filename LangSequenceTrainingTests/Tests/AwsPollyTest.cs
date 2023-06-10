
using LangSequenceTraining.Services;
using Microsoft.Extensions.Configuration;
using Xunit;

namespace LangSequenceTrainingTests.Tests
{
    public class AwsPollyTest
    {
        private IConfiguration _configuration;

        public AwsPollyTest()
        {
            // создание и инициализация _configuration
        }

        [Fact]
        public async Task Test()
        {
            var speechServ = new TextToSpeech(_configuration);
            var res = await speechServ.SynthesizeSpeech("test");
            Assert.True(res.Length > 0);
        }

    }
}
