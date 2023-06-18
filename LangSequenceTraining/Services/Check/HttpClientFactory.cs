

namespace LangSequenceTraining.Services.Gpt
{
    internal class HttpClientFactory : IHttpClientFactory
    {
        public HttpClient CreateClient(string name)
        {
            return new HttpClient() {Timeout = TimeSpan.FromSeconds(10)};
        }
    }
}
