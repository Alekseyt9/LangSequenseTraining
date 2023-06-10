

namespace LangSequenceTraining.Services
{
    [Processor("ex1")]
    internal class Ex1Processor : IProcessor
    {
        /*
        public void Start(ProcessorContext ctx)
        {
            ctx.Send(
@"Упражнение 'Предложение' на тему 'Образование'.
Фраза (1 из 5): i am going to 
Составьте предложение с данной фразой (1 из 3). 
Для подробного описания упражнения введите /help.");
        }

        public async Task ReceiveMessage(ProcessorContext ctx, string msg)
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

        public void Process(ProcessorContext ctx, ProcessorStateBase procState, TransitionMessageBase trMsg)
        {
            throw new NotImplementedException();
        }

    }
}
