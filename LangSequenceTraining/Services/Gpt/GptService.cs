
using Microsoft.Extensions.Configuration;
using OpenAI_API;
using OpenAI_API.Chat;

namespace LangSequenceTraining.Services
{
    internal class GptService : IGptService
    {
        private OpenAIAPI _api;
        private IConfiguration _config;

        public GptService(IConfiguration config)
        {
            var apiKey = config["GPT_API_key"];
            _api = new OpenAIAPI(apiKey);
            _config = config;
        }

        public async Task Init()
        {
            var firstPhrase = _config["firstPhrase"];
            var conv = _api.Chat.CreateConversation();
            conv.AppendMessage(new ChatMessage(ChatMessageRole.Assistant, firstPhrase));
            var ans = await conv.GetResponseFromChatbotAsync();
        }

    }
}
