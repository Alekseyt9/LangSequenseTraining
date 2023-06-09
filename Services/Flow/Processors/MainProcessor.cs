
using System.Text;

namespace LangSequenceTraining.Services
{
    [Processor("main")]
    internal class MainProcessor : IProcessor
    {
        public void Process(ProcessorContext ctx)
        {
            if (ctx.Message.StartsWith("/start"))
            {
                var msg = CreateStartMessage(ctx);
                ctx.SendMessage(msg);
            }

            if (ctx.Message.StartsWith("/tr"))
            {
                ctx.Services.ProcessorManager.DoTransition("tr1", new Ex1ProcessorState());
            }

            if (ctx.Message.StartsWith("/grinfo"))
            {

            }
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
