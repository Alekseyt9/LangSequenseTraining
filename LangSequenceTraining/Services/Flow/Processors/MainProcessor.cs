
using System.Text;
using LangSequenceTraining.Helpers;
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    [Processor("main")]
    internal class MainProcessor : IProcessor
    {
        public async Task Process(ProcessorContext ctx, TransitionMessageBase trMsg)
        {
            var state = (MainProcessorState)ctx.State.CurProcState;
            if (state == null)
            {
                state = new MainProcessorState()
                {
                    ExStatesHistoryItems = new List<MainExHistoryItem>(),
                    StateKind = MainStateKind.Start
                };
                ctx.State.CurProcState = state;
            }

            var tr = (MainTransitionMessage)trMsg;
            if (tr != null && tr.IsReset)
            {
                state.StateKind = MainStateKind.Start;
                state.CurSequences = null;
                state.ExStatesHistoryItems = new List<MainExHistoryItem>();
            }

            if (state.StateKind == MainStateKind.Start)
            {
                if (ctx.State.Message == null || ctx.State.Message.StartsWith("/start"))
                {
                    var msg = CreateStartMessage(ctx);
                    await ctx.SendMessage(msg);
                    ctx.State.Message = null;
                    return;
                }

                if (ctx.State.Message.StartsWith("/tr"))
                {
                    await ProcessStartTr(ctx);
                    ctx.State.Message = null;
                    return;
                }

                if (ctx.State.Message.StartsWith("/grinfo"))
                {
                    await ProcessGrInfo(ctx);
                    ctx.State.Message = null;
                    return;
                }

            }

            if (state.StateKind == MainStateKind.InExercise)
            {
                var hist = state.ExStatesHistoryItems;

                if (tr == null)
                {
                    await ctx.SendMessage("Неверное состояние сессии");
                    state.StateKind = MainStateKind.Start;
                    await ctx.DoTransition("main", null);
                    return;
                }

                hist.Add(new MainExHistoryItem()
                {
                    ExName = tr.ExName,
                    IsCorrect = tr.CheckResult,
                    Sequence = tr.Sequence
                });

                var seqs = state.CurSequences;
                var nextCh = ExChoiceHelper.GetNextEx(hist, seqs, new List<string>() { "ex1" });
                if (nextCh.IsFinish)
                {
                    await SendExResult(ctx, hist);

                    ExtResultHelper.SaveExResult(ctx.Services.LearningService, ctx.State.UserId, hist);

                    state.StateKind = MainStateKind.Start;
                    state.CurSequences = null;
                    state.ExStatesHistoryItems = new List<MainExHistoryItem>();
                    await ctx.DoTransition("main", null);
                }
                else
                {
                    await ctx.DoTransition(nextCh.ExName, new ExtTransitionMessage()
                    {
                        Sequence = nextCh.Sequence
                    });
                }
            }

        }

        private async Task SendExResult(ProcessorContext ctx, List<MainExHistoryItem> hist)
        {
            var sb = new StringBuilder();
            sb.AppendLine("Результат");

            var errMap = new Dictionary<Guid, int>();
            var seqMap = new Dictionary<Guid, Sequence>();
            foreach (var state in hist)
            {
                errMap.TryAdd(state.Sequence.Id, 0);
                if (!state.IsCorrect)
                {
                    errMap[state.Sequence.Id]++;
                }

                seqMap.TryAdd(state.Sequence.Id, state.Sequence);
            }

            foreach (var pair in errMap)
            {
                var errStr = pair.Value > 0 ? $"{pair.Value} ошибки" : "верно";
                sb.AppendLine($"   {seqMap[pair.Key].Text}: {errStr}");
            }

            await ctx.SendMessage(sb.ToString());
        }

        private async Task ProcessGrInfo(ProcessorContext ctx)
        {
            var groups = ctx.Services.Repository.GetGroups();
            var i = 1;

            foreach (var group in groups)
            {
                await ctx.SendMessage($"[{i++}] {group.Name} ({group.Description})");
                var seqs = ctx.Services.Repository.GetSequences(group.Name);
                var j = 1;

                foreach (var seq in seqs)
                {
                    await ctx.SendMessage($"\t {seq.Text}");
                }
            }
        }

        private async Task ProcessStartTr(ProcessorContext ctx)
        {
            var grNum = GetParam<int>(ctx.State.Message);
            ctx.State.Message = null;

            var gr = await GetGroupByNum(ctx, grNum - 1);
            if (gr == null)
            {
                return;
            }

            var state = (MainProcessorState)ctx.State.CurProcState;
            state.CurSequences = new List<Sequence>(GetSequencesForTrNew(ctx, gr));
            state.ExStatesHistoryItems = new List<MainExHistoryItem>();

            var nextCh = ExChoiceHelper.GetNextEx(state.ExStatesHistoryItems, state.CurSequences, new List<string>() { "ex1" });
            state.StateKind = MainStateKind.InExercise;

            await ctx.DoTransition(nextCh.ExName, new ExtTransitionMessage()
            {
                Sequence = nextCh.Sequence
            });
        }

        private IEnumerable<Sequence> GetSequencesForTrNew(ProcessorContext ctx, SequenceGroup gr)
        {
            return ctx.Services.LearningService.GetSequencesNew(ctx.State.UserId, gr.Id);
        }

        private async Task<SequenceGroup> GetGroupByNum(ProcessorContext ctx, int num)
        {
            var groups = ctx.Services.Repository.GetGroups()
                .Where(x => !x.IsHide).OrderBy(x => x.Order).ToList();
            if (num > groups.Count - 1)
            {
                await ctx.SendMessage($"Ошибка: не существует группы с номером {num}");
                return null;
            }
            return groups.ElementAt(num);
        }

        private T GetParam<T>(string str)
        {
            var par = str.Split(' ')[1];
            if (typeof(T) == typeof(int))
            {
                return (T)Convert.ChangeType(int.Parse(par), TypeCode.Int32);
            }
            throw new NotImplementedException();
        }

        private string CreateStartMessage(ProcessorContext ctx)
        {
            var sb = new StringBuilder();
            StatisticsMessage(ctx, sb);
            sb.AppendLine();
            sb.AppendLine(@"Группы паттернов для тренировки:");
            var groups = ctx.Services.Repository.GetGroups();

            var i = 1;
            foreach (var group in groups)
            {
                sb.AppendLine($"\t [{i++}] {group.Name}");
            }

            sb.AppendLine("Чтобы начать тренировку новых паттернов введите команду /tr номер_группы. Пример: /tr 1");
            sb.AppendLine("Чтобы узнать описание каждой группы введите коменду /grinfo");

            return sb.ToString();
        }

        private void StatisticsMessage(ProcessorContext ctx, StringBuilder sb)
        {
            sb.AppendLine("=Ваша статистика=");
            sb.AppendLine($"Паттернов выучено: {0}");
            sb.AppendLine($"Паттернов в ожидании: {0}");
        }

    }
}
