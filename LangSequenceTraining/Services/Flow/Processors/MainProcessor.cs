
using System.Text;
using LangSequenceTraining.Helpers;
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    [Processor("main")]
    internal class MainProcessor : IProcessor
    {
        public Task Process(ProcessorContext ctx, TransitionMessageBase trMsg)
        {
            var state = (MainProcessorState)ctx.State.CurProcState;
            if (state == null)
            {
                state = new MainProcessorState()
                {
                    ExStates = new List<MainExState>(),
                    StateKind = MainStateKind.Start
                };
            }

            if (state.StateKind == MainStateKind.Start)
            {
                if (ctx.State.Message.StartsWith("/start"))
                {
                    var msg = CreateStartMessage(ctx);
                    ctx.SendMessage(msg);
                }

                if (ctx.State.Message.StartsWith("/tr"))
                {
                    ProcessStartTr(ctx);
                }

                if (ctx.State.Message.StartsWith("/grinfo"))
                {
                    ProcessGrInfo(ctx);
                }

                return Task.CompletedTask;
            }

            if (state.StateKind == MainStateKind.InExercise)
            {
                var tr = (MainTransitionMessage)trMsg;
                var hist = state.ExStates;
                hist.Add(new MainExState()
                {
                    ExName = tr.ExName,
                    IsCorrect = tr.CheckResult,
                    Sequence = tr.Sequence
                });

                var seqs = state.CurSequences;
                var nextCh = ExChoiceHelper.GetNextEx(hist, seqs, new List<string>() { "ex1" });
                if (nextCh.IsFinish)
                {
                    SendExResult(ctx, hist);
                    SaveExResult(ctx, hist);
                    state.StateKind = MainStateKind.Start;
                    ctx.DoTransition("main", null);
                }
                else
                {
                    ctx.DoTransition(nextCh.ExName, new ExtTransitionMessage()
                    {
                        Sequence = nextCh.Sequence
                    });
                }
            }

            return Task.CompletedTask;
        }

        private void SaveExResult(ProcessorContext ctx, List<MainExState> hist)
        {
            var resultInfos = new List<TrainingResult>();
            var seqMap = new Dictionary<Guid, bool>();

            foreach (var h in hist)
            {
                seqMap.TryAdd(h.Sequence.Id, true);
                if (!h.IsCorrect)
                {
                    seqMap[h.Sequence.Id] = false;
                }
            }

            ctx.Services.LearningService.SaveResult(ctx.State.UserId, resultInfos);
        }

        private void SendExResult(ProcessorContext ctx, List<MainExState> hist)
        {
            var sb = new StringBuilder();
            sb.AppendLine("Результат упражнений");

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

            ctx.SendMessage(sb.ToString());
        }

        private async Task ProcessGrInfo(ProcessorContext ctx)
        {
            var groups = ctx.Services.Repository.GetGroups();
            var i = 1;

            foreach (var group in groups)
            {
                ctx.SendMessage($"[{i++}] {group.Name} ({group.Description})");
                var seqs = ctx.Services.Repository.GetSequences(group.Name);
                var j = 1;

                foreach (var seq in seqs)
                {
                    ctx.SendMessage($"\t {seq.Text}");
                }
            }
        }

        private void ProcessStartTr(ProcessorContext ctx)
        {
            var grNum = GetParam<int>(ctx.State.Message);
            var gr = GetGroupByNum(ctx, grNum - 1);
            if (gr == null)
            {
                return;
            }

            var state = (MainProcessorState)ctx.State.CurProcState;
            state.CurSequences = new List<Sequence>(GetSequencesForTr(gr));
            var nextCh = ExChoiceHelper.GetNextEx(state.ExStates, state.CurSequences, new List<string>() { "ex1" });

            ctx.Services.ProcessorManager.DoTransition(ctx, nextCh.ExName, new ExtTransitionMessage()
            {
                Sequence = nextCh.Sequence
            });
        }

        private IEnumerable<Sequence> GetSequencesForTr(SequenceGroup gr)
        {
            throw new NotImplementedException();
        }

        private SequenceGroup GetGroupByNum(ProcessorContext ctx, int num)
        {
            var groups = ctx.Services.Repository.GetGroups()
                .Where(x => !x.IsHide).OrderBy(x => x.Order).ToList();
            if (num > groups.Count - 1)
            {
                ctx.SendMessage($"Ошибка: не существует группы с номером {num}");
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
            sb.AppendLine($"паттернов выучено: {0}");
            sb.AppendLine($"паттернов в ожидании: {0}");
        }

    }
}
