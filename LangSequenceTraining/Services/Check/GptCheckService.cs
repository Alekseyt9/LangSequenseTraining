
using LangSequenceTraining.Services.Gpt;
using Microsoft.Extensions.Configuration;
using OpenAI_API;
using OpenAI_API.Chat;

namespace LangSequenceTraining.Services
{
    internal class GptCheckService : ICheckService
    {
        private readonly OpenAIAPI _api;
        private readonly IConfiguration _config;
        private Conversation _conversation;

        public GptCheckService(IConfiguration config)
        {
            var apiKey = config["GPT_API_key"];
            _api = new OpenAIAPI(apiKey)
            {
                HttpClientFactory = new HttpClientFactory()
            };
            _config = config;
        }

        private async Task Init()
        {
            var firstPhrase = _config["firstPhrase"];
            _conversation = _api.Chat.CreateConversation();
            _conversation.AppendMessage(new ChatMessage(ChatMessageRole.System, firstPhrase));
            //_conversation.AppendMessage(new ChatMessage(ChatMessageRole.Assistant, firstPhrase));
            var ans = await _conversation.GetResponseFromChatbotAsync();
        }

        public async Task<CheckResult> Check(string msg, bool reset)
        {
            if (_conversation == null || reset)
            {
                await Init();
            }

            _conversation.AppendMessage(new ChatMessage(ChatMessageRole.User, "проверь: " +msg));

            var ans = await _conversation.GetResponseFromChatbotAsync();
            var res = new CheckResult();
            if (CheckAnswerCorrect(ans))
            {
                res.IsCorrect = true;
                return res;
            }

            res.IsCorrect = false;
            res.Message = ans;
            return res;
        }

        private bool CheckAnswerCorrect(string msg)
        {
            msg = msg.ToLower().TrimEnd('.');

            if (msg.Contains("ok_ok"))
            {
                return true;
            }

            if (msg.EndsWith("ок"))
            {
                return true;
            }

            if (msg.Contains("ошибок нет"))
            {
                return true;
            }

            return false;
        }

    }
}
