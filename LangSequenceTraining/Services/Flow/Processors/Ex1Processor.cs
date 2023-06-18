

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
            var needReset = ctx.State.Message != null
                            && (ctx.State.Message.StartsWith("/r") || ctx.State.Message.StartsWith("/tr"));
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

            switch (state.StateKind)
            {
                case ExStateKind.Start:
                    await ctx.SendMessage(tr.Sequence.Description);
                    var msg = $"Начало упражнения с паттерном '{tr.Sequence.Text}'. Напишите предложение, используя этот паттерн. Чтобы выйти из упражнений без сохранения результата, введите команду /r";
                    await ctx.SendMessage(msg);

                    state.StateKind = ExStateKind.Check;
                    ctx.State.CurProcState = state;
                    ctx.End();
                    return;

                case ExStateKind.Check:
                    await CheckRepeat(ctx, state, ctx.State.Message, false);
                    ctx.State.CurProcState = state;
                    ctx.End();
                    return;

                case ExStateKind.UserChoice:
                    if (ctx.State.Message == "/user_check_ok")
                    {
                        if (state.IsCorrect.Value)
                        {
                            var sound = await ctx.Services.TextToSpeech.SynthesizeSpeech(state.UserMsg);
                            await ctx.SendMessage("Озвучка предложения", new FileData()
                            {
                                Name = "speech.mp4",
                                Stream = sound
                            });
                        }

                        ctx.State.CurProcState = null;
                        await ctx.DoTransition("main", new MainTransitionMessage()
                        {
                            ExName = "ex1",
                            Sequence = state.Sequence,
                            CheckResult = state.IsCorrect.Value
                        });
                    }
                    if (ctx.State.Message == "/user_check_rep")
                    {
                        await CheckRepeat(ctx, state, state.UserMsg, true);
                        ctx.State.CurProcState = state;
                        ctx.End();
                    }

                    return;
            }

            if (ctx.State.Message != null && (ctx.State.Message.StartsWith("/")))
            {
                await ctx.SendMessage($"Команда {ctx.State.Message} не найдена");
                return;
            }

        }

        private async Task CheckRepeat(ProcessorContext ctx, Ex1ProcessorState state, string msg, bool checkReset)
        {
            await ctx.SendMessage("Предложение принято для проверки. Проверка может занимать некоторое время, возможно больше 5 секунд.");
            var i = 0;
            while (!await Check(ctx, state, msg, checkReset))
            {
                if (i > 3)
                {
                    break;
                }
                i++;
            }
            if (i > 3)
            {
                await ctx.SendMessage("Не удалось выполнить проверку, сервис недоступен. Попробуйте позже.");
            }
        }

        private async Task<bool> Check(ProcessorContext ctx, Ex1ProcessorState state, string msg, bool checkReset)
        {
            try
            {
                var checkService = ctx.Services.CheckServiceProvider.Get(ctx.State.UserId);
                var checkResult = await checkService.Check(msg, checkReset);
                state.IsCorrect = checkResult.IsCorrect;
                state.UserMsg = msg;

                var buttons = new ButtonInfo[]
                {
                    new ButtonInfo("Далее", "/user_check_ok"),
                    new ButtonInfo("Перепроверить", "/user_check_rep")
                };
                if (checkResult.IsCorrect)
                {
                    await ctx.SendMessage("Предложение написано верно!", null, buttons);
                }
                else
                {
                    await ctx.SendMessage($"Предложение написано c ошибками. {checkResult.Message}", null, buttons);
                }
                state.StateKind = ExStateKind.UserChoice;

                return true;
            }
            catch (Exception ex)
            {
                await ctx.SendMessage($"Ощибка {ex.Message}. Повторяем попытку.");
                return false;
            }
        }

    }
}
