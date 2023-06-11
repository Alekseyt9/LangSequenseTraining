
using LangSequenceTraining.Services;
using Microsoft.Extensions.Configuration;
using Xunit;

namespace LangSequenceTraining.Tests
{
    public class TextToSpeechTest
    {
        private readonly IConfiguration _configuration;

        public TextToSpeechTest()
        {
            var builder = new ConfigurationBuilder()
                .AddJsonFile(@"appsettings.json");
            _configuration = builder.Build();
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
