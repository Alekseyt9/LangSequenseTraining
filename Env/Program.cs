using GptApiTest.Code;

namespace GptApiTest.Env
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            var apiKey = "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";
            var api = new OpenAI_API.OpenAIAPI(apiKey);

            var ctx = new Context(api);
            var proc = new Ex1Processor();
            proc.Start(ctx);

            while (true)
            {
                var str = Console.ReadLine();
                await proc.ReceiveMessage(ctx, str);
            }

        }

    }
}