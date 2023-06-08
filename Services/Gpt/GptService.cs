
using Microsoft.Extensions.Configuration;
using OpenAI_API;

namespace LangSequenceTraining.Services.Gpt
{
    internal class GptService : IGptService
    {
        private OpenAIAPI _api;

        public GptService(IConfiguration config)
        {
            var apiKey = config["GPT_API_key"];
            _api = new OpenAIAPI(apiKey);
        }

    }
}
