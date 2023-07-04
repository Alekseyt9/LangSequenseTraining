
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Helpers
{
    public static class ExRepeatHelper
    {

        public static string GetRepeatTimeText(TimeSpan span)
        {
            if (span.Days < 1)
            {
                return "в течении суток";
            }
            if (span.Days >= 1 && span.Days < 7)
            {
                return $"через {span.Days} {GrammarHelper.NumDeclination(span.Days, new[] { "день", "дня", "дней" })}";
            }
            if (span.Days >= 7 && span.Days < 30)
            {
                return $"через {span.Days / 7} {GrammarHelper.NumDeclination(span.Days / 7, new[] { "неделя", "недели", "недель" })}";
            }
            if (span.Days >= 30)
            {
                return $"через {span.Days / 30} {GrammarHelper.NumDeclination(span.Days / 30, new[] { "месяц", "месяца", "месяцев" })}";
            }

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
                    var res = DateTime.Now - x.LastUpdateTime >= ExRepeatHelper.StageToTimeSpan(x.Stage);
                    if (res)
                    {

                    }

                    return res;
                }
                else
                {
                    var res = DateTime.Now - x.LastUpdateTime >= new TimeSpan(1, 0, 0, 0);
                    if (res)
                    {

                    }
                    // повтор через сутки
                    return res;
                }
            }).ToList();
        }

    }
}
