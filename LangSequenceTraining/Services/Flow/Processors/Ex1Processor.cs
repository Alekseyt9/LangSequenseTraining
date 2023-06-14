

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
        */

        public async Task Process(ProcessorContext ctx, TransitionMessageBase trMsg)
        {
            var state = (Ex1ProcessorState)ctx.State.CurProcState;
            var tr = (ExtTransitionMessage)trMsg;

            if (state == null)
            {
                state = new Ex1ProcessorState(ExStateKind.Start, tr.Sequence);
                ctx.State.CurProcState = state;
            }

            // todo commandParser
            if (ctx.State.Message != null && (ctx.State.Message.StartsWith("/r") || ctx.State.Message.StartsWith("/tr")))
            {
                ctx.State.CurProcState = null;
                ctx.State.Message = null;
                await ctx.DoTransition("main", new MainTransitionMessage()
                {
                    IsReset = true
                });

                return;
            }

            if (ctx.State.Message != null && (ctx.State.Message.StartsWith("/")))
            {
                await ctx.SendMessage($"Команда {ctx.State.Message} не найдена");
                return;
            }

            if (state.StateKind == ExStateKind.Start)
            {
                var msg = $"Начало упражнения с паттерном '{tr.Sequence.Text}'. Напишите предложение, используя этот паттерн.";
                await ctx.SendMessage(msg);
                await ctx.SendMessage(tr.Sequence.Description);

                state.StateKind = ExStateKind.Check;
                ctx.State.CurProcState = state;
                ctx.End();
                return;
            }

            if (state.StateKind == ExStateKind.Check)
            {
                var msg = ctx.State.Message;
                var checkResult = await ctx.Services.GptCheckService.Check(msg);
                if (checkResult.IsCorrect)
                {
                    await ctx.SendMessage("Предложение написано верно!");
                    var sound = await ctx.Services.TextToSpeech.SynthesizeSpeech(msg);
                    await ctx.SendMessage("Озвучка предложения", new FileData()
                    {
                        Name = "speech.mp4",
                        Stream = sound
                    });
                }
                else
                {
                    await ctx.SendMessage($"Предложение написано c ошибками. {checkResult.Message}");
                }

                ctx.State.CurProcState = null;
                await ctx.DoTransition("main", new MainTransitionMessage()
                {
                    ExName = "ex1",
                    Sequence = state.Sequence,
                    CheckResult = checkResult.IsCorrect
                });

            }

        }

    }
}
