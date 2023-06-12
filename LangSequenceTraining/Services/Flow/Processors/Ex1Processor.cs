

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
                state = new Ex1ProcessorState()
                {
                    StateKind = ExStateKind.Start
                };
            }

            if (state.StateKind == ExStateKind.Start)
            {
                var msg = $"Начало упражнения с паттерном '{tr.Sequence.Text}'. Напишите предложение, используя этот паттерн.";
                ctx.SendMessage(msg);
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
                    ctx.SendMessage("Предложение написано верно!");
                    var sound = await ctx.Services.TextToSpeech.SynthesizeSpeech(msg);
                    ctx.SendMessage("Озвучка предложения", new FileData()
                    {
                        Name = "speech.mp4",
                        Stream = sound
                    });
                }
                else
                {
                    ctx.SendMessage($"Предложение написано c ошибками. {checkResult.Message}");
                }

                ctx.State.CurProcState = null;
                await ctx.DoTransition("main", new MainTransitionMessage()
                {
                    ExName = "ex1",
                    CheckResult = checkResult.IsCorrect
                });

            }

        }

    }
}
