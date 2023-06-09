
using OpenAI_API;

namespace LangSequenceTraining.Services
{
    internal class Context
    {
        private IOpenAIAPI _api { get; }

        public IOpenAIAPI Api => _api;

        public Context(IOpenAIAPI api)
        {
            _api = api;
        }

        public void Send(string msg)
        {
            Console.WriteLine(msg);
        }

    }
}
