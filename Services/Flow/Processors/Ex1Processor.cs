
using LangSequenceTraining.Services;

namespace LangSequenceTraining.Services
{
    [Processor("ex1")]
    internal class Ex1Processor : IProcessorT<Ex1ProcessorState>
    {
        /*
        public void Start(Context ctx)
        {
            ctx.Send(
@"Упражнение 'Предложение' на тему 'Образование'.
Фраза (1 из 5): i am going to 
Составьте предложение с данной фразой (1 из 3). 
Для подробного описания упражнения введите /help.");
        }

        public async Task ReceiveMessage(Context ctx, string msg)
        {
            try
            {
                var result = await ctx.Api.Completions.CreateCompletionAsync(
                    $"Проверь правильность предложения: \"{msg}\". Если верно - напиши 'y'. Если нет - напиши почему.",
                    max_tokens: 500);
                ctx.Send(result.Completions.First().Text);
            }
            catch (Exception ex)
            {
                ctx.Send($"Ошибка: {ex.Message}");
            }
        }
        */

        public void Process(Ex1ProcessorState state, string msg)
        {
            throw new NotImplementedException();
        }

        public void Process(object state, string msg)
        {
            Process((Ex1ProcessorState)state, msg);
        }

    }
}
