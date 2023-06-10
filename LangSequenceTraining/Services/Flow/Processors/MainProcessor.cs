
using System.Text;
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    [Processor("main")]
    internal class MainProcessor : IProcessor
    {
        public void Process(ProcessorContext ctx, ProcessorStateBase procState, TransitionMessageBase trMsg)
        {
            var state = (MainProcessorState)procState;


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
                    var sound = await ctx.Services.TextToSpeech.SynthesizeSpeech(seq.Text);
                    /*var file = new FileData()
                    {
                        Stream = sound,
                        Name = $"speech{j++}.mp4"
                    };*/
                    ctx.SendMessage($"\t {seq.Text}"/*, file*/);
                }
            }
        }

        private void ProcessStartTr(ProcessorContext ctx)
        {
            var grNum = GetParam<int>(ctx.State.Message);
            var gr = GetGroupByNum(ctx, grNum);

            ctx.Services.ProcessorManager.DoTransition(ctx, "tr1", new ExtTransitionMessage());
        }

        private IEnumerable<Sequence> GetSequencesForTr(SequenceGroup gr)
        {
            // todo учитывать освоенные и на созревании
            return null;
        }

        private SequenceGroup GetGroupByNum(ProcessorContext ctx, int num)
        {
            return null;
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
            sb.AppendLine($"паттернов на созревании: {0}");
        }

    }
}
