

namespace LangSequenceTraining.Model
{
    public class SequenceGroup
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public bool IsHide { get; set; }

        public int Order { get; set; }
    }
}
