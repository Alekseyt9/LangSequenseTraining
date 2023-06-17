

namespace LangSequenceTraining.Services
{
    [Processor("ex1")]
    internal class Ex1Processor : IProcessor
    {

        public async Task Process(ProcessorContext ctx, TransitionMessageBase trMsg)
        {
            var state = (Ex1ProcessorState)ctx.State.CurProcState;
            var tr = (ExtTransitionMessage)trMsg;

            // todo commandParser
            var needReset = false;
            if (ctx.State.Message != null
                && (ctx.State.Message.StartsWith("/r") || ctx.State.Message.StartsWith("/tr")))
            {
                needReset = true;
            }
            /*if (tr == null)
            {
                needReset = true;
            }*/
            if (needReset)
            {
                ctx.State.CurProcState = null;
                ctx.State.Message = null;
                await ctx.DoTransition("main", new MainTransitionMessage()
                {
                    IsReset = true
                });

                return;
            }

            if (state == null)
            {
                state = new Ex1ProcessorState(ExStateKind.Start, tr.Sequence);
                ctx.State.CurProcState = state;
            }

            if (ctx.State.Message != null && (ctx.State.Message.StartsWith("/")))
            {
                await ctx.SendMessage($"Команда {ctx.State.Message} не найдена");
                return;
            }

            if (state.StateKind == ExStateKind.Start)
            {
                await ctx.SendMessage(tr.Sequence.Description);
                var msg = $"Начало упражнения с паттерном '{tr.Sequence.Text}'. Напишите предложение, используя этот паттерн. Чтобы выйти из упражнений без сохранения результата, введите команду /r";
                await ctx.SendMessage(msg);

                state.StateKind = ExStateKind.Check;
                ctx.State.CurProcState = state;
                ctx.End();
                return;
            }

            if (state.StateKind == ExStateKind.Check)
            {
                ctx.SendMessage("Предложение принято для проверки. Проверка может занимать некоторое время, возможно больше 5 секунд.");

                var i = 0;
                while (!await Check(ctx, state) || i > 4)
                {
                    i++;
                }

                if (i > 4)
                {
                    ctx.SendMessage("Не удалось выполнить проверку, сервис недоступен. Попробуйте позже.");
                }
            }
        }

        private async Task<bool> Check(ProcessorContext ctx, Ex1ProcessorState state)
        {
            try
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
                return true;
            }
            catch (Exception ex)
            {
                ctx.SendMessage($"Ощибка {ex.Message}. Повторяем попытку.");
                return false;
            }
        }

    }
}
