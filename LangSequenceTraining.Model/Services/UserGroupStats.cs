

namespace LangSequenceTraining.Model
{
    public class UserGroupStats
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public int GroupOrder { get; set; }

        public int NewCount { get; set; }

        public int Repeat { get; set; }

        public int WaitingCount { get; set; }

        public int FinishCount { get; set; }
    }
}
