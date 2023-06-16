
using LangSequenceTraining.Services.Gpt;
using Microsoft.Extensions.Configuration;
using OpenAI_API;
using OpenAI_API.Chat;

namespace LangSequenceTraining.Services
{
    internal class GptCheckService : IGptCheckService
    {
        private readonly OpenAIAPI _api;
        private readonly IConfiguration _config;
        private Conversation _conversation;

        public GptCheckService(IConfiguration config)
        {
            var apiKey = config["GPT_API_key"];
            _api = new OpenAIAPI(apiKey);
            _config = config;
            //Task.Run(async () => { await Init(); });
        }

        private async Task Init()
        {
            var firstPhrase = _config["firstPhrase"];
            _conversation = _api.Chat.CreateConversation();
            _conversation.AppendMessage(new ChatMessage(ChatMessageRole.System, firstPhrase));
            var ans = await _conversation.GetResponseFromChatbotAsync();
        }

        public async Task<CheckResult> Check(string msg)
        {
            if (_conversation == null)
            {
                await Init();
            }

            _conversation.AppendMessage(new ChatMessage(ChatMessageRole.Assistant, msg));

            // todo сделать таймаут
            var ans = await _conversation.GetResponseFromChatbotAsync();
            var res = new CheckResult();
            if (ans.ToLower().Contains("ok_ok"))
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
