
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Helpers
{
    public static class ExRepeatHelper
    {

        public static string GetRepeatTimeText(TimeSpan? span)
        {
            if (span.Value.Days < 1)
                return "в течении суток";
            if (span.Value.Days > 1 && span.Value.Days < 7)
                return $"через {span.Value.Days} {GrammarHelper.NumDeclination(span.Value.Days, new[] { "день", "дня", "дней" })}";
            if (span.Value.Days > 7 && span.Value.Days < 30)
                return $"через {span.Value.Days / 7} {GrammarHelper.NumDeclination(span.Value.Days / 7, new[] { "неделя", "недели", "недель" })}";
            if (span.Value.Days > 30)
                return $"через {span.Value.Days / 30} {GrammarHelper.NumDeclination(span.Value.Days / 30, new[] { "месяц", "месяца", "месяцев" })}";

            throw new ArgumentException();
        }

        public static TimeSpan StageToTimeSpan(ProgressStage stage)
        {
            switch (stage)
            {
                case ProgressStage.OneDay:
                    return TimeSpan.FromDays(1);
                case ProgressStage.ThreeDays:
                    return TimeSpan.FromDays(3);
                case ProgressStage.OneWeek:
                    return TimeSpan.FromDays(7);
                case ProgressStage.Month:
                    return TimeSpan.FromDays(30);
                case ProgressStage.ThreeMonths:
                    return TimeSpan.FromDays(90);
            }

            throw new ArgumentException();
        }

        public static List<UserSequenceProgress> GetRepItems(IEnumerable<UserSequenceProgress> items)
        {
            return items.Where(x =>
            {
                if (x.LastSuccess)
                {
                    return DateTime.Now - x.LastUpdateTime >= ExRepeatHelper.StageToTimeSpan(x.Stage);
                }
                else
                {
                    // повтор через сутки
                    return DateTime.Now - x.LastUpdateTime >= new TimeSpan(1, 0, 0);
                }
            }).ToList();
        }

    }
}
