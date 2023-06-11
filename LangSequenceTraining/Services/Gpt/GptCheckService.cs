
using LangSequenceTraining.Services.Gpt;
using Microsoft.Extensions.Configuration;
using OpenAI_API;
using OpenAI_API.Chat;

namespace LangSequenceTraining.Services
{
    internal class GptCheckService : IGptCheckService
    {
        private OpenAIAPI _api;
        private IConfiguration _config;
        private Conversation _conversation;

        public GptCheckService(IConfiguration config)
        {
            var apiKey = config["GPT_API_key"];
            _api = new OpenAIAPI(apiKey);
            _config = config;
        }

        public async Task Init()
        {
            var firstPhrase = _config["firstPhrase"];
            _conversation = _api.Chat.CreateConversation();
            _conversation.AppendMessage(new ChatMessage(ChatMessageRole.Assistant, firstPhrase));
            var ans = await _conversation.GetResponseFromChatbotAsync();
        }

        public async Task<CheckResult> Check(string msg)
        {
            _conversation.AppendMessage(new ChatMessage(ChatMessageRole.Assistant, msg));
            var ans = await _conversation.GetResponseFromChatbotAsync();
            var res = new CheckResult();
            if (ans.ToLower().StartsWith("ok"))
            {
                res.IsCorrect = true;
                return res;
            }

            res.IsCorrect = false;
            res.Message = ans;
            return res;
        }

    }
}
